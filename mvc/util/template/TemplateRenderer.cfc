﻿<!---
/**
  *
  *
  *    Copyright 2015 - Cargopoooling, Inc. - U.S.A.
  *    Author: Cristian Costantini
  *    www.cargopooling.com
  *
  *    Licensed under the Apache License, Version 2.0 (the "License");
  *    you may not use this file except in compliance with the License.
  *    You may obtain a copy of the License at
  *
  *    http://www.apache.org/licenses/LICENSE-2.0
  *
  *    Unless required by applicable law or agreed to in writing, software
  *    distributed under the License is distributed on an "AS IS" BASIS,
  *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  *    See the License for the specific language governing permissions and
  *    limitations under the License.
  *
  *
**/
--->
<cfcomponent output="false" >
	
	<cffunction name="init" access="public" returntype="TemplateRenderer">
		<cfargument name="templatePath" type="String" required="true" />
	
		<cfset variables.configTemplatePath = arguments.templatePath />
	
		<cfreturn this/>
	</cffunction>

	<cffunction name="render" access="public" returntype="String" output="false">
    	<cfargument name="event" type="mvc.core.Event" required="true" />
    	<cfargument name="template" type="String" required="true" />
		<cfset var viewrenderer = "" />
			
		<cfsavecontent variable="viewrenderer"><cfmodule template="/mvc/util/template/templateRenderer.cfm" 
					  includePath="/#variables.configTemplatePath#/#template#"
					  event="#arguments.event#" /></cfsavecontent>
			
		<cfreturn viewrenderer />
    </cffunction>


</cfcomponent>