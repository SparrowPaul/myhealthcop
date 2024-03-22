
class CustomValidator {
  static String? validateTextField(String? value) {
    return value!.isEmpty ? 'This field is required' : null;

  }
}
