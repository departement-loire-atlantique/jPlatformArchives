<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>

<%
String formAction = "plugins/SoclePlugin/jsp/forms/checkArchivesCommunicationAdministrative.jsp";
%>

<div class="ds44-loader-text visually-hidden" tabindex="-1" aria-live="polite"></div>
<div class="ds44-loader hidden">
    <div class="ds44-loader-body">
        <svg class="ds44-loader-circular" focusable="false" aria-hidden="true">
            <circle class="ds44-loader-path" cx="30" cy="30" r="20" fill="none" stroke-width="5" stroke-miterlimit="10"></circle>
        </svg>
    </div>
</div>

<article class="ds44-container-large ds44-mtb5">
    <div class="ds44-inner-container ds44-grid12-offset-1">
        <p class="ds44-textLegend ds44-textLegend--mentions"><%= glp("jcmsplugin.socle.facette.champs-obligatoires") %></p>
        <form data-is-ajax='true' data-is-inline="true" action='<%= formAction %>' method="post">
            <div class="ds44-mb3">
                <h2 class="h3-like"><%= glp("jcmsplugin.archives.form.communication.vous-etes") %></h2>
                <ul class="ds44-list grid-12">
                
                    <%-- Nom ------------------------------------------------------------ --%>
                    <% String nomLabel = glp("jcmsplugin.archives.form.communication.nom"); %>
                    <li class="col-6 ds44-minTiny-margin-r">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-nom" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= nomLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-nom" name="nom" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", nomLabel) %>" required autocomplete="family-name"/><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", nomLabel) %></span></button>
                            </div>
                        </div>
                    </li>
                    
                    <%-- Prenom ------------------------------------------------------------ --%>
                    <% String prenomLabel = glp("jcmsplugin.archives.form.communication.prenom"); %>
                    <li class="col-6 ds44-minTiny-margin-l">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-prenom" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= prenomLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-prenom" name="prenom" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", prenomLabel) %>" required autocomplete="given-name"/><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", prenomLabel) %></span></button>
                            </div>
                        </div>
                    </li>

                    <%-- Administration ------------------------------------------------------------ --%>
                    <% String administrationLabel = glp("jcmsplugin.archives.form.communication.administration"); %>
                    <li class="col-12">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-administration" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= administrationLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-administration" name="administration" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", administrationLabel) %>" required /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", administrationLabel) %></span></button>
                            </div>
                        </div>
                    </li>
                    
                    <%-- Direction ------------------------------------------------------------ --%>
                    <% String directionLabel = glp("jcmsplugin.archives.form.communication.direction"); %>
                    <li class="col-12">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-direction" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= directionLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-direction" name="direction" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", directionLabel) %>" required /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", directionLabel) %></span></button>
                            </div>
                        </div>
                    </li>

                    <%-- ServiceUnite ------------------------------------------------------------ --%>
                    <% String serviceLabel = glp("jcmsplugin.archives.form.communication.service"); %>
                    <li class="col-12">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-service" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= serviceLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-service" name="service" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", serviceLabel) %>" required /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", serviceLabel) %></span></button>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            
            <div class="ds44-mb3">
                <h2 class="h3-like"><%= glp("jcmsplugin.archives.form.communication.coordonnees") %></h2>
                <ul class="ds44-list grid-12">                    

                    <%-- Adresse ------------------------------------------------------------ --%>
                    <% String adresseLabel = glp("jcmsplugin.archives.form.communication.adresse"); %>
                    <li class="col-12">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-adresse" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= adresseLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-adresse" name="adresse" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", adresseLabel) %>"  required autocomplete="address-line1"    /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", adresseLabel) %></span></button>
                            </div>
                        </div>
                    </li>

                    <%-- ComplementDadresse ------------------------------------------------------------ --%>
                    <% String complementAdresseLabel = glp("jcmsplugin.archives.form.communication.complementAdresse"); %>
                    <li class="col-12">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-complementAdresse" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= complementAdresseLabel %></span></span></label>
                                <input type="text" id="form-element-complementAdresse" name="complementAdresse" class="ds44-inpStd"/><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", complementAdresseLabel) %></span></button>
                            </div>
                        </div>
                    </li>
                    
                    <%-- CodePostal ------------------------------------------------------------ --%>
                    <% String codePostalLabel = glp("jcmsplugin.archives.form.communication.codePostal"); %>
                    <li class="col-6 ds44-minTiny-margin-r">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-codePostal" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= codePostalLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-codePostal" name="codePostal" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", codePostalLabel) %>"  required autocomplete="postal-code"   aria-describedby="explanation-form-element-70845" /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", codePostalLabel) %></span></button>
                            </div>
                            <div class="ds44-field-information" aria-live="polite">
                                <ul class="ds44-field-information-list ds44-list">
                                    <li id="explanation-form-element-codePostal" class="ds44-field-information-explanation"><%= glp("jcmsplugin.socle.form.exemple.codepostal") %></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    
                    <%-- Ville ------------------------------------------------------------ --%>
                    <% String villeLabel = glp("jcmsplugin.archives.form.communication.ville"); %>
                    <li class="col-6 ds44-minTiny-margin-l">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-ville" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= villeLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-ville" name="ville" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", villeLabel) %>"  required autocomplete="address-level2"    /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", villeLabel) %></span></button>
                            </div>
                        </div>
                    </li>
                    
                    <%-- Telephone ------------------------------------------------------------ --%>
                    <% String telephoneLabel = glp("jcmsplugin.archives.form.communication.telephone"); %>
                    <li class="col-6 ds44-minTiny-margin-r">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-telephone" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= telephoneLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-telephone" name="telephone" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", telephoneLabel) %>"  required autocomplete="tel-national"   aria-describedby="explanation-form-element-82632" /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", telephoneLabel) %></span></button>
                            </div>
                            <div class="ds44-field-information" aria-live="polite">
                                <ul class="ds44-field-information-list ds44-list">
                                    <li id="explanation-form-element-telephone" class="ds44-field-information-explanation"><%= glp("jcmsplugin.socle.form.exemple.tel") %></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    
                    <%-- Courriel ------------------------------------------------------------ --%>
                    <% String courrielLabel = glp("jcmsplugin.archives.form.communication.courriel"); %>
                    <li class="col-6 ds44-minTiny-margin-l">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-courriel" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= courrielLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="email" id="form-element-courriel" name="courriel" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", courrielLabel) %>"  required autocomplete="email"   aria-describedby="explanation-form-element-46258" /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", courrielLabel) %></span></button>
                            </div>

                            <div class="ds44-field-information" aria-live="polite">
                                <ul class="ds44-field-information-list ds44-list">
                                    <li id="explanation-form-element-courriel" class="ds44-field-information-explanation"><%= glp("jcmsplugin.socle.form.exemple.email") %></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            
            <div class="ds44-mb3">
                <h2 class="h3-like"><%= glp("jcmsplugin.archives.form.communication.caracteristiquesRecherche") %></h2>
                    <ul class="ds44-list grid-12">
                
                    <%-- NumeroDeVersement ------------------------------------------------------------ --%>
                    <% String versementLabel = glp("jcmsplugin.archives.form.communication.versement"); %>
                    <li class="col-6 ds44-minTiny-margin-r">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-versement" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= versementLabel %></span></span></label>
                                <input type="text" id="form-element-versement" name="versement" class="ds44-inpStd" inputmode="numeric" pattern="[0-9]{4}" maxlength="4"/><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", versementLabel ) %></span></button>
                            </div>
                        </div>
                    </li>
                    
                    <%-- NumeroDuDossier ------------------------------------------------------------ --%>
                    <% String dossierLabel = glp("jcmsplugin.archives.form.communication.dossier"); %>
                    <li class="col-6 ds44-minTiny-margin-l">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-dossier" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= dossierLabel %></span></span></label>
                                <input type="text" id="form-element-dossier" name="dossier" class="ds44-inpStd" inputmode="numeric" pattern="[0-9]{4}" maxlength="4"/><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", dossierLabel ) %></span></button>
                            </div>
                        </div>
                    </li>

                    <%-- NatureDeLaRecherche ------------------------------------------------------------ --%>
                    <% String natureRechercheLabel = glp("jcmsplugin.archives.form.communication.natureRecherche"); %>
                    <li class="col-12">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-natureRecherche" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= natureRechercheLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <textarea rows="5" cols="1" id="form-element-natureRecherche" name="natureRecherche" class="ds44-inpStd" required></textarea>
                            </div>
                        </div>
                    </li>
                    
                    <%-- DateDeVersement ------------------------------------------------------------ --%>
                    <% String dateVersementLabel = glp("jcmsplugin.archives.form.communication.dateVersement"); %>
                    <li class="col-6 ds44-minTiny-margin-r">
                        <div class="ds44-form__container">
	                        <div class="ds44-posRel">
	                            <label for="form-element-dateVersement" class="ds44-formLabel ds44-datepicker"><span class="ds44-labelTypePlaceholder"><span><%= dateVersementLabel %></span></span></label>
	                                <div data-name="form-element-dateVersement" class="ds44-datepicker__shape ds44-inpStd" data-required="false">
	                                    <input id="form-element-dateVersement" type="text" inputmode="numeric" pattern="[0-9]*" maxlength="2" title="<%= glp("jcmsplugin.socle.facette.date.exemple.jour", dateVersementLabel) %>" data-is-date="true" aria-describedby="explanation-form-element-dateVersement"><span>/</span>
	                                    <input type="text" inputmode="numeric" pattern="[0-9]*" maxlength="2" title="<%= glp("jcmsplugin.socle.facette.date.exemple.mois", dateVersementLabel) %>" data-is-date="true" aria-describedby="explanation-form-element-dateVersement"><span>/</span>
	                                    <input type="text" inputmode="numeric" pattern="[0-9]*" maxlength="4" title="<%= glp("jcmsplugin.socle.facette.date.exemple.annee", dateVersementLabel) %>" data-is-date="true" aria-describedby="explanation-form-element-dateVersement">
	                                </div>
	                                <button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", dateVersementLabel) %></span></button>
	                                <span class="ds44-calendar" aria-hidden="true" aria-describedby=""><i class="icon icon-date icon--large" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.date.calendrier.afficher", dateVersementLabel) %></span></span>
								    <div class="vanilla-calendar hidden"></div>
	                        </div>
								
						    <div class="ds44-field-information" aria-live="polite">
						        <ul class="ds44-field-information-list ds44-list">
						            <li id="explanation-form-element-dateVersement" class="ds44-field-information-explanation"><%= glp("jcmsplugin.socle.facette.date.select.example.label") %></li>
						        </ul>
						    </div>
                        </div>
                    </li>
                    
                    <%-- RetourDuDossierPrevuLe ------------------------------------------------------------ --%>
                    <% String dateRetourLabel = glp("jcmsplugin.archives.form.communication.dateRetour"); %>
                    <li class="col-6 ds44-minTiny-margin-l">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-dateRetour" class="ds44-formLabel ds44-datepicker"><span class="ds44-labelTypePlaceholder"><span><%= dateRetourLabel %></span></span></label>
                                    <div data-name="form-element-dateRetour" class="ds44-datepicker__shape ds44-inpStd" data-required="false">
                                        <input id="form-element-dateRetour" type="text" inputmode="numeric" pattern="[0-9]*" maxlength="2" title="<%= glp("jcmsplugin.socle.facette.date.exemple.jour", dateRetourLabel) %>" data-is-date="true" aria-describedby="explanation-form-element-dateRetour"><span>/</span>
                                        <input type="text" inputmode="numeric" pattern="[0-9]*" maxlength="2" title="<%= glp("jcmsplugin.socle.facette.date.exemple.mois", dateRetourLabel) %>" data-is-date="true" aria-describedby="explanation-form-element-dateRetour"><span>/</span>
                                        <input type="text" inputmode="numeric" pattern="[0-9]*" maxlength="4" title="<%= glp("jcmsplugin.socle.facette.date.exemple.annee", dateRetourLabel) %>" data-is-date="true" aria-describedby="explanation-form-element-dateRetour">
                                    </div>
                                    <button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", dateRetourLabel) %></span></button>
                                    <span class="ds44-calendar" aria-hidden="true" aria-describedby=""><i class="icon icon-date icon--large" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.date.calendrier.afficher", dateRetourLabel) %></span></span>
                                    <div class="vanilla-calendar hidden"></div>
                            </div>
                                
                            <div class="ds44-field-information" aria-live="polite">
                                <ul class="ds44-field-information-list ds44-list">
                                    <li id="explanation-form-element-dateRetour" class="ds44-field-information-explanation"><%= glp("jcmsplugin.socle.facette.date.select.example.label") %></li>
                                </ul>
                            </div>
                        </div>
                    </li>                    
                </ul>
            </div>             

	        <div class="txtcenter ds44-mt-std">
	            <button class="ds44-btnStd" title="<%= glp("jcmsplugin.archives.form.communication.boutonEnvoi.title") %>">
	                <span class="ds44-btnInnerText"><%= glp("jcmsplugin.socle.envoyer") %></span>
	                <i class="icon icon-long-arrow-right" aria-hidden="true"></i>
	            </button>
	        </div>
        </form>

    </div>
</article>

 

 

