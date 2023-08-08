package fr.cg44.plugin.archives;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.apache.log4j.Logger;

import com.jalios.jcms.Channel;
import com.jalios.jcms.JcmsUtil;
import com.jalios.util.Util;

import fr.cg44.plugin.socle.MailUtils;
import fr.cg44.plugin.socle.SocleUtils;
import generated.AutreRechercheForm;
import generated.CommunicationForm;
import generated.RechercheJugementForm;

import fr.cg44.plugin.socle.MailUtils;

public final class ArchivesMailUtils {
  private static Channel channel = Channel.getChannel();

  private static final Logger LOGGER = Logger.getLogger(ArchivesMailUtils.class);

  private ArchivesMailUtils() {
    throw new IllegalStateException("Utility class");
  }

  /**
   * Envoi de l'email du formulaire de communication administrative (site Archives)
   */
  public static boolean envoiMailCommunicationAdministrativeArchives(CommunicationForm form) {
    
    boolean result = false;
    String jsp = "/plugins/SoclePlugin/jsp/mail/formulaireArchivesCommunicationAdministrativeTemplate.jsp";
    String date = SocleUtils.formatDate("dd/MM/yy HH:mm", new Date());
    
    // Objet
    String objet = JcmsUtil.glpd("jcmsplugin.archives.email.communication.objet");
    
    // Destinataire / emetteur
    String emailTo = channel.getProperty("jcmsplugin.archives.form.mailTo");
    String emailFrom = channel.getProperty("jcmsplugin.archives.form.from");
    
    // CC
    ArrayList<String> listeEmailCC = new ArrayList<>();
    if(Util.notEmpty(form.getCourriel())){
      listeEmailCC.add(form.getCourriel());
    }
    
    // Contenu
    HashMap<Object, Object> parametersMap = new HashMap<Object, Object>();
    parametersMap.put("nom", form.getNom());
    parametersMap.put("prenom", form.getPrenom());
    parametersMap.put("administration", form.getAdministration());
    parametersMap.put("direction", form.getDirection());
    parametersMap.put("service", form.getServiceUnite());
    parametersMap.put("adresse", form.getAdresse());
    parametersMap.put("complementAdresse", form.getComplementDadresse());
    parametersMap.put("codePostal", form.getCodePostal());
    parametersMap.put("ville", form.getVille());
    parametersMap.put("telephone", form.getTelephone());
    parametersMap.put("courriel", form.getCourriel());
    parametersMap.put("versement", form.getNumeroDeVersement());
    parametersMap.put("dossier", form.getNumeroDuDossier());
    parametersMap.put("natureRecherche", form.getNatureDeLaRecherche());
    parametersMap.put("dateVersement", form.getDateDeVersement());
    parametersMap.put("dateRetour", form.getRetourDuDossierPrevuLe());
    parametersMap.put("date", date);

    if (Util.notEmpty(emailFrom) && Util.notEmpty(emailTo)) {
      try {
        MailUtils.sendMail(objet, null, emailFrom, emailTo, listeEmailCC, null, jsp, parametersMap);
        result = true;
      } catch (Exception e) {
        result = false;
        LOGGER.error("Formulaire de communication administrative - Erreur lors de l'envoi du mail : " + e.getMessage());
      }

    } else {
      result = false;
      LOGGER.error("Formulaire de communication administrative - Paramètres d'envois (emetteur / destinataire) non définis.");
    }

    return result;
  }    

  /**
   * Envoi de l'email du formulaire de recherche de jugement (site Archives)
   */
  public static boolean envoiMailRechercheJugementArchives(RechercheJugementForm form) {
    
    boolean result = false;
    String jsp = "/plugins/SoclePlugin/jsp/mail/formulaireArchivesRechercheJugementTemplate.jsp";
    String date = SocleUtils.formatDate("dd/MM/yy HH:mm", new Date());
    
    // Objet
    String objet = JcmsUtil.glpd("jcmsplugin.archives.email.jugement.objet");
    
    // Destinataire / emetteur
    String emailTo = channel.getProperty("jcmsplugin.archives.form.mailTo");
    String emailFrom = channel.getProperty("jcmsplugin.archives.form.from");
    
    // CC
    ArrayList<String> listeEmailCC = new ArrayList<>();
    if(Util.notEmpty(form.getCourriel())){
      listeEmailCC.add(form.getCourriel());
    }
    
    // Contenu
    HashMap<Object, Object> parametersMap = new HashMap<Object, Object>();
    parametersMap.put("nom", form.getNom());
    parametersMap.put("prenom", form.getPrenom());
    parametersMap.put("adresse", form.getAdresse());
    parametersMap.put("complementAdresse", form.getComplementDadresse());
    parametersMap.put("codePostal", form.getCodePostal());
    parametersMap.put("ville", form.getVille());
    parametersMap.put("telephone", form.getTelephone());
    parametersMap.put("courriel", form.getCourriel());
    parametersMap.put("anneeJugement", form.getAnneeJugement());
    parametersMap.put("dateJugement", form.getDateJugement());
    parametersMap.put("lieuJugement", form.getLieuJugement());
    parametersMap.put("nomPersonne1", form.getNomPersonne1());
    parametersMap.put("prenomPersonne1", form.getPrenomPersonne1());
    parametersMap.put("nomPersonne2", form.getNomPersonne2());
    parametersMap.put("prenomPersonne2", form.getPrenomPersonne2());
    parametersMap.put("motifJugement", form.getMotifJugement());
    parametersMap.put("autreMotifJugement", form.getAutreMotifJugement());
    parametersMap.put("motivations", form.getMotivations());
    parametersMap.put("date", date);

    if (Util.notEmpty(emailFrom) && Util.notEmpty(emailTo)) {
      try {
        MailUtils.sendMail(objet, null, emailFrom, emailTo, listeEmailCC, null, jsp, parametersMap);
        result = true;
      } catch (Exception e) {
        result = false;
        LOGGER.error("RechercheJugementForm - Erreur lors de l'envoi du mail : " + e.getMessage());
      }

    } else {
      result = false;
      LOGGER.error("RechercheJugementForm - Paramètres d'envois (emetteur / destinataire) non définis.");
    }

    return result;
  }
  
  /**
   * Envoi de l'email du formulaire autre recherche (site Archives)
   */
  public static boolean envoiMailAutreRechercheArchives(AutreRechercheForm form, ArrayList<File> fichiers) {
    
    boolean result = false;
    String jsp = "/plugins/SoclePlugin/jsp/mail/formulaireArchivesAutreRechercheTemplate.jsp";
    String date = SocleUtils.formatDate("dd/MM/yy HH:mm", new Date());
    
    // Objet
    String objet = JcmsUtil.glpd("jcmsplugin.archives.email.autre-recherche.objet");
    
    // Destinataire / emetteur
    String emailTo = channel.getProperty("jcmsplugin.archives.form.mailTo");
    String emailFrom = channel.getProperty("jcmsplugin.archives.form.from");
    
    // CC
    ArrayList<String> listeEmailCC = new ArrayList<>();
    if(Util.notEmpty(form.getCourriel())){
      listeEmailCC.add(form.getCourriel());
    }
    
    // Contenu
    HashMap<Object, Object> parametersMap = new HashMap<Object, Object>();
    parametersMap.put("nom", form.getNom());
    parametersMap.put("prenom", form.getPrenom());
    parametersMap.put("adresse", form.getAdresse());
    parametersMap.put("complementAdresse", form.getComplementDadresse());
    parametersMap.put("codePostal", form.getCodePostal());
    parametersMap.put("ville", form.getVille());
    parametersMap.put("telephone", form.getTelephone());
    parametersMap.put("courriel", form.getCourriel());
    parametersMap.put("demande", form.getDemande());
    parametersMap.put("date", date);

    if (Util.notEmpty(emailFrom) && Util.notEmpty(emailTo)) {
      try {
        MailUtils.sendMail(objet, null, emailFrom, emailTo, listeEmailCC, fichiers, jsp, parametersMap);
        result = true;
      } catch (Exception e) {
        result = false;
        LOGGER.error("AutreRechercheForm - Erreur lors de l'envoi du mail : " + e.getMessage());
      }
      finally {
        if(result) {
          MailUtils.msgEnvoiMailContact();          
        }else {
          MailUtils.msgEchecEnvoiMailContact();
        }
      }

    } else {
      result = false;
      LOGGER.error("AutreRechercheForm - Paramètres d'envois (emetteur / destinataire) non définis.");
    }

    return result;
  }  

}
