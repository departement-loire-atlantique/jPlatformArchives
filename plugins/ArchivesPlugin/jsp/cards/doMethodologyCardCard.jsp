<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.taglib.card.*" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%
%><%

if (data == null) {
  return;
}

MethodologyCard pub = (MethodologyCard) data;

String uid = ServletUtil.generateUniqueDOMId(request, "uid");

String[] nameCategories = SocleUtils.formatCategories(pub.getTypeMethodology(loggedMember)).split(", ");
%>


<section class="ds44-card ds44-js-card ds44-card--contact ds44-box ds44-bgGray">

    <%@ include file="cardPictureCommonsArchives.jspf" %>
    
    <div class="ds44-card__section">
        <div class="ds44-innerBoxContainer">
            <p role="heading" aria-level="2" class="h4-like ds44-cardTitle" id="tuileActionEdu_<%= uid %>">
                <a href="<%= pub.getDisplayUrl(userLocale) %>" class="ds44-card__globalLink"><%= pub.getTitle() %></a>
            </p>
            <hr class="mbs"aria-hidden="true" />
            <jalios:if predicate="<%= Util.notEmpty(nameCategories) && nameCategories.length >= 1 %>">
                <jalios:if predicate="<%= Util.notEmpty(nameCategories[0]) %>">
                    <p class="ds44-docListElem ds44-mt-std"><i class="icon icon-tag ds44-docListIco" aria-hidden="true"></i><%= nameCategories[0] %></p>
                </jalios:if>
                <jalios:if predicate="<%= nameCategories.length > 1 && Util.notEmpty(nameCategories[1]) %>">
                    <p class="ds44-docListElem ds44-mt-std"><i class="icon icon-tag ds44-docListIco" aria-hidden="true"></i><%= nameCategories[1] %></p>
                </jalios:if>
            </jalios:if>
        </div>
        <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
    </div>
</section>