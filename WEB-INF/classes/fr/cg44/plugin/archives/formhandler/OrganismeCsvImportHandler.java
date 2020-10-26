package fr.cg44.plugin.archives.formhandler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import java.nio.charset.StandardCharsets;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.log4j.Logger;

import com.jalios.jcms.Category;
import com.jalios.jcms.Channel;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.context.JcmsMessage;
import com.jalios.jcms.context.JcmsMessage.Level;
import com.jalios.jcms.handler.EditDataHandler;
import com.jalios.jcms.upload.DocUploadInfo;
import com.jalios.util.Util;

import generated.Contact;
import generated.FicheLieu;

/**
 * Import des fiches lieux d'organisme et association à leur contacts
 *
 */
public class OrganismeCsvImportHandler extends EditDataHandler {

  private static final Logger LOGGER = Logger.getLogger(OrganismeCsvImportHandler.class);

  final private String CSV_SPLIT = ";";

  protected File csvFile;
  protected boolean opUpload;

  @Override
  public Class<? extends Data> getDataClass() {
    return null;
  }


  public boolean processAction() throws IOException {       
    if(this.opUpload && validateUpload()) {
      importOrganisme();
    }   
    return false;    
  }


  /**
   * Vérifie si le fichier csv upload est correct
   * @return true si le fichier est correct
   * @throws IOException 
   */
  public boolean validateUpload() throws IOException {
    ControllerStatus controllerStatus = new ControllerStatus();
    // Fichier absent
    if(csvFile == null || !csvFile.exists()) {    
      controllerStatus.setProp("msg.edit.empty-field", new Object[] { "fichier csv" });
      processStatus(controllerStatus);
      return false;
    }
    // Fichier format incorrect
    if(!"csv".equalsIgnoreCase(FilenameUtils.getExtension(csvFile.getName()))) {
      controllerStatus.setMessage("Le format du fichier est incorrect, celui-ci doit être un <strong>.csv</strong>");
      processStatus(controllerStatus);
      deleteCsvFile();
      return false;
    }
    return true;
  }


  /**
   * Importe les organisme du fichier csv dans JCMS
   * @throws IOException
   */
  private void importOrganisme() throws IOException {
    Category organismeClassementCat = channel.getCategory("$jcmsplugin.archives.import.organisme.classement.root");
    Category organismeNavigationCat = channel.getCategory("$jcmsplugin.archives.import.organisme.navigation.root");
    String line = "";
    FileReader fileReader = new FileReader(csvFile, StandardCharsets.UTF_8);
    BufferedReader br = new BufferedReader(fileReader);
    int cpt = 0;
    StringBuffer msgWarn = new StringBuffer();
    int nbOrganismeImpote = 0;
    while ((line = br.readLine()) != null) {     
      cpt++;
      // Ignore la première ligne du CSV (déclaration des colonnes)
      if(cpt == 1) {
        continue;
      }      
      String[] itData = line.split(";");     
      if(Util.notEmpty(itData) && itData.length == 3) {

        String itOrganisme = itData[0];
        String itMail = itData[1];
        String itContactId = itData[2];

        Contact itContact = (Contact) channel.getPublication(itContactId.trim());
        if(Util.isEmpty(itContact)) {
          msgWarn.append("Impossible d'importer la ligne " + cpt + ", contact introuvable dans JCMS : " + itContactId + "</br>");    
        } else {
          
          FicheLieu itFicheLieu = new FicheLieu();
          itFicheLieu.setAuthor(channel.getDefaultAdmin());
          itFicheLieu.setTitle(itOrganisme);
          itFicheLieu.setEmail(new String[]{itMail});
          itFicheLieu.setCategories(new Category[]{organismeClassementCat, organismeNavigationCat});
          
          Contact itContactClone = (Contact) itContact.getUpdateInstance();        
          FicheLieu[] itContactFiche =  itContactClone.getContactPourLesFichesLieux();
          FicheLieu[] itContactFicheNew = (FicheLieu[]) (ArrayUtils.add(itContactFiche, itFicheLieu));         
          itContactClone.setContactPourLesFichesLieux(itContactFicheNew);         
          itContactClone.performUpdate(channel.getDefaultAdmin());
          
          nbOrganismeImpote++;
        }

      } else {
        msgWarn.append("Impossible d'importer la ligne " + cpt + ", nombre de colonnes incorrectes : " + line + "</br>");        
      }      
    }
    Channel.getChannel().getCurrentJcmsContext().addMsgSession(new JcmsMessage(Level.INFO, nbOrganismeImpote + " organismes importés"));
    if(Util.notEmpty(msgWarn)) {
      Channel.getChannel().getCurrentJcmsContext().addMsgSession(new JcmsMessage(Level.WARN, msgWarn.toString()));
    }
  }


  /**
   * Supprime le fichier csv
   */
  private void deleteCsvFile() {
    if ((this.csvFile == null) || (!this.csvFile.exists())) {
      return;
    }
    if (!this.csvFile.delete()) {
      LOGGER.warn("Le fichier csv d'import n'a pas pu être supprimé : " + this.csvFile.getAbsolutePath());
    }
  }


  public void setFile(String[] files) { 
    DocUploadInfo doc = (DocUploadInfo) channel.getCurrentJcmsContext().getUploadedFile("file", false, true);
    if(doc != null) {      
      this.csvFile  = doc.getFile();
    }
  }


  public void setOpUpload(String paramString) {
    this.opUpload = true;
  }

}
