//
//  Logger+objectiveC.swift
//  Log4swift
//
//  Created by Jérôme Duquennoy on 20/07/15.
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

import Foundation

/**
This extension of the Logger class adds logging methods that can be exported to objective-C.
There are multiple functions to accomodate the limitations of Objective-C (no default values for parameters notably).
*/
extension Logger {

  /// Logs a trace message. This method is meant to be used from Objective-C.
  /// When in swift, prefer the "trace" method.
  @objc public func logTrace(_ message: String, info:[String:Any]?) {
    self.log(message: message, info:info, level: LogLevel.Trace)
  }
  /// Logs a debug message. This method is meant to be used from Objective-C.
  /// When in swift, prefer the "debug" method.
  @objc public func logDebug(_ message: String, info:[String:Any]?) {
    self.log(message: message, info:info, level: LogLevel.Debug)
  }
  /// Logs a info message. This method is meant to be used from Objective-C.
  /// When in swift, prefer the "info" method.
  @objc public func logInfo(_ message: String, info:[String:Any]?) {
    self.log(message: message, info:info, level: LogLevel.Info)
  }
  /// Logs a warning message. This method is meant to be used from Objective-C.
  /// When in swift, prefer the "warning" method.
  @objc public func logWarning(_ message: String, info:[String:Any]?) {
    self.log(message: message, info:info, level: LogLevel.Warning)
  }
  /// Logs a error message. This method is meant to be used from Objective-C.
  /// When in swift, prefer the "error" method.
  @objc public func logError(_ message: String, info:[String:Any]?) {
    self.log(message: message, info:info, level: LogLevel.Error)
  }
  /// Logs a fatal message. This method is meant to be used from Objective-C.
  /// When in swift, prefer the "fatal" method.
  @objc public func logFatal(_ message: String, info:[String:Any]?) {
    self.log(message: message, info:info, level: LogLevel.Fatal)
  }

  /// Logs a trace message. This method is meant to be used in macros when using Objective-C, to provide the file, line and function using the __FILE__, __LINE__ and __FUNCTION__ macros.
  /// When in swift, prefer the "trace" method.
  @objc public func logTrace(_ message: String, _ info:[String:Any]?, file: String, line: Int, function: String) {
    self.log(message: message, info:info, level: LogLevel.Trace, file: file, line: line, function: function)
  }
  /// Logs a debug message. This method is meant to be used in macros when using Objective-C, to provide the file, line and function using the __FILE__, __LINE__ and __FUNCTION__ macros.
  /// When in swift, prefer the "debug" method.
  @objc public func logDebug(_ message: String, _ info:[String:Any]?, file: String, line: Int, function: String) {
    self.log(message: message, info:info, level: LogLevel.Debug, file: file, line: line, function: function)
  }
  /// Logs a info message. This method is meant to be used in macros when using Objective-C, to provide the file, line and function using the __FILE__, __LINE__ and __FUNCTION__ macros.
  /// When in swift, prefer the "info" method.
  @objc public func logInfo(_ message: String, _ info:[String:Any]?, file: String, line: Int, function: String) {
    self.log(message: message, info:info, level: LogLevel.Info, file: file, line: line, function: function)
  }
  /// Logs a warning message. This method is meant to be used in macros when using Objective-C, to provide the file, line and function using the __FILE__, __LINE__ and __FUNCTION__ macros.
  /// When in swift, prefer the "warning" method.
  @objc public func logWarning(_ message: String, _ info:[String:Any]?, file: String, line: Int, function: String) {
    self.log(message: message, info:info, level: LogLevel.Warning, file: file, line: line, function: function)
  }
  /// Logs a error message. This method is meant to be used in macros when using Objective-C, to provide the file, line and function using the __FILE__, __LINE__ and __FUNCTION__ macros.
  /// When in swift, prefer the "error" method.
  @objc public func logError(_ message: String, _ info:[String:Any]?, file: String, line: Int, function: String) {
    self.log(message: message, info:info, level: LogLevel.Error, file: file, line: line, function: function)
  }
  /// Logs a fatal message. This method is meant to be used in macros when using Objective-C, to provide the file, line and function using the __FILE__, __LINE__ and __FUNCTION__ macros.
  /// When in swift, prefer the "fatal" method.
  @objc public func logFatal(_ message: String, _ info:[String:Any]?, file: String, line: Int, function: String) {
    self.log(message: message, info:info, level: LogLevel.Fatal, file: file, line: line, function: function)
  }

  /// Logs a trace message. This method is meant to be used from Objective-C.
  /// When in swift, prefer the "trace" method.
  @objc public func logTraceBloc(_ closure: @escaping () -> Any) {
    self.log(closure: {
        let r = closure()
        switch r {
        case let msg as String:
            return (msg, nil)
        case let couple as [Any]:
            if couple.count != 2 {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            guard let msg = couple[0] as? String else {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            let args = couple[1] as? [String:Any]
            return (msg, args)

        default:
            return ("illegal obj closure return value: return=\(r)", nil)
        }
    }, level: LogLevel.Trace)
  }
  /// Logs a debug message. This method is meant to be used from Objective-C.
  /// When in swift, prefer the "debug" method.
  @objc public func logDebugBloc(_ closure: @escaping () -> Any) {
    self.log(closure: {
        let r = closure()
        switch r {
        case let msg as String:
            return (msg, nil)
        case let couple as [Any]:
            if couple.count != 2 {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            guard let msg = couple[0] as? String else {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            let args = couple[1] as? [String:Any]
            return (msg, args)

        default:
            return ("illegal obj closure return value: return=\(r)", nil)
        }
    }, level: LogLevel.Debug)
  }
  /// Logs info message. This method is meant to be used from Objective-C.
  /// When in swift, prefer the "info" method.
  @objc public func logInfoBloc(_ closure: @escaping () -> Any) {
    self.log(closure: {
        let r = closure()
        switch r {
        case let msg as String:
            return (msg, nil)
        case let couple as [Any]:
            if couple.count != 2 {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            guard let msg = couple[0] as? String else {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            let args = couple[1] as? [String:Any]
            return (msg, args)

        default:
            return ("illegal obj closure return value: return=\(r)", nil)
        }
    }, level: LogLevel.Info)
  }
  /// Logs a warning message. This method is meant to be used from Objective-C.
  /// When in swift, prefer the "warning" method.
  @objc public func logWarningBloc(_ closure: @escaping () -> Any) {
    self.log(closure: {
        let r = closure()
        switch r {
        case let msg as String:
            return (msg, nil)
        case let couple as [Any]:
            if couple.count != 2 {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            guard let msg = couple[0] as? String else {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            let args = couple[1] as? [String:Any]
            return (msg, args)

        default:
            return ("illegal obj closure return value: return=\(r)", nil)
        }
    }, level: LogLevel.Warning)
  }
  /// Logs a error message. This method is meant to be used from Objective-C.
  /// When in swift, prefer the "error" method.
  @objc public func logErrorBloc(_ closure: @escaping () -> Any) {
    self.log(closure: {
        let r = closure()
        switch r {
        case let msg as String:
            return (msg, nil)
        case let couple as [Any]:
            if couple.count != 2 {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            guard let msg = couple[0] as? String else {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            let args = couple[1] as? [String:Any]
            return (msg, args)

        default:
            return ("illegal obj closure return value: return=\(r)", nil)
        }
    }, level: LogLevel.Error)
  }
  /// Logs a fatal closure. This method is meant to be used from Objective-C.
  /// When in swift, prefer the "fatal" method.
  @objc public func logFatalBloc(_ closure: @escaping () -> Any) {
    self.log(closure: {
        let r = closure()
        switch r {
        case let msg as String:
            return (msg, nil)
        case let couple as [Any]:
            if couple.count != 2 {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            guard let msg = couple[0] as? String else {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            let args = couple[1] as? [String:Any]
            return (msg, args)

        default:
            return ("illegal obj closure return value: return=\(r)", nil)
        }
    }, level: LogLevel.Fatal)
  }

  /// Logs a trace message. This method is meant to be used in macros when using Objective-C, to provide the file, line and function using the __FILE__, __LINE__ and __FUNCTION__ macros.
  /// When in swift, prefer the "trace" method.
  @objc public func logTraceBloc(_ closure: @escaping () -> Any, file: String, line: Int, function: String) {
    self.log(closure: {
        let r = closure()
        switch r {
        case let msg as String:
            return (msg, nil)
        case let couple as [Any]:
            if couple.count != 2 {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            guard let msg = couple[0] as? String else {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            let args = couple[1] as? [String:Any]
            return (msg, args)

        default:
            return ("illegal obj closure return value: return=\(r)", nil)
        }
    }, level: LogLevel.Trace, file: file, line: line, function: function)
  }
  /// Logs a debug message. This method is meant to be used in macros when using Objective-C, to provide the file, line and function using the __FILE__, __LINE__ and __FUNCTION__ macros.
  /// When in swift, prefer the "debug" method.
  @objc public func logDebugBloc(_ closure: @escaping () -> Any, file: String, line: Int, function: String) {
    self.log(closure: {
        let r = closure()
        switch r {
        case let msg as String:
            return (msg, nil)
        case let couple as [Any]:
            if couple.count != 2 {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            guard let msg = couple[0] as? String else {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            let args = couple[1] as? [String:Any]
            return (msg, args)

        default:
            return ("illegal obj closure return value: return=\(r)", nil)
        }
    }, level: LogLevel.Debug, file: file, line: line, function: function)
  }
  /// Logs a info message. This method is meant to be used in macros when using Objective-C, to provide the file, line and function using the __FILE__, __LINE__ and __FUNCTION__ macros.
  /// When in swift, prefer the "info" method.
  @objc public func logInfoBloc(_ closure: @escaping () -> Any, file: String, line: Int, function: String) {
    self.log(closure: {
        let r = closure()
        switch r {
        case let msg as String:
            return (msg, nil)
        case let couple as [Any]:
            if couple.count != 2 {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            guard let msg = couple[0] as? String else {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            let args = couple[1] as? [String:Any]
            return (msg, args)

        default:
            return ("illegal obj closure return value: return=\(r)", nil)
        }
    }, level: LogLevel.Info, file: file, line: line, function: function)
  }
  /// Logs a warning message. This method is meant to be used in macros when using Objective-C, to provide the file, line and function using the __FILE__, __LINE__ and __FUNCTION__ macros.
  /// When in swift, prefer the "warning" method.
  @objc public func logWarningBloc(_ closure: @escaping () -> Any, file: String, line: Int, function: String) {
    self.log(closure: {
        let r = closure()
        switch r {
        case let msg as String:
            return (msg, nil)
        case let couple as [Any]:
            if couple.count != 2 {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            guard let msg = couple[0] as? String else {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            let args = couple[1] as? [String:Any]
            return (msg, args)

        default:
            return ("illegal obj closure return value: return=\(r)", nil)
        }
    }, level: LogLevel.Warning, file: file, line: line, function: function)
  }
  /// Logs a error message. This method is meant to be used in macros when using Objective-C, to provide the file, line and function using the __FILE__, __LINE__ and __FUNCTION__ macros.
  /// When in swift, prefer the "error" method.
  @objc public func logErrorBloc(_ closure: @escaping () -> Any, file: String, line: Int, function: String) {
    self.log(closure: {
        let r = closure()
        switch r {
        case let msg as String:
            return (msg, nil)
        case let couple as [Any]:
            if couple.count != 2 {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            guard let msg = couple[0] as? String else {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            let args = couple[1] as? [String:Any]
            return (msg, args)

        default:
            return ("illegal obj closure return value: return=\(r)", nil)
        }
    }, level: LogLevel.Error, file: file, line: line, function: function)
  }
  /// Logs a fatal message. This method is meant to be used in macros when using Objective-C, to provide the file, line and function using the __FILE__, __LINE__ and __FUNCTION__ macros.
  /// When in swift, prefer the "fatal" method.
  @objc public func logFatalBloc(_ closure: @escaping () -> Any, file: String, line: Int, function: String) {
    self.log(closure: {
        let r = closure()
        switch r {
        case let msg as String:
            return (msg, nil)
        case let couple as [Any]:
            if couple.count != 2 {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            guard let msg = couple[0] as? String else {
                return ("illegal obj closure return value: return=\(r)", nil)
            }
            let args = couple[1] as? [String:Any]
            return (msg, args)

        default:
            return ("illegal obj closure return value: return=\(r)", nil)
        }
    }, level: LogLevel.Fatal, file: file, line: line, function: function)
  }
  
}
