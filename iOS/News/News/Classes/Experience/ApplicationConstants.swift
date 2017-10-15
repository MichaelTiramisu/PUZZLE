/*
 * Copyright (c) Microsoft. All rights reserved. Licensed under the MIT license.
 * See LICENSE in the project root for license information.
 */


import Foundation

struct ApplicationConstants {
    static let clientId = "c787b7ec-7ad9-4d6b-90b0-b2d87cf18269"
    static let scopes   = ["mail.send","Files.ReadWrite","User.ReadBasic.All"]
}


/**
 Simple construct to encapsulate NSError. This could be expanded for more types of graph errors in future. 
 */
enum MSGraphError: Error {
    case nsErrorType(error: NSError)

}
