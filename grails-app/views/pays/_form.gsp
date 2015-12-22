<%@ page import="camping.Pays" %>



<div class="fieldcontain ${hasErrors(bean: paysInstance, field: 'continent', 'error')} required">
	<label for="continent">
		<g:message code="pays.continent.label" default="Continent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="continent" name="continent.id" from="${camping.Continent.list()}" optionKey="id" required="" value="${paysInstance?.continent?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: paysInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="pays.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${paysInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: paysInstance, field: 'villages', 'error')} ">
	<label for="villages">
		<g:message code="pays.villages.label" default="Villages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${paysInstance?.villages?}" var="v">
    <li><g:link controller="village" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="village" action="create" params="['pays.id': paysInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'village.label', default: 'Village')])}</g:link>
</li>
</ul>


</div>

