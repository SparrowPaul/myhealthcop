import 'package:graphql/client.dart';
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
    final result = await _client.mutate(MutationOptions(document: gql(loginMutation(email, password, userType))));
    if (result.hasException) {
      if (result.exception!.linkException is NetworkException) {
        // handle network issues
      }
    }
    return UserModel.fromJson(result.data);
  }
  
  @override
  Future<User> register(String email, String password, String userType) async {
    final result = await _client.mutate(MutationOptions(document: gql(registrationMutation(email, password, userType))));
    if (result.hasException) {
      if (result.exception!.linkException is NetworkException) {
        // handle network issues
      }
    }
    return UserModel.fromJson(result.data);
  }
  
  @override
  Future<String> forgotPassword(String email) async {
    final result = await _client.mutate(MutationOptions(document: gql(forgotPasswordMutation(email))));
    return result.data.toString();
  }
  
  @override
  Future<String> resetPassword(String token, String uid, String newPassword) async {
    final result = await _client.mutate(MutationOptions(document: gql(resetPasswordMutation(token, uid, newPassword))));
    return result.data.toString();
  }
}
