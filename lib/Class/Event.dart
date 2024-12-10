class Event {
  // Propriedades privadas
  String _title;
  String _description;
  String _date;
  String? _id;

  // Construtor
  Event({
    required String title,
    required String description,
    required String date,
    String? id,
  })  : _title = title,
        _description = description,
        _date = date,
        _id = id;

  // Getter e Setter para 'title'
  String get title => _title;
  set title(String value) {
    if (value.isEmpty) {
      throw ArgumentError("O título não pode ser vazio.");
    }
    _title = value;
  }

  // Getter e Setter para 'description'
  String get description => _description;
  set description(String value) {
    if (value.isEmpty) {
      throw ArgumentError("A descrição não pode ser vazia.");
    }
    _description = value;
  }

  // Getter e Setter para 'date'
  String get date => _date;
  set date(String value) {
    if (!_isValidDate(value)) {
      throw ArgumentError("A data deve estar no formato válido (YYYY-MM-DD).");
    }
    _date = value;
  }

  // Getter e Setter para 'id'
  String? get id => _id;
  set id(String? value) {
    _id = value; // ID é opcional, então não há validação específica
  }

  // Método auxiliar para validar a data
  bool _isValidDate(String value) {
    final RegExp dateRegex = RegExp(r"^\d{4}-\d{2}-\d{2}$");
    return dateRegex.hasMatch(value);
  }
}
