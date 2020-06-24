<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: MethodologyCard display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% MethodologyCard obj = (MethodologyCard)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay MethodologyCard <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field typeMethodology categoryEditor  <%= Util.isEmpty(obj.getTypeMethodology(loggedMember)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MethodologyCard.class, "typeMethodology", userLang) %><jalios:edit pub='<%= obj %>' fields='typeMethodology'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getTypeMethodology(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= obj.getTypeMethodology(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("c_5804"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field summary textareaEditor  <%= Util.isEmpty(obj.getSummary(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MethodologyCard.class, "summary", userLang) %><jalios:edit pub='<%= obj %>' fields='summary'/></td>
    <td class='field-data' <%= gfla(obj, "summary") %>>
            <% if (Util.notEmpty(obj.getSummary(userLang))) { %>
            <jalios:wiki><%= obj.getSummary(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field description wysiwygEditor  <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MethodologyCard.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <jalios:wysiwyg data='<%= obj %>' field='description'><%= obj.getDescription(userLang) %></jalios:wysiwyg>            
            <% } %>
    </td>
  </tr>
  <tr class="field mainIllustration imageEditor  <%= Util.isEmpty(obj.getMainIllustration()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MethodologyCard.class, "mainIllustration", userLang) %><jalios:edit pub='<%= obj %>' fields='mainIllustration'/></td>
    <td class='field-data' <%= gfla(obj, "mainIllustration") %>>
            <% if (Util.notEmpty(obj.getMainIllustration())) { %>
            <img src='<%= Util.encodeUrl(obj.getMainIllustration()) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field mainIllustrationLegend textfieldEditor  <%= Util.isEmpty(obj.getMainIllustrationLegend(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MethodologyCard.class, "mainIllustrationLegend", userLang) %><jalios:edit pub='<%= obj %>' fields='mainIllustrationLegend'/></td>
    <td class='field-data' <%= gfla(obj, "mainIllustrationLegend") %>>
            <% if (Util.notEmpty(obj.getMainIllustrationLegend(userLang))) { %>
            <%= obj.getMainIllustrationLegend(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field mainIllustrationCopyright textfieldEditor  <%= Util.isEmpty(obj.getMainIllustrationCopyright(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MethodologyCard.class, "mainIllustrationCopyright", userLang) %><jalios:edit pub='<%= obj %>' fields='mainIllustrationCopyright'/></td>
    <td class='field-data' <%= gfla(obj, "mainIllustrationCopyright") %>>
            <% if (Util.notEmpty(obj.getMainIllustrationCopyright(userLang))) { %>
            <%= obj.getMainIllustrationCopyright(userLang) %>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- MXM6o9fof0ncLtG4yo1i8w== --%>