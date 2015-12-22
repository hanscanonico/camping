
<%@ page import="camping.Langue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'langue.label', default: 'Langue')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-langue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-langue" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list langue">
			
				<g:if test="${langueInstance?.designatic}">
				<li class="fieldcontain">
					<span id="designatic-label" class="property-label"><g:message code="langue.designatic.label" default="Designatic" /></span>
					
						<span class="property-value" aria-labelledby="designatic-label"><g:fieldValue bean="${langueInstance}" field="designatic"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${langueInstance?.villages}">
				<li class="fieldcontain">
					<span id="villages-label" class="property-label"><g:message code="langue.villages.label" default="Villages" /></span>
					
						<g:each in="${langueInstance.villages}" var="v">
						<span class="property-value" aria-labelledby="villages-label"><g:link controller="village" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:langueInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${langueInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
