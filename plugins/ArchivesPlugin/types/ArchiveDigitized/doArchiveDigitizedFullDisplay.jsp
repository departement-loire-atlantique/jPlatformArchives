<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: ArchiveDigitized display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% ArchiveDigitized obj = (ArchiveDigitized)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay ArchiveDigitized <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(ArchiveDigitized.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field iframe linkEditor  <%= Util.isEmpty(obj.getIframe()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(ArchiveDigitized.class, "iframe", userLang) %><jalios:edit pub='<%= obj %>' fields='iframe'/></td>
    <td class='field-data' >
            <% if (obj.getIframe() != null && obj.getIframe().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getIframe() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field mainIllustration imageEditor  <%= Util.isEmpty(obj.getMainIllustration()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(ArchiveDigitized.class, "mainIllustration", userLang) %><jalios:edit pub='<%= obj %>' fields='mainIllustration'/></td>
    <td class='field-data' <%= gfla(obj, "mainIllustration") %>>
            <% if (Util.notEmpty(obj.getMainIllustration())) { %>
            <img src='<%= Util.encodeUrl(obj.getMainIllustration()) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field mainIllustrationLegend textfieldEditor  <%= Util.isEmpty(obj.getMainIllustrationLegend(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(ArchiveDigitized.class, "mainIllustrationLegend", userLang) %><jalios:edit pub='<%= obj %>' fields='mainIllustrationLegend'/></td>
    <td class='field-data' <%= gfla(obj, "mainIllustrationLegend") %>>
            <% if (Util.notEmpty(obj.getMainIllustrationLegend(userLang))) { %>
            <%= obj.getMainIllustrationLegend(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field mainIllustrationCopyright textfieldEditor  <%= Util.isEmpty(obj.getMainIllustrationCopyright(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(ArchiveDigitized.class, "mainIllustrationCopyright", userLang) %><jalios:edit pub='<%= obj %>' fields='mainIllustrationCopyright'/></td>
    <td class='field-data' <%= gfla(obj, "mainIllustrationCopyright") %>>
            <% if (Util.notEmpty(obj.getMainIllustrationCopyright(userLang))) { %>
            <%= obj.getMainIllustrationCopyright(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field freePartTitles textfieldEditor  <%= Util.isEmpty(obj.getFreePartTitles(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(ArchiveDigitized.class, "freePartTitles", userLang) %><jalios:edit pub='<%= obj %>' fields='freePartTitles'/></td>
    <td class='field-data' <%= gfla(obj, "freePartTitles") %>>
        <% if (Util.notEmpty(obj.getFreePartTitles(userLang))) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getFreePartTitles(userLang) %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
              <%= itString %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field freePartContents wysiwygEditor  <%= Util.isEmpty(obj.getFreePartContents(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(ArchiveDigitized.class, "freePartContents", userLang) %><jalios:edit pub='<%= obj %>' fields='freePartContents'/></td>
    <td class='field-data' <%= gfla(obj, "freePartContents") %>>
        <% if (Util.notEmpty(obj.getFreePartContents(userLang))) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getFreePartContents(userLang) %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
              <jalios:wysiwyg data='<%= obj %>' field='freePartContents'><%= itString %></jalios:wysiwyg>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field youtubeUrls urlEditor  <%= Util.isEmpty(obj.getYoutubeUrls()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(ArchiveDigitized.class, "youtubeUrls", userLang) %><jalios:edit pub='<%= obj %>' fields='youtubeUrls'/></td>
    <td class='field-data' <%= gfla(obj, "youtubeUrls") %>>
        <% if (Util.notEmpty(obj.getYoutubeUrls())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getYoutubeUrls() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
              <a href='<%= itString %>'><%= itString %></a>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field dmCloudPromoIds textfieldEditor  <%= Util.isEmpty(obj.getDmCloudPromoIds()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(ArchiveDigitized.class, "dmCloudPromoIds", userLang) %><jalios:edit pub='<%= obj %>' fields='dmCloudPromoIds'/></td>
    <td class='field-data' <%= gfla(obj, "dmCloudPromoIds") %>>
        <% if (Util.notEmpty(obj.getDmCloudPromoIds())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getDmCloudPromoIds() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
              <%= itString %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field mediaPromo linkEditor  <%= Util.isEmpty(obj.getMediaPromo()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(ArchiveDigitized.class, "mediaPromo", userLang) %><jalios:edit pub='<%= obj %>' fields='mediaPromo'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getMediaPromo())) { %>
            <ol>
              <jalios:foreach name="itData" type="generated.CarouselElement" array="<%= obj.getMediaPromo() %>">
              <% if (itData != null && itData.canBeReadBy(loggedMember)) { %>
              <li>
              <jalios:link data='<%= itData %>'/>
              </li>
              <% } %>
              </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field activerLesConditionsDutilisation booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(ArchiveDigitized.class, "activerLesConditionsDutilisation", userLang) %><jalios:edit pub='<%= obj %>' fields='activerLesConditionsDutilisation'/></td>
    <td class='field-data' >
            <%= obj.getActiverLesConditionsDutilisationLabel(userLang) %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- Y35UL+mMpbrPn8AT2488wQ== --%>