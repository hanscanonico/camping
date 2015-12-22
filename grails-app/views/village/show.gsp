
<%@ page import="camping.Village" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'village.label', default: 'Village')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-village" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-village" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list village">
			
				<g:if test="${villageInstance?.langues}">
				<li class="fieldcontain">
					<span id="langues-label" class="property-label"><g:message code="village.langues.label" default="Langues" /></span>
					
						<g:each in="${villageInstance.langues}" var="l">
						<span class="property-value" aria-labelledby="langues-label"><g:link controller="langue" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${villageInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="village.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${villageInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${villageInstance?.pays}">
				<li class="fieldcontain">
					<span id="pays-label" class="property-label"><g:message code="village.pays.label" default="Pays" /></span>
					
						<span class="property-value" aria-labelledby="pays-label"><g:link controller="pays" action="show" id="${villageInstance?.pays?.id}">${villageInstance?.pays?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${villageInstance?.proposer}">
				<li class="fieldcontain">
					<span id="proposer-label" class="property-label"><g:message code="village.proposer.label" default="Proposer" /></span>
					
						<g:each in="${villageInstance.proposer}" var="p">
						<span class="property-value" aria-labelledby="proposer-label"><g:link controller="proposer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:villageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${villageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
