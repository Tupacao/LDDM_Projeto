import 'package:flutter/services.dart';

class DateTextInputFormatter extends TextInputFormatter {
  final RegExp _dateRegExp = RegExp(
      r'^(19|20)\d\d-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])T([01][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])\.(\d{3})\+00:00$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Verifica se a data inserida já está no formato correto
    if (_dateRegExp.hasMatch(newText)) {
      return newValue;
    }

    // Caso contrário, formata a entrada como uma string de data
    newText = _formatDateString(newText);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  String _formatDateString(String text) {
    String formattedText = text.replaceAll(
        RegExp(r'[^0-9]'), ''); // Remove qualquer caractere não numérico

    if (formattedText.length >= 8) {
      // Exemplo de formatação de data no formato desejado
      formattedText =
          '${formattedText.substring(0, 4)}-${formattedText.substring(4, 6)}-${formattedText.substring(6, 8)}T00:00:00.000+00:00';
    }

    return formattedText;
  }
}
