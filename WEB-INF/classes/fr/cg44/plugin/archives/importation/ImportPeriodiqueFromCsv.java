package fr.cg44.plugin.archives.importation;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;

import com.csvreader.CsvReader;
import com.jalios.jcms.Category;
import com.jalios.jcms.Channel;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Publication;
import com.jalios.jcms.context.JcmsMessage;
import com.jalios.util.Util;

import fr.cg44.plugin.socle.SocleUtils;
import generated.City;
import generated.Periodique;

public class ImportPeriodiqueFromCsv {
    
    private static CsvReader csvReader;
    private static final char SEPARATOR = ';';
    private static final String doubleHashtag = "##";
    private static final Logger LOGGER = Logger.getLogger(ImportPeriodiqueFromCsv.class);
    private static String encoding = "UTF-8";
    protected static final Channel channel = Channel.getChannel();
    
    /*
     * Liste des valeurs attendues dans le CSV
     * 0 Titre - String - obligatoire
     * 1 Cote de périodique - String - obligatoire
     * 2 Dates extrêmes de la collection - String - Obligatoire
     * 3 Dates extrêmes de la collection numérisée - String
     * 4 Fréquence parution - Category - Obligatoire
     * 5 Notes - String
     * 6 Siège du journal - City
     * 7 Numérisé - boolean oui/non
     * 8 Thème - Category[] - Obligatoire
     * 9 Tendances politiques - Category[]
     * 10 Période - Category[] - Obligatoire
     * 11 Communes concernées - City[]
     * 12 Toutes les communes du département - boolean oui/non
     */
    
    /**
     * Va renvoyer différents logs informatifs pour informer l'utilisateur
     * de l'état du CSV et des lignes en erreur
     * sans effectuer d'import de données
     */
    public static Map<String, String> checkCsvImport(FileItem fileItem) {
        Map<String, String> returnedLog = new TreeMap<>();
        
        if (!fileIsNotCorrectCsv(fileItem)) {
            try {
                csvReader = new CsvReader(new InputStreamReader(fileItem.getInputStream(),encoding), SEPARATOR);
                String[] values;
                int cpt = 2;
                StringBuilder lineLog;
                boolean skippedFirst = false;
                while (csvReader.readRecord()){
                    /*
                     * Champs à surveiller :
                     * 
                     * 0 Titre - String - obligatoire
                     * 1 Cote de périodique - String - obligatoire
                     * 2 Dates extrêmes de la collection - String - Obligatoire
                     * 4 Fréquence parution - Category - Obligatoire
                     * 6 Siège du journal - City
                     * 8 Thème - Category[] - Obligatoire
                     * 9 Tendances politiques - Category[]
                     * 10 Période - Category[] - Obligatoire
                     * 11 Communes concernées - City[]
                     */
                    lineLog = new StringBuilder();
                    values = csvReader.getValues();
                    if (values.length != 20) {
                        channel.getCurrentJcmsContext().addMsgSession(new JcmsMessage(JcmsMessage.Level.ERROR, "Le fichier CSV doit avoir 20 colonnes, et il n'en a que " + values.length));
                        break;
                    }
                    if (!skippedFirst) { // ne pas lire la ligne des headers
                        skippedFirst = true;
                        continue;
                    }
                    if (Util.isEmpty(values[0])) { // titre
                        lineLog.append("Le titre (champ obligatoire) est vide. # ");
                    }
                    if (Util.isEmpty(values[1])) { // cote de périodique
                        lineLog.append("La cote de périodique (champ obligatoire) est vide. # ");
                    }
                    if (Util.isEmpty(values[2])) { // dates extrêmes de la collection
                        lineLog.append("Les dates extrêmes de la collection (champ obligatoire) sont vides. # ");
                    }
                    if (Util.notEmpty(values[4]) ? !categoryCheck(values[6], channel.getCategory("$jcmsplugin.archives.category.periodique.frequenceparution")) : false) { // Fréquence parution
                        lineLog.append("Le champ Fréquence parution présente une catégorie incorrecte (mauvaise branche ou ID n'existant pas) # ");
                    }
                    if (Util.notEmpty(values[6]) ? !contentCheck(values[6],City.class) : false) { // Siège du journal
                        lineLog.append("Le champ Siège du journal présente un contenu incorrect (il n'existe pas ou ne pointe pas sur une commune) # ");
                    }
                    if (Util.notEmpty(values[8]) ? !categoryCheck(values[8], channel.getCategory("$jcmsplugin.archives.category.periodique.theme")) : false) { // Thème
                        lineLog.append("Le champ Thème présente une ou des catégories incorrectes (mauvaise branche ou IDs n'existant pas) # ");
                    }
                    if (Util.notEmpty(values[9]) ? !categoryCheck(values[9], channel.getCategory("$jcmsplugin.archives.category.periodique.tendancespolitiques")) : false) { // Tendances politiques
                        lineLog.append("Le champ Tendances politiques présente une ou des catégories incorrectes (mauvaise branche ou IDs n'existant pas) # ");
                    }
                    if (Util.notEmpty(values[10]) ? !categoryCheck(values[10], channel.getCategory("$jcmsplugin.archives.category.periodique.periode")) : false) { // Période
                        lineLog.append("Le champ Période présente une ou des catégories incorrectes (mauvaise branche ou IDs n'existant pas) # ");
                    }
                    if (Util.notEmpty(values[11]) ? !communeCheck(values[11]) : false) { // Communes concernées
                        lineLog.append("Le champ Communes concernées présente des contenus incorrects (un ou plusieurs contenus n'existent pas / ne sont pas des Communes) # ");
                    }
                    
                    Periodique itPeriodique = generatePeriodiqueFromCsvValues(values);
                    
                    ControllerStatus status = itPeriodique.checkCreate(channel.getCurrentLoggedMember());
                    if (!status.isOK()) {
                        lineLog.append(status.getMessage(channel.getCurrentUserLang()));   
                    }
                    
                    if (Util.notEmpty(lineLog.toString())) {
                        returnedLog.put("Ligne " + (cpt), lineLog.toString());
                    }
                    
                    cpt++;
                }
            } catch (IOException e) {
                channel.getCurrentJcmsContext().addMsgSession(new JcmsMessage(JcmsMessage.Level.ERROR, "Erreur lors de la lecture du CSV : " + e.getMessage()));
                return null;
            }
            
            channel.getCurrentJcmsContext().addMsgSession(new JcmsMessage(JcmsMessage.Level.SUCCESS, "Le fichier CSV est correct !"));
            
            return returnedLog;
        }
        
        channel.getCurrentJcmsContext().addMsgSession(new JcmsMessage(JcmsMessage.Level.ERROR, "Erreur lors de la lecture du CSV : format incorrect."));
        
        return null;
    }

    /**
     * Vérifie si une liste d'IDs de contenus représente une liste correcte de contenus
     * Incorrect si un contenu n'existe pas ou n'est pas du type indiqué
     * @param string
     * @param type
     * @return
     */
    private static boolean contentCheck(String idsStr, Class<?> itClass) {
        if (Util.isEmpty(idsStr)) return false;
        
        String[] ids = idsStr.split(doubleHashtag);
        for (int counter = 0; counter < ids.length; counter++) {
            Publication itPub = channel.getPublication(ids[counter]);
            if (Util.isEmpty(itPub) || !itClass.isInstance(itPub)) return false;
        }
        return true;
    }
    
    /**
     * Vérifie si une liste d'IDs de contenu ou de noms de communes correspond bien
     * à des communes
     * @param idsStr
     * @return
     */
    private static boolean communeCheck(String idsStr) {
        if (Util.isEmpty(idsStr)) return false;
        
        String[] ids = idsStr.split(doubleHashtag);
        for (int counter = 0; counter < ids.length; counter++) {
            Publication itPub = null;
            if (NumberUtils.isNumber(ids[counter])) {
                itPub = channel.getPublication(ids[counter]);itPub = channel.getPublication(ids[counter]);
            } else {
                itPub = SocleUtils.getCommuneFromName(ids[counter]);
            }
            if (Util.isEmpty(itPub) || !City.class.isInstance(itPub)) return false;
        }
        return true;
    }

    /**
     * Vérifie si une liste d'IDs de catégorie représente une liste correcte de catégories
     * Incorrect si une catégorie n'existe pas ou si la branche d'une catégorie est incorrecte
     * @param string
     * @return
     */
    private static boolean categoryCheck(String cidsStr, Category ancestorCat) {
        if (Util.isEmpty(cidsStr)) return false;
        
        String[] cids = cidsStr.split(doubleHashtag);
        for (int counter = 0; counter < cids.length; counter++) {
            Category itCat = channel.getCategory(cids[counter]);
            if (Util.isEmpty(itCat) || !SocleUtils.catHasAncestor(itCat, ancestorCat)) return false;
        }
        return true;
    }

    private static boolean fileIsNotCorrectCsv(FileItem fileItem) {
        boolean result = false;
        String message = "";
        String trace = "";

        try {
            csvReader = new CsvReader(new InputStreamReader(fileItem.getInputStream(),encoding), SEPARATOR);
            String[] values;
            int cpt = 1;
            // On vérifie le nombre de colonnes
            while (csvReader.readRecord()){
                values = csvReader.getValues();
                if(values.length != 20){
                    trace += "Le fichier contient une ligne incorrecte [ligne " + cpt + "], nombre de colonnes différent de 26 \r\n" + csvReader.getRawRecord() + "\r\n";
                    result = true;
                }
                cpt++;
            }
            csvReader.close();
            if(result){
                message = "Le fichier contient des lignes en erreur.";
                channel.getCurrentJcmsContext().addMsgSession(new JcmsMessage(JcmsMessage.Level.ERROR, message));
            }
            else{
                result = false;
                message = "La syntaxe du fichier est correcte.";
                channel.getCurrentJcmsContext().addMsgSession(new JcmsMessage(JcmsMessage.Level.INFO, message));
            }
            
        } catch (FileNotFoundException e) {
            result = true;
            message = "Impossible de trouver le fichier";
            channel.getCurrentJcmsContext().addMsgSession(new JcmsMessage(JcmsMessage.Level.ERROR, message));
        } catch (IOException e) {
            result = true;
            message = "Erreur lors de la lecture du fichier";
            channel.getCurrentJcmsContext().addMsgSession(new JcmsMessage(JcmsMessage.Level.ERROR, message));
            channel.getCurrentJcmsContext().getRequest().setAttribute("traceImport", e);
        } 
        channel.getCurrentJcmsContext().getRequest().setAttribute("traceImport", trace);
        return result;
    }
    
    /**
     * Générer une fiche lieu à partir des valeurs d'une ligne CSV
     * @param values
     */
    private static Periodique generatePeriodiqueFromCsvValues(String[] values) {
        
        Periodique itPeriodique = new Periodique();
        // Titre
        itPeriodique.setTitle(values[0]);
        
        // Cote de périodique
        itPeriodique.setCoteDePeriodique(values[1]);
        // Dates extrêmes de la collection 
        itPeriodique.setDatesExtremesDeLaCollection(values[2]);
        // Dates extrêmes de la collection numérisée
        if (Util.notEmpty(values[3])) {
            itPeriodique.setTexteAlternatif(values[3]);
        }
        // Fréquence parution
        itPeriodique.addCategory(channel.getCategory(values[4]));
        // Notes
        if (Util.notEmpty(values[5])) {
            itPeriodique.setNotes(values[5]);
        }
        // Siège
        if (Util.notEmpty(values[6])) {
            itPeriodique.setSiegeDuJournal(channel.getData(City.class, values[6]));
        }
        // Numérisé
        itPeriodique.setNumerise("oui".equalsIgnoreCase(values[7]));
        // Thème
        for (String itCid : values[8].split(doubleHashtag)) {
            itPeriodique.addCategory(channel.getCategory(itCid));
        }
        // Tendances politiques
        if (Util.notEmpty(values[9])) {
            for (String itCid : values[9].split(doubleHashtag)) {
                itPeriodique.addCategory(channel.getCategory(itCid));
            }
        }
        // Période
        for (String itCid : values[10].split(doubleHashtag)) {
            itPeriodique.addCategory(channel.getCategory(itCid));
        }
        // Communes concernées
        if (Util.notEmpty(values[11])) {
            List<City> communes = new ArrayList<>();
            for (String itId : values[11].split(doubleHashtag)) {
                if (NumberUtils.isNumber(itId)) {
                    communes.add(channel.getData(City.class, itId));
                } else {
                    communes.add(SocleUtils.getCommuneFromName(itId));
                }
            }
            itPeriodique.setCommunesConcernees(communes.toArray(new City[communes.size()]));
        }
        // Toutes les communes
        itPeriodique.setToutesLesCommunesDuDepartement("oui".equalsIgnoreCase(values[12]));
        
        itPeriodique.setAuthor(channel.getCurrentLoggedMember());
        
        return itPeriodique;
    }
    
    /**
     * Procéder à l'import de fiches lieu via CSV
     * Assume que le fichier a été vérifié au préalable
     * @param fileItem
     */
    public static void importPeriodiquesCsv(FileItem fileItem) {
        
        List<Periodique> periodiquesToCreate = new ArrayList<Periodique>();
        
        try {
            csvReader = new CsvReader(new InputStreamReader(fileItem.getInputStream(),encoding), SEPARATOR);
            String[] values;
            boolean skippedFirst = false;
            while (csvReader.readRecord()){
                if (!skippedFirst) { // ne pas lire la ligne des headers
                    skippedFirst = true;
                    continue;
                }

                values = csvReader.getValues();
                
                periodiquesToCreate.add(generatePeriodiqueFromCsvValues(values));
            }
            
        } catch (Exception e) {
            channel.getCurrentJcmsContext().addMsgSession(new JcmsMessage(JcmsMessage.Level.ERROR, "Erreur lors de la lecture du CSV : " + e.getMessage()));
            LOGGER.error("Erreur sur importFichesLieuCsv : " + e.getMessage());
        }
        
        int counterImported = 0;
        
        for (Periodique itPeriodique : periodiquesToCreate) {
            ControllerStatus importStatus = itPeriodique.checkAndPerformCreate(channel.getCurrentLoggedMember());
            if (!importStatus.isOK()) {
                LOGGER.warn("Anomalie lors de l'import du lieu " + itPeriodique.getTitle() + " : " + importStatus.getMessage(channel.getCurrentUserLang()));
            } else {
                counterImported++;
            }
        }
        
        if (counterImported == periodiquesToCreate.size()) {        
            channel.getCurrentJcmsContext().addMsgSession(new JcmsMessage(JcmsMessage.Level.SUCCESS, "Un total de " + periodiquesToCreate.size() + " fiches lieux ont été créées."));
        } else {
            channel.getCurrentJcmsContext().addMsgSession(new JcmsMessage(JcmsMessage.Level.WARN, "Un total de " + counterImported
                + " fiches lieux ont été créées sur les " + periodiquesToCreate.size() + " possibles. Veuillez inspecter les logs.")); 
        }
    }
}