<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: Periodique display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% Periodique obj = (Periodique)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay Periodique <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field imageBandeau textfieldEditor  <%= Util.isEmpty(obj.getImageBandeau()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "imageBandeau", userLang) %><jalios:edit pub='<%= obj %>' fields='imageBandeau'/></td>
    <td class='field-data' <%= gfla(obj, "imageBandeau") %>>
            <% if (Util.notEmpty(obj.getImageBandeau())) { %>
            <%= obj.getImageBandeau() %>
            <% } %>
    </td>
  </tr>
  <tr class="field copyright textfieldEditor  <%= Util.isEmpty(obj.getCopyright()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "copyright", userLang) %><jalios:edit pub='<%= obj %>' fields='copyright'/></td>
    <td class='field-data' <%= gfla(obj, "copyright") %>>
            <% if (Util.notEmpty(obj.getCopyright())) { %>
            <%= obj.getCopyright() %>
            <% } %>
    </td>
  </tr>
  <tr class="field legende textfieldEditor  <%= Util.isEmpty(obj.getLegende()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "legende", userLang) %><jalios:edit pub='<%= obj %>' fields='legende'/></td>
    <td class='field-data' <%= gfla(obj, "legende") %>>
            <% if (Util.notEmpty(obj.getLegende())) { %>
            <%= obj.getLegende() %>
            <% } %>
    </td>
  </tr>
  <tr class="field texteAlternatif textfieldEditor  <%= Util.isEmpty(obj.getTexteAlternatif()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "texteAlternatif", userLang) %><jalios:edit pub='<%= obj %>' fields='texteAlternatif'/></td>
    <td class='field-data' <%= gfla(obj, "texteAlternatif") %>>
            <% if (Util.notEmpty(obj.getTexteAlternatif())) { %>
            <%= obj.getTexteAlternatif() %>
            <% } %>
    </td>
  </tr>
  <tr class="field coteDePeriodique textfieldEditor  <%= Util.isEmpty(obj.getCoteDePeriodique(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "coteDePeriodique", userLang) %><jalios:edit pub='<%= obj %>' fields='coteDePeriodique'/></td>
    <td class='field-data' <%= gfla(obj, "coteDePeriodique") %>>
            <% if (Util.notEmpty(obj.getCoteDePeriodique(userLang))) { %>
            <%= obj.getCoteDePeriodique(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field datesExtremesDeLaCollection textfieldEditor  <%= Util.isEmpty(obj.getDatesExtremesDeLaCollection(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "datesExtremesDeLaCollection", userLang) %><jalios:edit pub='<%= obj %>' fields='datesExtremesDeLaCollection'/></td>
    <td class='field-data' <%= gfla(obj, "datesExtremesDeLaCollection") %>>
            <% if (Util.notEmpty(obj.getDatesExtremesDeLaCollection(userLang))) { %>
            <%= obj.getDatesExtremesDeLaCollection(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field datesExtremesDeLaCollectionNumer textfieldEditor  <%= Util.isEmpty(obj.getDatesExtremesDeLaCollectionNumer(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "datesExtremesDeLaCollectionNumer", userLang) %><jalios:edit pub='<%= obj %>' fields='datesExtremesDeLaCollectionNumer'/></td>
    <td class='field-data' <%= gfla(obj, "datesExtremesDeLaCollectionNumer") %>>
            <% if (Util.notEmpty(obj.getDatesExtremesDeLaCollectionNumer(userLang))) { %>
            <%= obj.getDatesExtremesDeLaCollectionNumer(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field inventaireDeLaCollection linkEditor  <%= Util.isEmpty(obj.getInventaireDeLaCollection()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "inventaireDeLaCollection", userLang) %><jalios:edit pub='<%= obj %>' fields='inventaireDeLaCollection'/></td>
    <td class='field-data' >
            <% if (obj.getInventaireDeLaCollection() != null && obj.getInventaireDeLaCollection().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getInventaireDeLaCollection() %>' params='details=true' ><jalios:fileicon doc='<%= obj.getInventaireDeLaCollection() %>' /></jalios:link>
            <jalios:link data='<%= obj.getInventaireDeLaCollection() %>'/>
            - <jalios:filesize doc='<%=  obj.getInventaireDeLaCollection() %>'/>
            <jalios:pdf doc='<%= obj.getInventaireDeLaCollection() %>' />
            <% } %>
    </td>
  </tr>
  <tr class="field frequenceParution categoryEditor  <%= Util.isEmpty(obj.getFrequenceParution(loggedMember)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "frequenceParution", userLang) %><jalios:edit pub='<%= obj %>' fields='frequenceParution'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getFrequenceParution(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= obj.getFrequenceParution(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("p1_548439"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field ancienTitre linkEditor  <%= Util.isEmpty(obj.getAncienTitre()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "ancienTitre", userLang) %><jalios:edit pub='<%= obj %>' fields='ancienTitre'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getAncienTitre())) { %>
            <ol>
              <jalios:foreach name="itData" type="generated.Periodique" array="<%= obj.getAncienTitre() %>">
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
  <tr class="field titreDevenu linkEditor  <%= Util.isEmpty(obj.getTitreDevenu()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "titreDevenu", userLang) %><jalios:edit pub='<%= obj %>' fields='titreDevenu'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getTitreDevenu())) { %>
            <ol>
              <jalios:foreach name="itData" type="generated.Periodique" array="<%= obj.getTitreDevenu() %>">
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
  <tr class="field notes textareaEditor  <%= Util.isEmpty(obj.getNotes()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "notes", userLang) %><jalios:edit pub='<%= obj %>' fields='notes'/></td>
    <td class='field-data' <%= gfla(obj, "notes") %>>
            <% if (Util.notEmpty(obj.getNotes())) { %>
            <%= obj.getNotes() %>
            <% } %>
    </td>
  </tr>
  <tr class="field siegeDuJournal linkEditor  <%= Util.isEmpty(obj.getSiegeDuJournal()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "siegeDuJournal", userLang) %><jalios:edit pub='<%= obj %>' fields='siegeDuJournal'/></td>
    <td class='field-data' >
            <% if (obj.getSiegeDuJournal() != null && obj.getSiegeDuJournal().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getSiegeDuJournal() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field numerise booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "numerise", userLang) %><jalios:edit pub='<%= obj %>' fields='numerise'/></td>
    <td class='field-data' >
            <%= obj.getNumeriseLabel(userLang) %>
    </td>
  </tr>
  <tr class="field theme categoryEditor  <%= Util.isEmpty(obj.getTheme(loggedMember)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "theme", userLang) %><jalios:edit pub='<%= obj %>' fields='theme'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getTheme(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= obj.getTheme(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("c_5061"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field tendencesPolitiques categoryEditor  <%= Util.isEmpty(obj.getTendencesPolitiques(loggedMember)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "tendencesPolitiques", userLang) %><jalios:edit pub='<%= obj %>' fields='tendencesPolitiques'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getTendencesPolitiques(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= obj.getTendencesPolitiques(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("t1_24722"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field periode categoryEditor  <%= Util.isEmpty(obj.getPeriode(loggedMember)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "periode", userLang) %><jalios:edit pub='<%= obj %>' fields='periode'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getPeriode(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= obj.getPeriode(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("p2_911614"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field communesConcernees linkEditor  <%= Util.isEmpty(obj.getCommunesConcernees()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "communesConcernees", userLang) %><jalios:edit pub='<%= obj %>' fields='communesConcernees'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getCommunesConcernees())) { %>
            <ol>
              <jalios:foreach name="itData" type="generated.City" array="<%= obj.getCommunesConcernees() %>">
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
  <tr class="field toutesLesCommunesDuDepartement booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(Periodique.class, "toutesLesCommunesDuDepartement", userLang) %><jalios:edit pub='<%= obj %>' fields='toutesLesCommunesDuDepartement'/></td>
    <td class='field-data' >
            <%= obj.getToutesLesCommunesDuDepartementLabel(userLang) %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- vwuzZi7pHgdT6jzvcxgRWA== --%>