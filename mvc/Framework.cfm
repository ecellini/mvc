﻿<cfscript>
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
param name="url[ request._configurations.eventName ]" type="String" default="#request._configurations.defaultEvent#";

event = request._framework.executeEvent( name='framework.onRequestStart' );

event = request._framework.executeEvent( name=url[ request._configurations.eventName ], eh=event );

request._framework.executeEvent( name='framework.onRequestEnd', eh=event );

view = event.getView( 'main' );
</cfscript>
<cfheader statuscode="#event.getValue( 'http-status-code' )#" />
<cfcontent type="#event.getContentType()#" /><cfset writeOutput( view ) />
