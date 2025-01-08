import 'package:html/parser.dart' show parse;
import 'package:logger/logger.dart';
final logger = Logger();

String formatLyrics(String? encodedLyrics) {
  if (encodedLyrics == null || encodedLyrics.isEmpty) {
      return '';
    }
  logger.i("lyric text formatting......");

  try{
  // Décoder le texte encodé
  final decodedLyrics = Uri.decodeComponent(encodedLyrics);

  // Analyser le HTML
  final document = parse(decodedLyrics);

  // Extraire le texte des balises <p>
  final paragraphs = document.querySelectorAll('p').map((p) => p.text).toList();

  // Formater le texte
  final formattedLyrics = paragraphs.join('\n\n');
  logger.i('lyric text formatted done !');
  return formattedLyrics;

  }
  catch(e){
    logger.e("error while formatting lyrics: $e");
  }
  return '';
}


extension FormatLyricsExtension on String {
  static String formatLyrics(String? encodedLyrics) {
    if (encodedLyrics == null || encodedLyrics.isEmpty) {
      return '';
    }

    return formatLyrics(encodedLyrics);
  }
}
