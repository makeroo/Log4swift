//
//  LogInformation.swift
//  Log4swift
//
//  Created by Jérôme Duquennoy on 08/07/2015.
//  Copyright © 2015 Jérôme Duquennoy. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

/**
Keys used in the information dictionary attached to log messages
*/
let LogInfoLogLevel = "LogLevel"
let LogInfoLoggerName = "LoggerName"
let LogInfoFileName = "FileName"
let LogInfoFileLine = "FileLine"
let LogInfoFunction = "Function"
let LogInfoTimestamp = "Timestamp"
let LogInfoThreadId = "ThreadId"
let LogInfoThreadName = "ThreadName"

/**
The definition of the type used to attach meta informations to log messages
*/
public typealias LogInfoDictionary = Dictionary<String, Any>
