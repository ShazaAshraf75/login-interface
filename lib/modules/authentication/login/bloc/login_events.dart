abstract class LoginEvents {}

class UserLoggedInEvent extends LoginEvents {
  final String username;
  final String password;

  UserLoggedInEvent({required this.username, required this.password});
}

class PasswordVisibilityChangedEvent extends LoginEvents {}

class CheckboxValueChangedEvent extends LoginEvents {
  final dynamic value;
  CheckboxValueChangedEvent({
    required this.value,
  });
}
