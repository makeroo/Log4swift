//
//  Formatter.swift
//  Log4swift
//
//  Created by Jérôme Duquennoy on 18/06/2015.
//  Copyright © 2015 Jérôme Duquennoy. All rights reserved.
//
// Log4swift is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Log4swift is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with Foobar. If not, see <http://www.gnu.org/licenses/>.
//

/**
Keys used in the information dictionary passed to the formatters
*/
public enum FormatterInfoKeys {
  case LogLevel
  case LoggerName
}

/**
The definition of the type used to pass informations to the formatters
*/
public typealias FormatterInfoDictionary = Dictionary<FormatterInfoKeys, CustomStringConvertible>;

/**
This protocol defines a formatter, that will format log messages on the fly.
*/
public protocol Formatter {
   func format(message: String, info: FormatterInfoDictionary) -> String;
}