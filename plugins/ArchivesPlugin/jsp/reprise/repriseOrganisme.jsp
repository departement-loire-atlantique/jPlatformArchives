<%@ include file="/jcore/doInitPage.jsp" %><%

if(!isAdmin) {
	sendForbidden(request, response);
	return;
}

%>

<jsp:useBean id='formHandler' scope='page' class='fr.cg44.plugin.archives.formhandler.OrganismeCsvImportHandler'> <%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>                   <%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>                 <%
  %><jsp:setProperty name='formHandler' property='*' />                                               <%
%></jsp:useBean><% 

if (formHandler.validate()) {
  sendRedirect("plugins/ArchivesPlugin/jsp/reprise/repriseOrganisme.jsp");
}
%>

<%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header"><h1>Reprise des organismes avec contacts</h1></div>

<p>Le fichier csv doit avoir un champ organisme, email, idjcms et les contacts correspondants doivent être créés dans jcms. La première ligne doit contenir les entêtes. Le fichier doit être encodé en UTF-8.</p>
<p><a href="plugins/ArchivesPlugin/jsp/reprise/test_import_organisme.csv" download>Fichier CVS exemple </a> 


<%@ include file='/jcore/doMessageBox.jspf'%>

<form class="form-horizontal noSingleSubmitButton" name="organismeForm" lang="fr" action="plugins/ArchivesPlugin/jsp/reprise/repriseOrganisme.jsp" method="post" role="form" accept-charset="UTF-8" enctype="multipart/form-data">

    <jalios:field name='file' label='Fichier CSV'>
       <jalios:control settings="<%= new FileSettings().mode(FileSettings.Mode.SIMPLE_FILE) %>" />
    </jalios:field>
    
    <input class="btn btn-primary" type="submit" name="opUpload" value="importer" />

</form>

<%@ include file='/admin/doAdminFooter.jspf' %> 