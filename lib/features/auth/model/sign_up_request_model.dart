class SignUpRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String address;
  final String dob;
  final String mobileNumber;
  final String doj;
  final String location;

  SignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.address,
    required this.dob,
    required this.mobileNumber,
    required this.doj,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "address": address,
      "dob": dob,
      "mobile_number": mobileNumber,
      "doj": doj,
      "location": location,
    };
  }
}