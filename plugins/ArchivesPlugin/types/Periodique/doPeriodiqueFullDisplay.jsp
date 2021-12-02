<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% 
Periodique obj = (Periodique)request.getAttribute(PortalManager.PORTAL_PUBLICATION); 
boolean displayListeCommunes = (Util.notEmpty(obj.getCommunesConcernees()) || obj.getToutesLesCommunesDuDepartement());
%><%
%><%@ include file='/front/doFullDisplay.jspf' %>

<main id="content" role="main">

    <jalios:include target="SOCLE_ALERTE"/>
    
    <section class="ds44-container-large">

	<ds:titleBanner pub="<%= obj %>" imagePath="<%= obj.getImageBandeau() %>" mobileImagePath="<%= obj.getImageBandeau() %>" title="<%= obj.getTitle(userLang) %>"
	            legend="<%= obj.getLegende(userLang) %>" copyright="<%= obj.getCopyright(userLang) %>" breadcrumb="true"></ds:titleBanner>
	</section>
	
	<section class="ds44-contenuArticle">
	<%-- bloc vert présentation / descripteurs --%>
	   <div class="ds44--l-padding-tb">
            <div class="ds44-inner-container">
                <div class="ds44-grid12-offset-1">
                    <section class="ds44-box ds44-theme">
                        <div class="ds44-innerBoxContainer">
                            <div class="grid-2-small-1 ds44-grid12-offset-1">
                                <div class="col">
                                    <p role="heading" aria-level="3" class="ds44-box-heading"><%= glp("jcmsplugin.archives.periodique.presentation") %></p>
                                    <p class="mts">
                                        <span class="u-bold"><%= glp("jcmsplugin.archives.periodique.coteperiodique") %> : </span><%= obj.getCoteDePeriodique(userLang) %>
                                    </p>
                                    <p class="mts">
                                        <span class="u-bold"><%= glp("jcmsplugin.archives.periodique.datesextremescollection") %> : </span><%= obj.getDatesExtremesDeLaCollection() %>
                                    </p>
                                    <jalios:if predicate="<%= Util.notEmpty(obj.getDatesExtremesDeLaCollectionNumer(userLang)) %>">
                                    <p class="mts">
                                        <span class="u-bold"><%= glp("jcmsplugin.archives.periodique.datescollectionnumerisee") %> : </span><%= obj.getDatesExtremesDeLaCollectionNumer(userLang) %>
                                    </p>
                                    </jalios:if>
                                    <jalios:if predicate="<%= Util.notEmpty(obj.getAncienTitre()) %>">
                                    <p class="mts">
                                        <span class="u-bold"><%= glp("jcmsplugin.archives.periodique.ancientitre") %> : </span>
                                        <jalios:foreach name="itAncienTitre" type="Periodique" array="<%= obj.getAncienTitre() %>">
	                                        <a href="<%= itAncienTitre.getDisplayUrl(userLocale) %>" target="_blank" title='<%= glp("jcmsplugin.socle.fichepublication.lire.title", obj.getTitle()) %>'><%= itAncienTitre.getTitle() %></a><%= itCounter < itAncienTitre.getAncienTitre().length ? ", " : ""%>
                                        </jalios:foreach>
                                    </p>
                                    </jalios:if>
                                    <jalios:if predicate="<%= Util.notEmpty(obj.getTitreDevenu()) %>">
                                    <p class="mts">
                                        <span class="u-bold"><%= glp("jcmsplugin.archives.periodique.titredevenu") %> : </span>
                                        <jalios:foreach name="itTitreDevenu" type="Periodique" array="<%= obj.getTitreDevenu() %>">
                                            <a href="<%= itTitreDevenu.getDisplayUrl(userLocale) %>" target="_blank" title='<%= glp("jcmsplugin.socle.fichepublication.lire.title", obj.getTitle()) %>'><%= itTitreDevenu.getTitle() %></a><%= itCounter < itTitreDevenu.getTitreDevenu().length ? ", " : ""%>
                                        </jalios:foreach>
                                    </p>
                                    </jalios:if>
                                </div>
                                <div class="col ds44--xl-padding-l">
                                    <p role="heading" aria-level="3" class="ds44-box-heading"><%= glp("jcmsplugin.archives.periodique.descripteurs") %> :</p>
                                    <p class="mts">
                                        <span class="u-bold"><%= glp("jcmsplugin.archives.periodique.themes") %> : </span>
                                        <%= SocleUtils.formatCategories(obj.getTheme(loggedMember)) %>
                                    </p>
                                    <p class="mts">
                                        <span class="u-bold"><%= glp("jcmsplugin.archives.periodique.periode") %> : </span>
                                        <%= SocleUtils.formatCategories(obj.getPeriode(loggedMember)) %>
                                    </p>
                                    <jalios:if predicate="<%= Util.notEmpty(obj.getTendencesPolitiques(loggedMember)) %>">
                                    <p class="mts">
                                        <span class="u-bold"><%= glp("jcmsplugin.archives.periodique.tendancepolitique") %> : </span>
                                        <%= SocleUtils.formatCategories(obj.getTendencesPolitiques(loggedMember)) %>
                                    </p>
                                    </jalios:if>
                                    <jalios:if predicate="<%= Util.notEmpty(obj.getNotes(userLang)) %>">
                                    <p role="heading" aria-level="3" class="ds44-box-heading mtl"><%= glp("jcmsplugin.archives.periodique.notes") %></p>
                                    <p class="mts">
                                        <jalios:wysiwyg><%= obj.getNotes(userLang) %></jalios:wysiwyg>
                                    </p>
                                    </jalios:if>
                                    <jalios:if predicate="<%= Util.notEmpty(obj.getInventaireDeLaCollection()) %>">
                                    <%
                                    String inventaireType = FileDocument.getExtension(obj.getInventaireDeLaCollection().getFilename()).toUpperCase();
                                    String inventaireSize = Util.formatFileSize(obj.getInventaireDeLaCollection().getSize());
                                    String inventaireTitle = glp("jcmsplugin.socle.lien.document.nouvelonglet", obj.getInventaireDeLaCollection().getTitle(), inventaireSize, inventaireType);
                                    %>
                                    <p class="mts">
                                        <a href="<%= obj.getInventaireDeLaCollection().getDownloadUrl() %>" target="_blank" title='<%= inventaireTitle %>'><%= glp("jcmsplugin.archives.periodique.consulterinventaire", inventaireType, inventaireSize) %></a>
                                    </p>
                                    </jalios:if>
                                    <jalios:if predicate="<%= obj.getNumerise() %>">
                                    <p class="mst">
                                    <a href='<%= HttpUtil.encodeForHTMLAttribute(channel.getProperty("jcmsplugin.archives.periodique.urlpressenumerisee")) %>' 
                                    class="ds44-btnStd ds44-btnStd--large ds44-btn--invert ds44-bntALeft" target="_blank" title='<%= glp("jcmsplugin.socle.lien.nouvelonglet", glp("jcmsplugin.archives.periodique.consulterdocnumerise")) %>'>
                                        <span class="ds44-btnInnerText"><%= glp("jcmsplugin.archives.periodique.consulterdocnumerise") %></span><i class="icon icon-long-arrow-right" aria-hidden="true"></i>
                                    </a>
                                    </p>
                                    </jalios:if>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
	</section>
	
	<jalios:if predicate="<%= Util.notEmpty(obj.getSiegeDuJournal()) || displayListeCommunes %>">
	<section class="ds44-contenuArticle ds44-mt2">
	   <%-- Bloc ressort géographique --%>
	   <div class="ds44-inner-container">
	       <h2 class="h3-like"><%= glp("jcmsplugin.archives.periodique.ressort") %></h2>
	       <jalios:if predicate="<%= Util.notEmpty(obj.getSiegeDuJournal()) %>">
	           <p class="mts">
	               <span class="u-bold"><%= glp("jcmsplugin.archives.periodique.siege") %> : </span><%= obj.getSiegeDuJournal().getTitle(userLang) %>
	           </p>
	       </jalios:if>
	       <jalios:if predicate="<%= displayListeCommunes %>">
	           <p class="mts">
                   <span class="u-bold"><%= glp("jcmsplugin.archives.periodique.communesconcernees") %> : </span>
                   <jalios:select>
                       <jalios:if predicate="<%= obj.getNumerise() %>">
                           <%= glp("jcmsplugin.archives.periodique.toutela") %>
                       </jalios:if>
                       <jalios:default>
                           <%-- Si ça n'est pas numérisé, mais que le bloc est affiché, alors il y a forcément des communes de renseignées --%>
                           <jalios:foreach name="itCommune" type="City" array="<%= obj.getCommunesConcernees() %>">
                               <%= itCommune.getTitle(userLang) %><%= itCounter < obj.getCommunesConcernees().length ? ", " : ""%>
                           </jalios:foreach>
                       </jalios:default>
                   </jalios:select>
               </p>
	       </jalios:if>       
	   </div>
	</section>
	</jalios:if>
	
	<%-- TODO : bloc carte --%>
</main>