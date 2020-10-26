<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@page import="fr.cg44.plugin.socle.VideoUtils" %>
<%@page import="com.jalios.jcms.handler.QueryHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% Paleography obj = (Paleography)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>

<main role="main" id="contentPaleography">
   <article class="ds44-container-large">
      <div class="ds44-lightBG">
         <div class="ds44-inner-container ds44--xl-padding-t ds44--m-padding-b ds44-mobile-reduced-pt">
            <div class="ds44-grid12-offset-2">
               <jalios:if predicate='<%= Util.notEmpty(Channel.getChannel().getProperty("jcmsplugin.socle.portlet.filariane.id")) %>'>
                    <jalios:include id='<%=Channel.getChannel().getProperty("jcmsplugin.socle.portlet.filariane.id") %>'/>
               </jalios:if>
               <h1 class="h1-like mbl mts ds44-mobile-reduced-mb ds44-mobile-reduced-mt" id="titrePaleography"><%= obj.getTitle() %></h1>
            </div>
         </div>
      </div>
      <div class="ds44-img50 ds44-img50--event">
         <div class="ds44-inner-container">
            <div class="ds44-grid12-offset-1">
               <jalios:if predicate="<%= Util.notEmpty(obj.getTextRecall()) %>">
                   <ds:figurePicture imgCss="ds44-w100" figureCss="ds44-legendeContainer ds44-imgLoupe" format="unchanged" image="<%= obj.getTextRecall() %>" imageMobile="<%= obj.getTextRecall() %>"/>
               </jalios:if>
               <div class="ds44-theme ds44-flex-valign-center ds44-flex-container ds44-fse ds44--l-padding ">
                  <span class="ds44-docListElem"><i class="icon icon-tag ds44-docListIco" aria-hidden="true"></i><%= SocleUtils.formatCategories(obj.getLevels(loggedMember)) %></span>
               </div>
            </div>
         </div>
      </div>
      <section class="ds44-contenuArticle" id="sectionPaleography">
         <div class="ds44-inner-container ds44-mtb3">
            <div class="ds44-grid12-offset-2">
               <ul class="ds44-collapser">
                  <li class="ds44-collapser_element">
                     <button type="button" class="ds44-collapser_button">Afficher la transcription<i class="icon icon-down" aria-hidden="true"></i>
                     </button>
                     <div class="ds44-collapser_content">
                        <ul class="ds44-list ds44-collapser_content--level2">
                           <li>
                           <jalios:wysiwyg>
                            <%= obj.getTranscription() %>
                           </jalios:wysiwyg>
                           </li>
                        </ul>
                     </div>
                  </li>
               </ul>
            </div>
         </div>
      </section>
      
      <%-- Partagez cette page --%>
      <%@ include file="/plugins/SoclePlugin/jsp/portal/socialNetworksShare.jspf" %>
      
   </article>
   
   <%-- Sur le même thème
             Affichage de contenus catégorisés sous "Mise en  avant > En ce moment" et ayant au moins un catégorie commune parmi
             les catégories de navigation de la fiche actu (branche "Navigation des espaces")
        --%>
        <%
        // Récupération des catégories de navigation
        Category navigationDesEspacesCat = channel.getCategory(channel.getProperty("jcmsplugin.socle.site.menu.cat.root"));
        Set<Category> navCat = new TreeSet<Category>();
        if(Util.notEmpty(obj.getCategories(loggedMember))){
            for(Category itCat:obj.getCategories(loggedMember)){
                if(itCat.hasAncestor(navigationDesEspacesCat)){
                    navCat.add(itCat);
                }
            }
        }
        %>

   <jalios:if predicate='<%= !navCat.isEmpty() && Util.notEmpty(channel.getProperty("$jcmsplugin.archives.category.paleography.root"))%>'>
            <% 
            // Récupération des publications catégorisées à la racine des contenus Paléographie
            QueryHandler qhEnCeMoment = new QueryHandler();
            qhEnCeMoment.setCids(channel.getProperty("$jcmsplugin.archives.category.paleography.root"));
            qhEnCeMoment.setLoggedMember(loggedMember);
            qhEnCeMoment.setTypes("Content");
            QueryResultSet resultEnCeMomentSet = qhEnCeMoment.getResultSet();
            SortedSet<Publication> listPubsEnCeMomentSet = resultEnCeMomentSet.getAsSortedSet(Publication.getPdateComparator());
            
            // Récupération des publication catégorisées dans au moins une des thématiques du communiqué courant.
            QueryHandler qhThemes= new QueryHandler();
            String[] themeCids = JcmsUtil.dataArrayToStringArray(navCat.toArray(new Data[navCat.size()]));
            qhThemes.setCatMode("or");
            qhThemes.setCids(themeCids);
            qhThemes.setLoggedMember(loggedMember);
            qhThemes.setTypes("Paleography");
            QueryResultSet resultThemesSet = qhThemes.getResultSet();
            SortedSet<Publication> listPubsThemesSet = resultThemesSet.getAsSortedSet(Publication.getPdateComparator());
            
            // Intersection des 2 sets
            Set<Publication> sameThemePubSet = new TreeSet<Publication>(Publication.getPdateComparator()); 
            sameThemePubSet.addAll(Util.interSet(listPubsEnCeMomentSet, listPubsThemesSet));
                        
            // Suppression de la pub courante
            sameThemePubSet.remove(obj);
            
            // Limiter à un nombre d'éléments max
            int max = channel.getIntegerProperty("jcmsplugin.socle.meme-theme.max", 20);
            List<Publication> tmpList = new ArrayList(sameThemePubSet);
            if(tmpList.size() >= max){
                tmpList = tmpList.subList(0, max);  
            }
            %>

            <jalios:if predicate='<%= !sameThemePubSet.isEmpty() %>'>
                <%
                // Transfo du set en tableau pour passer au carrousel
                Content[] sameThemePubArray = tmpList.toArray(new Content[tmpList.size()]);
                //Content[] sameThemePubArray = sameThemePubSet.toArray(new Content[sameThemePubSet.size()]);
                
                // Instanciation de la portlet carrousel avec les pubs de même thème
                PortletCarousel carouselEnCeMoment = new PortletCarousel();
                carouselEnCeMoment.setTitreDuBloc(glp("jcmsplugin.socle.memetheme"));
                carouselEnCeMoment.setTemplate("box.sliderQuatre");
                carouselEnCeMoment.setSelectionDuTheme("tuileVerticaleLight");
                carouselEnCeMoment.setPositionTitre("bl");
                carouselEnCeMoment.setFirstPublications(sameThemePubArray);
                %>

                <jalios:include pub="<%= carouselEnCeMoment %>"/>

            </jalios:if>

        </jalios:if>

</main>