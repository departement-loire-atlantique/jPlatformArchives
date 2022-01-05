<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.taglib.card.*" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%
%><%

if (data == null) {
  return;
}

Paleography pub = (Paleography) data;

String uid = ServletUtil.generateUniqueDOMId(request, "uid");

String[] nameCategories = SocleUtils.formatCategories(pub.getLevels(loggedMember)).split(", ");
%>

<section class=ds44-box">
    
    <div class="ds44-img50--event">
         <div class="ds44-inner-container">
            <div class="ds44-grid12-offset-1">
               <jalios:if predicate="<%= Util.notEmpty(pub.getTextRecall()) %>">
                   <figure class="ds44-legendeContainer ds44-imgLoupe">
                       <img class="ds44-w100" src="<%= pub.getTextRecall() %>" alt='<%= glp("jcmsplugin.socle.paleography.alt.img")%>' />
                   </figure>
               </jalios:if>
            </div>
         </div>
      </div>
      <jalios:if predicate="<%= Util.notEmpty(pub.getTranscription()) %>">
      <section class="ds44-contenuArticle">
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
                            <%= pub.getTranscription() %>
                           </jalios:wysiwyg>
                           </li>
                        </ul>
                     </div>
                  </li>
               </ul>
            </div>
         </div>
      </section>
      </jalios:if>
</section>