<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: Paleography display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% Paleography obj = (Paleography)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay Paleography <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field levels categoryEditor  <%= Util.isEmpty(obj.getLevels(loggedMember)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Paleography.class, "levels", userLang) %><jalios:edit pub='<%= obj %>' fields='levels'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getLevels(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= obj.getLevels(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("c_5805"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field textRecall imageEditor  <%= Util.isEmpty(obj.getTextRecall()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Paleography.class, "textRecall", userLang) %><jalios:edit pub='<%= obj %>' fields='textRecall'/></td>
    <td class='field-data' <%= gfla(obj, "textRecall") %>>
            <% if (Util.notEmpty(obj.getTextRecall())) { %>
            <img src='<%= Util.encodeUrl(obj.getTextRecall()) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field transcriptionDate dateEditor  <%= Util.isEmpty(obj.getTranscriptionDate()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Paleography.class, "transcriptionDate", userLang) %><jalios:edit pub='<%= obj %>' fields='transcriptionDate'/></td>
    <td class='field-data' >
            <%  if (obj.getTranscriptionDate() != null) { %>
            <jalios:date date='<%= obj.getTranscriptionDate() %>' format='<%= "short" %>'/>
            <jalios:time date='<%= obj.getTranscriptionDate() %>' format='<%= "short" %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field transcription wysiwygEditor  <%= Util.isEmpty(obj.getTranscription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Paleography.class, "transcription", userLang) %><jalios:edit pub='<%= obj %>' fields='transcription'/></td>
    <td class='field-data' <%= gfla(obj, "transcription") %>>
            <% if (Util.notEmpty(obj.getTranscription(userLang))) { %>
            <jalios:wysiwyg data='<%= obj %>' field='transcription'><%= obj.getTranscription(userLang) %></jalios:wysiwyg>            
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- aEI2mekcPdBw1At3HN2wdg== --%>