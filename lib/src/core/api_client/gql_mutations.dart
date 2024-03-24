
String loginMutation(String email, String password,  userType) {
    return '''
      mutation Login {
          login(
              payload: { email: "$email", password: "$password" }
              userType: CUSTOMER
          ) { 
              responseMessage
              errors
              data {
                  accessToken
                  refreshToken
              }
              responseStatus {
                  errorCode
                  statusCode
                  isSuccess
              }
          }
      }
    ''';
  }

String registrationMutation(String email, String password, String userType) {
    return '''
      mutation Register {
          register(payload: { email: "$email", password: "$password", userType: CUSTOMER }) {
              data {
                  id
                  userType
                  email
                  firstName
                  lastName
              }
              responseStatus {
                  errorCode
                  statusCode
                  isSuccess
              }
              responseMessage
          }
      }
      ''';
  }

String forgotPasswordMutation(String email) {
  return '''
    mutation ForgotPassword {
        forgotPassword(email: "$email") {
            responseMessage
            responseStatus {
                statusCode
            }
        }
    }
    ''';
}

String resetPasswordMutation(String token, String uid, String newPassword) {
  return '''
    mutation ResetPassword {
      resetPassword(payload: { token: $token, newPassword: $newPassword, uid: $uid }) {
          responseStatus {
              statusCode
          }
          responseMessage
      }
    }
  ''';
}