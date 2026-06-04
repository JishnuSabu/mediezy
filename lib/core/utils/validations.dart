
  String? validateMobile(String mobile) {
    if (mobile.isEmpty) return "Mobile number is required";
    if (mobile.length < 10) return "Enter valid mobile number";
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) return "Password is required";
    if (password.length < 6) return "Password must be at least 6 characters";
    return null;
  }
  String? validateName(String value) {
  if (value.isEmpty) return "Name is required";
  if (value.length <2) return "Minimum 2 characters required";
  return null;
}

String? validateEmail(String value) {
  if (value.isEmpty) return "Email is required";

  final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$");
  if (!emailRegex.hasMatch(value)) return "Enter valid email";

  return null;
}

String? validateAddress(String value) {
  if (value.isEmpty) return "Address is required";
  return null;
}

String? validateDate(String value, String label) {
  if (value.isEmpty) return "$label is required";
  return null;
}