<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<% String[] formTitles = JcmsUtil.getLanguageArray(channel.getTypeEntry(AutreRechercheForm.class).getLabelMap()); %>
<jsp:useBean id='formHandler' scope='page' class='generated.EditAutreRechercheFormHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='author' value='j_2'/>
  <jsp:setProperty name='formHandler' property='title' value='<%= formTitles %>'/>
</jsp:useBean>
<%
  if (formHandler.validate()) {
    return;
  }
%>   

<jalios:if predicate='<%= formHandler.isOneSubmit() && formHandler.isSubmitted() %>'>
  <% setWarningMsg(glp("msg.edit.already-one-submit"), request); %>
</jalios:if>

<jalios:if predicate='<%= channel.isDataWriteEnabled() %>'>

<%-- -- FORM -------------------------------------------- --%>
<jalios:query name='__memberSet' dataset='<%= channel.getDataSet(Member.class) %>' comparator='<%= Member.getNameComparator() %>'/>
<% request.setAttribute("formMemberSet", __memberSet); %>
<jalios:query name='__groupSet' dataset='<%= channel.getDataSet(Group.class) %>' comparator='<%= Group.getNameComparator() %>'/>
<% request.setAttribute("formGroupSet", __groupSet); %>


<div class="ds44-loader-text visually-hidden" tabindex="-1" aria-live="polite"></div>
<div class="ds44-loader hidden">
    <div class="ds44-loader-body">
        <svg class="ds44-loader-circular" focusable="false" aria-hidden="true">
            <circle class="ds44-loader-path" cx="30" cy="30" r="20" fill="none" stroke-width="5" stroke-miterlimit="10"></circle>
        </svg>
    </div>
</div>

<article class="ds44-container-large ds44-mtb5">
    <div class="ds44-inner-container ds44-grid12-offset-1">
    
        <%@ include file='/plugins/SoclePlugin/jsp/doMessageBoxCustom.jspf' %>
        
        <p class="ds44-textLegend ds44-textLegend--mentions"><%= glp("jcmsplugin.socle.facette.champs-obligatoires") %></p>

		<%
		Publication currentPub = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
		String formAction = "plugins/SoclePlugin/jsp/forms/doFormDecodeParams.jsp";
		%>
		<form action='<%= formAction %>' method='post' name='editForm' accept-charset="UTF-8" enctype="multipart/form-data">
		    
		    <%
		    request.setAttribute("formHandler", formHandler);
		    %>
		
		    <jsp:include page="doEditAutreRechercheForm.jsp" />
		    
		    <input type='hidden' name='redirect' value='<%= currentPub.getDisplayUrl(userLocale) %>' data-technical-field />
		    <input type='hidden' name='ws' value='<%= formHandler.getWorkspace().getId() %>' data-technical-field />
		    <input type='hidden' name='opCreate' value='<%= glp("ui.com.btn.submit") %>' data-technical-field />
		    <input type="hidden" name="csrftoken" value="<%= HttpUtil.getCSRFToken(request) %>" data-technical-field>
		    <input type="hidden" name="noSendRedirect" value='true' data-technical-field />
		    <input type="hidden" name="id" value='<%= request.getParameter("id") %>' data-technical-field />
		
		</form>

    </div>
</article>

<% request.setAttribute("idPortletBas", channel.getProperty("jcmsplugin.socle.form.candidature.portlet-rgpd.id")); %>

</jalios:if>
