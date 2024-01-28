class User {
  final String firstName;
  final String lastName;
  final String email;
  final String jwtToken;

  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.jwtToken});
}
