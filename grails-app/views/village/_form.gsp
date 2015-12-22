<%@ page import="camping.Village" %>



<div class="fieldcontain ${hasErrors(bean: villageInstance, field: 'langues', 'error')} ">
	<label for="langues">
		<g:message code="village.langues.label" default="Langues" />
		
	</label>
	<g:select name="langues" from="${camping.Langue.list()}" multiple="multiple" optionKey="id" size="5" value="${villageInstance?.langues*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: villageInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="village.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${villageInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: villageInstance, field: 'pays', 'error')} required">
	<label for="pays">
		<g:message code="village.pays.label" default="Pays" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pays" name="pays.id" from="${camping.Pays.list()}" optionKey="id" required="" value="${villageInstance?.pays?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: villageInstance, field: 'proposer', 'error')} ">
	<label for="proposer">
		<g:message code="village.proposer.label" default="Proposer" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${villageInstance?.proposer?}" var="p">
    <li><g:link controller="proposer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="proposer" action="create" params="['village.id': villageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'proposer.label', default: 'Proposer')])}</g:link>
</li>
</ul>


</div>

