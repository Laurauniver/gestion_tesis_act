import 'package:diacritic/diacritic.dart';

String cleanPlainText(String text) => removeDiacritics(text.toLowerCase());
