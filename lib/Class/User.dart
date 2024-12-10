class User {
  // Propriedades privadas (com _ para indicar privacidade)
  String _name;
  String _email;
  String _type;
  String _token;
  String _password;

  // Construtor
  User({
    required String name,
    required String email,
    required String type,
    required String token,
    required String password,
  })  : _name = name,
        _email = email,
        _type = type,
        _token = token,
        _password = password;

  // Getter e Setter para 'name'
  String get name => _name;
  set name(String value) {
    if (value.isEmpty) {
      throw ArgumentError("O nome não pode ser vazio.");
    }
    _name = value;
  }

  // Getter e Setter para 'email'
  String get email => _email;
  set email(String value) {
    if (!value.contains('@')) {
      throw ArgumentError("O email deve ser válido.");
    }
    _email = value;
  }

  // Getter e Setter para 'type'
  String get type => _type;
  set type(String value) {
    if (value.isEmpty) {
      throw ArgumentError("O tipo não pode ser vazio.");
    }
    _type = value;
  }

  // Getter e Setter para 'token'
  String get token => _token;
  set token(String value) {
    if (value.isEmpty) {
      throw ArgumentError("O token não pode ser vazio.");
    }
    _token = value;
  }

  // Getter e Setter para 'password'
  String get password => _password;
  set password(String value) {
    if (value.length < 6) {
      throw ArgumentError("A senha deve ter pelo menos 6 caracteres.");
    }
    _password = value;
  }
}
