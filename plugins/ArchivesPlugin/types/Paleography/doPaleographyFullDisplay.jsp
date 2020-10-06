<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@page import="fr.cg44.plugin.socle.VideoUtils" %>
<%@page import="com.jalios.jcms.handler.QueryHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% Paleography obj = (Paleography)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>


<main role="main" id="content">
   <article class="ds44-container-large">
      <div class="ds44-lightBG">
         <div class="ds44-inner-container ds44--xl-padding-t ds44--m-padding-b ds44-mobile-reduced-pt">
            <div class="ds44-grid12-offset-2">
               <jalios:if predicate='<%= Util.notEmpty(Channel.getChannel().getProperty("jcmsplugin.socle.portlet.filariane.id")) %>'>
                    <jalios:include id='<%=Channel.getChannel().getProperty("jcmsplugin.socle.portlet.filariane.id") %>'/>
               </jalios:if>
               <h1 class="h1-like mbl mts ds44-mobile-reduced-mb ds44-mobile-reduced-mt" id="titrePaleographie"><%= obj.getTitle() %></h1>
            </div>
         </div>
      </div>
      <div class="ds44-img50 ds44-img50--event">
         <div class="ds44-inner-container">
            <div class="ds44-grid12-offset-1">
               <jalios:if predicate="<%= Util.notEmpty(obj.getTextRecall()) %>">
               <ds:figurePicture format="unchanged" image="<%= obj.getTextRecall() %>" alt="<%= obj.getTitle() %>" figureCss="ds44-legendeContainer ds44-imgLoupe" imgCss="ds44-w100"/>
               </jalios:if>
               <div class="ds44-theme ds44-flex-valign-center ds44-flex-container ds44-fse ds44--l-padding ">
                  <span class="ds44-docListElem"><i class="icon icon-tag ds44-docListIco" aria-hidden="true"></i><%= SocleUtils.formatCategories(obj.getLevels(member)) %></span>
               </div>
            </div>
         </div>
      </div>
      <section class="ds44-contenuArticle" id="section1">
         <div class="ds44-inner-container ds44-mtb3">
            <div class="ds44-grid12-offset-2">
               <ul class="ds44-collapser">
                  <li class="ds44-collapser_element">
                     <button type="button" class="ds44-collapser_button" aria-expanded="false">Afficher la transcription<i class="icon icon-down" aria-hidden="true"></i>
                     </button>
                     <div class="ds44-collapser_content" aria-hidden="true" style="visibility: hidden;">
                        <ul class="ds44-list ds44-collapser_content--level2">
                           <li>
                              <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque at efficitur turpis, ut euismod elit. Nam turpis orci, suscipit et arcu id, rhoncus maximus augue. Cras bibendum congue odio, in bibendum ante euismod sed. Maecenas sodales ipsum at neque aliquet pharetra ac vitae eros. Donec malesuada, purus a tincidunt tristique, felis nisi dictum nulla, quis sagittis enim turpis sed eros. Cras auctor sodales orci ut accumsan. Nullam ut facilisis lacus, in porta elit. Nulla nec condimentum massa, in sollicitudin massa. Pellentesque in laoreet tellus. Curabitur pulvinar, elit in ornare sodales, mauris mauris tincidunt purus, eget tempor sem diam quis ante. Suspendisse porttitor dignissim aliquet. Vivamus volutpat massa at lacus efficitur, ac porta quam dignissim. Ut rhoncus, est et sagittis imperdiet, ex diam rutrum risus, vel tempus ex ligula sed libero. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam malesuada, est ut pharetra bibendum, libero ex convallis magna, nec aliquet justo risus quis nibh. Vivamus vehicula at diam at pretium.</p>
                              <p> Ut pellentesque tempus nisi quis hendrerit. Donec at iaculis enim, ac sodales orci. Donec sagittis sapien vitae turpis hendrerit aliquam. Mauris rutrum orci a laoreet bibendum. Vivamus vitae vulputate justo, quis sagittis risus. Suspendisse dictum ultricies turpis nec feugiat. Vestibulum in nunc non mauris congue finibus nec sed eros. Aenean id nisl nunc. Pellentesque faucibus quis est sit amet dapibus. Morbi et justo augue. Phasellus iaculis at ipsum ut luctus. Proin efficitur sed lacus a iaculis. </p>
                           </li>
                        </ul>
                     </div>
                  </li>
               </ul>
            </div>
         </div>
      </section>
      <section class="ds44-partage ds44-flex-container ds44-flex-align-center pal ds44-mb35">
         <h2 class="h4-like" id="idPartageRS">Partagez cette page :</h2>
         <ul class="ds44-list ds44-flex-container ds44-flex-align-center ds44-fse">
            <li><a href="https://www.facebook.com/sharer/sharer.php?u=" target="_blank" class="ds44-rsLink" title="Partager cette page sur Facebook - nouvelle fenêtre" data-statistic="{&quot;name&quot;: &quot;declenche-evenement&quot;,&quot;category&quot;: &quot;Partage page&quot;,&quot;action&quot;: &quot;Facebook&quot;}"><i class="icon icon-facebook icon--sizeL" aria-hidden="true"></i><span class="visually-hidden">Partager cette page sur Facebook</span></a></li>
            <li><a href="https://twitter.com/intent/tweet?url=https%3A%2F%2Floire-atlantique.fr%2F&amp;text=Informations+pratiques+et+services+en+ligne&amp;hashtags=loireAtlantique" target="_blank" class="ds44-rsLink" title="Partager cette page sur Twitter - nouvelle fenêtre" data-statistic="{&quot;name&quot;: &quot;declenche-evenement&quot;,&quot;category&quot;: &quot;Partage page&quot;,&quot;action&quot;: &quot;Twitter&quot;}"><i class="icon icon-twitter icon--sizeL" aria-hidden="true"></i><span class="visually-hidden">Partager cette page sur Twitter</span></a></li>
            <li><a href="https://www.linkedin.com/shareArticle?mini=true&amp;url=https%3A%2F%2Floire-atlantique.fr%2F&amp;title=Lean&amp;summary=Informations+pratiques+et+services+en+ligne&amp;source=Loire-Atlantique" target="_blank" class="ds44-rsLink" title="Partager cette page sur Linkedin - nouvelle fenêtre" data-statistic="{&quot;name&quot;: &quot;declenche-evenement&quot;,&quot;category&quot;: &quot;Partage page&quot;,&quot;action&quot;: &quot;Linkedin&quot;}"><i class="icon icon-linkedin icon--sizeL" aria-hidden="true"></i><span class="visually-hidden">Partager cette page sur Linkedin</span></a></li>
            <li><a href="mailto:?subject={subject}&amp;body={body}" target="_blank" class="ds44-rsLink" title="Partager cette page par email - nouvelle fenêtre" data-statistic="{&quot;name&quot;: &quot;declenche-evenement&quot;,&quot;category&quot;: &quot;Partage page&quot;,&quot;action&quot;: &quot;Loire-Atlantique&quot;}"><i class="icon icon-mail icon--sizeL" aria-hidden="true"></i><span class="visually-hidden">Partager cette page par email</span></a></li>
         </ul>
      </section>
   </article>
   <section class="ds44-container-fluid ds44-lightBG ds44-wave-white ds44--xl-padding-tb">
      <header class="txtcenter ds44--xl-padding-tb">
         <h2 class="h2-like" id="idTitre5">Sur le même thème</h2>
      </header>
      <div class="ds44-container-large">
         <div class="mod--hidden ds44-list swipper-carousel-wrap ds44-posRel" data-nb-visible-slides="4">
            <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
               <ul class="swiper-wrapper ds44-list has-gutter-l ds44-carousel-swiper" style="transform: translate3d(-1333px, 0px, 0px); transition-duration: 0ms;">
                  <li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="1" style="width: 317.25px; margin-right: 16px;" aria-hidden="true">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 2</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
                  <li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2" style="width: 317.25px; margin-right: 16px;" aria-hidden="true">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 3</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
                  <li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3" style="width: 317.25px; margin-right: 16px;" aria-hidden="true">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 4</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
                  <li class="swiper-slide swiper-slide-duplicate swiper-slide-prev" data-swiper-slide-index="4" style="width: 317.25px; margin-right: 16px;" aria-hidden="true">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 5</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
                  <li class="swiper-slide swiper-slide-visible swiper-slide-active" data-swiper-slide-index="0" style="width: 317.25px; margin-right: 16px;">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 1</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
                  <li class="swiper-slide swiper-slide-visible swiper-slide-next" data-swiper-slide-index="1" style="width: 317.25px; margin-right: 16px;">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 2</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
                  <li class="swiper-slide swiper-slide-visible" data-swiper-slide-index="2" style="width: 317.25px; margin-right: 16px;">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 3</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
                  <li class="swiper-slide swiper-slide-visible" data-swiper-slide-index="3" style="width: 317.25px; margin-right: 16px;">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 4</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
                  <li class="swiper-slide swiper-slide-duplicate-prev" data-swiper-slide-index="4" style="width: 317.25px; margin-right: 16px;" aria-hidden="true">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 5</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
                  <li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="0" style="width: 317.25px; margin-right: 16px;" aria-hidden="true">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 1</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
                  <li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="1" style="width: 317.25px; margin-right: 16px;" aria-hidden="true">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 2</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
                  <li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2" style="width: 317.25px; margin-right: 16px;" aria-hidden="true">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 3</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
                  <li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3" style="width: 317.25px; margin-right: 16px;" aria-hidden="true">
                     <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
                        <picture class="ds44-container-imgRatio">
                           <img src="../../assets/images/ds44-logo--sampleImg.png" alt="" class="ds44-imgRatio">
                        </picture>
                        <div class="ds44-card__section">
                           <p role="heading" aria-level="2" class="ds44-card__title"><a href="#" class="ds44-card__globalLink">Ceci est la tuile numéro 4</a></p>
                           <p class="ds44-cardDate">Du 6 juillet au 29 septembre 2019</p>
                           <p class="ds44-cardLocalisation"><i class="icon icon-marker" aria-hidden="true"></i><span class="ds44-iconInnerText">Nantes</span></p>
                           <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
                        </div>
                     </section>
                  </li>
               </ul>
            </div>
            <button class="swiper-button-prev ds44-not-edge-42" type="button" title="Voir le contenu précédent : Sur le même thème - 5/5">
            <i class="icon icon-left" aria-hidden="true"></i>
            <span class="visually-hidden">Voir le contenu précédent : Sur le même thème - 5/5</span>
            </button>
            <button class="swiper-button-next ds44-not-edge-42" type="button" title="Voir le contenu suivant : Sur le même thème - 5/5">
            <i class="icon icon-right" aria-hidden="true"></i>
            <span class="visually-hidden">Voir le contenu suivant : Sur le même thème - 5/5</span>
            </button>
         </div>
      </div>
   </section>
</main>