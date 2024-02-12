class RegistrationRequestDTO {
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String password;

  RegistrationRequestDTO(
      {required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.password});
}
