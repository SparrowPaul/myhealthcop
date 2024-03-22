import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final String userType;
  final String? country;
  final String? phoneNumber;
  final String? gender;
  final String? accessToken;
  final String? refreshToken;

  const User({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.country,
    required this.phoneNumber,
    required this.accessToken, 
    required this.refreshToken,
    this.gender,
  });

  String get getFullName => '$firstName ' '$lastName'; 
  String get getFullNameInitials => getFullName.trim().isNotEmpty ? '${firstName[0]}' '${lastName[0]}' : ' '; 


  @override
  List<Object?> get props => [
        uid,
        email,
        firstName,
        lastName,
        userType,
        country,
        phoneNumber,
        gender,
      ];
}
