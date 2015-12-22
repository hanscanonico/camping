<%@ page import="camping.Continent" %>



<div class="fieldcontain ${hasErrors(bean: continentInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="continent.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${continentInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: continentInstance, field: 'pays', 'error')} ">
	<label for="pays">
		<g:message code="continent.pays.label" default="Pays" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${continentInstance?.pays?}" var="p">
    <li><g:link controller="pays" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pays" action="create" params="['continent.id': continentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pays.label', default: 'Pays')])}</g:link>
</li>
</ul>


</div>

