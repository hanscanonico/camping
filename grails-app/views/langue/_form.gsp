<%@ page import="camping.Langue" %>



<div class="fieldcontain ${hasErrors(bean: langueInstance, field: 'designatic', 'error')} required">
	<label for="designatic">
		<g:message code="langue.designatic.label" default="Designatic" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="designatic" required="" value="${langueInstance?.designatic}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: langueInstance, field: 'villages', 'error')} ">
	<label for="villages">
		<g:message code="langue.villages.label" default="Villages" />
		
	</label>
	

</div>

