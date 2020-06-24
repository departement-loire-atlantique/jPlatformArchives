<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: ConditionsDeReutilisation display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% ConditionsDeReutilisation obj = (ConditionsDeReutilisation)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay ConditionsDeReutilisation <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field conditions wysiwygEditor  <%= Util.isEmpty(obj.getConditions(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(ConditionsDeReutilisation.class, "conditions", userLang) %><jalios:edit pub='<%= obj %>' fields='conditions'/></td>
    <td class='field-data' <%= gfla(obj, "conditions") %>>
            <% if (Util.notEmpty(obj.getConditions(userLang))) { %>
            <jalios:wysiwyg data='<%= obj %>' field='conditions'><%= obj.getConditions(userLang) %></jalios:wysiwyg>            
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- MxC+lo4gAcI9nE08XPs/zQ== --%>