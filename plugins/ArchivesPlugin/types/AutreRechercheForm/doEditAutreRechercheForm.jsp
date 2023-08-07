<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditAutreRechercheFormHandler formHandler = (EditAutreRechercheFormHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.AutreRechercheForm.class);
%>


        
            <div class="ds44-mb3">
                <h2 class="h3-like"><%= glp("jcmsplugin.archives.form.vous-etes") %></h2>
                <ul class="ds44-list grid-12">
                
                    <%-- Nom ------------------------------------------------------------ --%>
                    <% String nomLabel = glp("jcmsplugin.archives.form.nom"); %>
                    <li class="col-6 ds44-minTiny-margin-r">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-nom" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= nomLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-nom" name="nom" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", nomLabel) %>" required autocomplete="family-name"/><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", nomLabel) %></span></button>
                            </div>
                        </div>
                    </li>
                    
                    <%-- Prenom ------------------------------------------------------------ --%>
                    <% String prenomLabel = glp("jcmsplugin.archives.form.prenom"); %>
                    <li class="col-6 ds44-minTiny-margin-l">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-prenom" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= prenomLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-prenom" name="prenom" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", prenomLabel) %>" required autocomplete="given-name"/><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", prenomLabel) %></span></button>
                            </div>
                        </div>
                    </li>

                    <%-- Adresse ------------------------------------------------------------ --%>
                    <% String adresseLabel = glp("jcmsplugin.archives.form.adresse"); %>
                    <li class="col-12">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-adresse" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= adresseLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-adresse" name="adresse" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", adresseLabel) %>" required autocomplete="address-line1"    /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", adresseLabel) %></span></button>
                            </div>
                        </div>
                    </li>

                    <%-- ComplementDadresse ------------------------------------------------------------ --%>
                    <% String complementAdresseLabel = glp("jcmsplugin.archives.form.complementAdresse"); %>
                    <li class="col-12">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-complementAdresse" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= complementAdresseLabel %></span></span></label>
                                <input type="text" id="form-element-complementAdresse" name="complementAdresse" class="ds44-inpStd"/><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", complementAdresseLabel) %></span></button>
                            </div>
                        </div>
                    </li>
                    
                    <%-- CodePostal ------------------------------------------------------------ --%>
                    <% String codePostalLabel = glp("jcmsplugin.archives.form.codePostal"); %>
                    <li class="col-6 ds44-minTiny-margin-r">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-codePostal" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= codePostalLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-codePostal" name="codePostal" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", codePostalLabel) %>" required autocomplete="postal-code" aria-describedby="explanation-form-element-codePostal" /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", codePostalLabel) %></span></button>
                            </div>
                            <div class="ds44-field-information" aria-live="polite">
                                <ul class="ds44-field-information-list ds44-list">
                                    <li id="explanation-form-element-codePostal" class="ds44-field-information-explanation"><%= glp("jcmsplugin.socle.form.exemple.codepostal") %></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    
                    <%-- Ville ------------------------------------------------------------ --%>
                    <% String villeLabel = glp("jcmsplugin.archives.form.ville"); %>
                    <li class="col-6 ds44-minTiny-margin-l">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-ville" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= villeLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-ville" name="ville" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", villeLabel) %>" required autocomplete="address-level2"    /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", villeLabel) %></span></button>
                            </div>
                        </div>
                    </li>
                    
                    <%-- Telephone ------------------------------------------------------------ --%>
                    <% String telephoneLabel = glp("jcmsplugin.archives.form.telephone"); %>
                    <li class="col-6 ds44-minTiny-margin-r">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-telephone" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= telephoneLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="text" id="form-element-telephone" name="telephone" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", telephoneLabel) %>" required autocomplete="tel-national" aria-describedby="explanation-form-element-telephone" /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", telephoneLabel) %></span></button>
                            </div>
                            <div class="ds44-field-information" aria-live="polite">
                                <ul class="ds44-field-information-list ds44-list">
                                    <li id="explanation-form-element-telephone" class="ds44-field-information-explanation"><%= glp("jcmsplugin.socle.form.exemple.tel") %></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    
                    <%-- Courriel ------------------------------------------------------------ --%>
                    <% String courrielLabel = glp("jcmsplugin.archives.form.courriel"); %>
                    <li class="col-6 ds44-minTiny-margin-l">
                        <div class="ds44-form__container">
                            <div class="ds44-posRel">
                                <label for="form-element-courriel" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= courrielLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                <input type="email" id="form-element-courriel" name="courriel" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", courrielLabel) %>" required autocomplete="email" aria-describedby="explanation-form-element-courriel" /><button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", courrielLabel) %></span></button>
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
                <h2 class="h3-like"><%= glp("jcmsplugin.archives.form.votre-demande") %></h2>
                    <ul class="ds44-list grid-12">
                    
                        <%-- Motivations ------------------------------------------------------------ --%>
                        <% String demandeLabel = glp("jcmsplugin.archives.form.motivations"); %>
                        <li class="col-12">
                            <div class="ds44-form__container">
                                <div class="ds44-posRel">
                                    <label for="form-element-demande" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span><%= demandeLabel %><sup aria-hidden="true">*</sup></span></span></label>
                                    <textarea rows="5" cols="1" id="form-element-demande" name="demande" class="ds44-inpStd" required ></textarea>
                                </div>
                            </div>
                        </li>
                        
                        <%-- Justificatif ------------------------------------------------------------ --%>
						<% String justificatifLabel = glp("jcmsplugin.archives.form.piece-jointe");%>
						<li class="col-12">
							<div class="ds44-mb3">
							    <div class="ds44-form__container">
							        <div class="ds44-posRel">
							            <label id="label-form-element-justificatif" for="form-element-justificatif" class="ds44-formLabel">
							                <span class="ds44-labelTypePlaceholder"><span><%= justificatifLabel %></span></span>
							            </label>
							            
							            <div class="ds44-file__shape ds44-inpStd">
							                <input type="file" id="form-element-justificatif" name="justificatif" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", justificatifLabel) %>" data-file-extensions="doc,docx,png,gif,jpg,jpeg,pdf" aria-describedby="explanation-form-element-justificatif"  />
							                <div id="file-display-form-element-justificatif" class="ds44-fileDisplay"></div>
							            </div>
							            <button class="ds44-reset" type="button" aria-describedby="label-form-element-justificatif">
							              <i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", justificatifLabel) %></span>
							            </button>
							        
							            <span class="ds44-file" aria-hidden="true"><i class="icon icon-directory icon--medium" aria-hidden="true"></i></span>
							        
							        </div>
							    
							        <div class="ds44-field-information" aria-live="polite">
							            <ul class="ds44-field-information-list ds44-list">
							                <li id="explanation-form-element-justificatif" class="ds44-field-information-explanation"><%= glp("jcmsplugin.archives.form.autreRecherche.exemple.formats") %></li>
							            </ul>
							        </div>
							    
							    </div>
							</div>
                        </li>
                        
                    </ul>
            </div>            

            <div class="txtcenter ds44-mt-std">
                <button class="ds44-btnStd" title="<%= glp("jcmsplugin.archives.form.boutonEnvoi.title") %>">
                    <span class="ds44-btnInnerText"><%= glp("jcmsplugin.socle.envoyer") %></span>
                    <i class="icon icon-long-arrow-right" aria-hidden="true"></i>
                </button>
            </div>




 

 





