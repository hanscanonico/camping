
<%@ page import="camping.Proposer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proposer.label', default: 'Proposer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-proposer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-proposer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="proposer.activite.label" default="Activite" /></th>
					
						<g:sortableColumn property="prix" title="${message(code: 'proposer.prix.label', default: 'Prix')}" />
					
						<th><g:message code="proposer.village.label" default="Village" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${proposerInstanceList}" status="i" var="proposerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${proposerInstance.id}">${fieldValue(bean: proposerInstance, field: "activite")}</g:link></td>
					
						<td>${fieldValue(bean: proposerInstance, field: "prix")}</td>
					
						<td>${fieldValue(bean: proposerInstance, field: "village")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${proposerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
