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
---><cfif thistag.executionmode eq "start"><cfsilent>

<cfscript>

event = attributes.event;

// uses i18n framework
function i18n( required String context, required String key, String altContext="", String altKey="" ){

    return event.getValue('i18n').getText( argumentCollection=arguments );

};

// get helper by name
function helper( required String name  ){

    return event.getHelpers().get( name );
}

</cfscript>


</cfsilent><cfinclude template="#attributes.includePath#" /></cfif>