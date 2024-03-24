import 'package:graphql/client.dart';
import 'package:myhealthcop/src/core/errors/exceptions.dart' as appEx;

import '../../../../core/api_client/gql_mutations.dart';
import '../models/user_model.dart';
import '../../domain/entities/user.dart';

abstract class AuthRemoteDataSource {
  Future<User> login(String email, String password, String userType);
  Future<User> register(String email, String password, String userType);
  Future<String> forgotPassword(String email);
  Future<String> resetPassword(String token, String uid, String newPassword);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final GraphQLClient _client;

  const AuthRemoteDataSourceImpl(this._client);

  @override
  Future<User> login(String email, String password, String userType) async {
    final result = await _client.mutate(MutationOptions(
      document: gql(loginMutation(email, password, userType)),
      variables: <String, dynamic>{
        'email': email,
        'password': password,
        'userType': userType,
      },
    ));
    
    if (result.hasException) {
      final linkEx = result.exception!.linkException;
      final graphQlErrors = result.exception!.graphqlErrors;
      if (linkEx is NetworkException) {
        throw appEx.NoInternetException(errorMessage: linkEx.message);
      } else if (linkEx is ServerException) {
        for (var e in graphQlErrors) {
          throw appEx.ServerException(errorMessage: e.message);
        }
      }
    } 
    final int statusCode = result.data!['login']['responseStatus']['statusCode'];
    final String message = result.data!['login']['responseMessage'];
    
    if (statusCode == 400) {
      throw appEx.LoginException(errorMessage: message);
    }
    return UserModel.fromJson(result.data);
  }

  @override
  Future<User> register(String email, String password, String userType) async {
    final result = await _client.mutate(MutationOptions(
        document: gql(registrationMutation(email, password, userType))));
            print('RESULT_DATA: ${result.data}');

    if (result.hasException) {
      final linkEx = result.exception!.linkException;
      final graphQlErrors = result.exception!.graphqlErrors;
      if (linkEx is NetworkException) {
        throw appEx.NoInternetException(errorMessage: linkEx.message);
      } else if (linkEx is ServerException) {
        for (var e in graphQlErrors) {
          throw appEx.ServerException(errorMessage: e.message);
        }
      }
    } 
    final int statusCode = result.data!['register']['responseStatus']['statusCode'];
    final String message = result.data!['register']['responseMessage'];
    
    if (statusCode == 400) {
      throw appEx.RegistrationException(errorMessage: message);
    }
    return UserModel.fromJson(result.data);
  }

  @override
  Future<String> forgotPassword(String email) async {
    final result = await _client
        .mutate(MutationOptions(document: gql(forgotPasswordMutation(email))));
    if (result.hasException) {
      final linkEx = result.exception!.linkException;
      final graphQlErrors = result.exception!.graphqlErrors;
      if (linkEx is NetworkException) {
        throw appEx.NoInternetException(errorMessage: linkEx.message);
      }
      if (linkEx is ServerException) {
        for (var e in graphQlErrors) {
          throw appEx.ServerException(errorMessage: e.message);
        }
      }
    }
    return result.data.toString();
  }

  @override
  Future<String> resetPassword(
      String token, String uid, String newPassword) async {
    final result = await _client.mutate(MutationOptions(
        document: gql(resetPasswordMutation(token, uid, newPassword))));
    if (result.hasException) {
      final linkEx = result.exception!.linkException;
      final graphQlErrors = result.exception!.graphqlErrors;
      if (linkEx is NetworkException) {
        throw appEx.NoInternetException(errorMessage: linkEx.message);
      }
      if (linkEx is ServerException) {
        for (var e in graphQlErrors) {
          throw appEx.ServerException(errorMessage: e.message);
        }
      }
    }
    return result.data.toString();
  }
}
