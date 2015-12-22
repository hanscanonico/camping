<%@ page import="camping.Activite" %>



<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'designatic', 'error')} required">
	<label for="designatic">
		<g:message code="activite.designatic.label" default="Designatic" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="designatic" required="" value="${activiteInstance?.designatic}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'proposer', 'error')} ">
	<label for="proposer">
		<g:message code="activite.proposer.label" default="Proposer" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${activiteInstance?.proposer?}" var="p">
    <li><g:link controller="proposer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="proposer" action="create" params="['activite.id': activiteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'proposer.label', default: 'Proposer')])}</g:link>
</li>
</ul>


</div>

