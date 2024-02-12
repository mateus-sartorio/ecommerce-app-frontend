class User {
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String jwtToken;

  User(
      {required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.jwtToken});

  @override
  String toString() {
    return "username: $username, email: $email, firstName: $firstName, lastName: $lastName, jwtToken: $jwtToken";
  }
}
