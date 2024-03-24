import 'package:flutter/material.dart';
import 'package:myhealthcop/src/core/constants/size_consts.dart';
import 'package:myhealthcop/src/features/authentication/presentation/widgets/change_password_form.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context, true),
        ),
        title: const Text(
          "Reset Password",
          style: TextStyle(
            fontSize: Sizes.dimen_20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
                Icons.close), // Replace 'Icons.settings' with your desired icon
            onPressed: () {
              // Add your onPressed functionality here
            },
          ),
        ],
      ),
      body: ChangePasswordForm(),
    );
  }
}
