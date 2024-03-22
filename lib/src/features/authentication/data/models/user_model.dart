import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.uid,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.userType,
    required super.country,
    required super.phoneNumber,
    required super.accessToken,
    required super.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    print(json);
    return UserModel(
      uid: json?['uid'],
      email: json?['email'],
      firstName: json?['firstName'],
      lastName: json?['lastName'],
      userType: json?['group'],
      country: json?['country'],
      phoneNumber: json?['phoneNumber'],
      accessToken: json?['accessToken'],
      refreshToken: json?['refreshToken'],
    );
  }
}
