abstract class LoginEvents {}

class UserLoggedInEvent extends LoginEvents {
  final String username;
  final String password;

  UserLoggedInEvent({required this.username, required this.password});
}

class CheckboxValueChangedEvent extends LoginEvents {
  final bool value;
  CheckboxValueChangedEvent({
    required this.value,
  });
}

class UsernameValidatedEvent extends LoginEvents {
  final String username;

  UsernameValidatedEvent({required this.username});
}

class PasswordValidatedEvent extends LoginEvents {
  final String password;

  PasswordValidatedEvent({required this.password});
}
