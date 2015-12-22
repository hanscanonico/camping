<%@ page import="camping.Proposer" %>



<div class="fieldcontain ${hasErrors(bean: proposerInstance, field: 'activite', 'error')} required">
	<label for="activite">
		<g:message code="proposer.activite.label" default="Activite" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activite" name="activite.id" from="${camping.Activite.list()}" optionKey="id" required="" value="${proposerInstance?.activite?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proposerInstance, field: 'prix', 'error')} required">
	<label for="prix">
		<g:message code="proposer.prix.label" default="Prix" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="prix" value="${fieldValue(bean: proposerInstance, field: 'prix')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: proposerInstance, field: 'village', 'error')} required">
	<label for="village">
		<g:message code="proposer.village.label" default="Village" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="village" name="village.id" from="${camping.Village.list()}" optionKey="id" required="" value="${proposerInstance?.village?.id}" class="many-to-one"/>

</div>

