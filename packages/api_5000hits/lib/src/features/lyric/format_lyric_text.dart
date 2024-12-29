import 'package:html/parser.dart' show parse;

String formatLyrics(String? encodedLyrics) {
  if (encodedLyrics == null || encodedLyrics.isEmpty) {
      return '';
    }
  print("lyric text formatting......");
  // Décoder le texte encodé
  final decodedLyrics = Uri.decodeComponent(encodedLyrics);

  // Analyser le HTML
  final document = parse(decodedLyrics);

  // Extraire le texte des balises <p>
  final paragraphs = document.querySelectorAll('p').map((p) => p.text).toList();

  // Formater le texte
  final formattedLyrics = paragraphs.join('\n\n');

  return formattedLyrics;
}


extension FormatLyricsExtension on String {
  static String formatLyrics(String? encodedLyrics) {
    if (encodedLyrics == null || encodedLyrics.isEmpty) {
      return '';
    }

    return formatLyrics(encodedLyrics);
  }
}
