//
//  LogRecordBuilder.swift
//  log4swift
//
//  Created by Simone Pierazzini on 14/09/18.
//  Copyright © 2018 Simone Pierazzini. All rights reserved.
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

import Foundation

enum LogRecordBuilderState {
    case Message
    case WaitingForKey
    case SkipValue
}

func buildLogRecord (_ fmt: String, _ args: [CVarArg], info: inout LogInfoDictionary) -> String {
    var state : LogRecordBuilderState = .Message
    var currentKey = ""
    var varArgIndex = 0

    for c in fmt {
        switch state {
        case .Message:
            switch c {
            case ":":
                state = .WaitingForKey
            default:
                break
            }

        case .WaitingForKey:
            switch c {
            case "=":
                currentKey = currentKey.trimmingCharacters(in: .whitespaces)

                if varArgIndex < args.count {
                    info[currentKey] = args[varArgIndex]
                }

                varArgIndex += 1
                currentKey = ""

                state = .SkipValue

            default:
                currentKey.append(c)
            }

        case .SkipValue:
            switch (c) {
            case " ":
                state = .WaitingForKey
            default:
                break
            }
        }
    }

    return fmt.format(args: args)
}
