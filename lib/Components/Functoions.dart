String convertToDateFormat(String oldDate) {
  // Expressão regular para extrair a data no formato yyyy-MM-dd
  final RegExp regExp = RegExp(r'(\d{4})-(\d{2})-(\d{2})');

  // Tenta encontrar a data no formato esperado
  final match = regExp.firstMatch(oldDate);

  if (match != null) {
    // Extraímos o ano, mês e dia da data
    String year = match.group(1)!;
    String month = match.group(2)!;
    String day = match.group(3)!;

    // Retorna a data no formato dd/MM/yyyy
    return '$day/$month/$year';
  } else {
    // Se a data não estiver no formato esperado, retorna uma string vazia
    return 'Data inválida';
  }
}
