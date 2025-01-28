import 'package:html/parser.dart' show parse;
import 'package:logger/logger.dart';
final logger = Logger();

String nettoyerTexte(String texteAvecBalises) {
  try{
    
  final document = parse(texteAvecBalises);
  
  final texteNettoye = document.body?.text ?? '';
  return texteNettoye.trim(); 

  }catch(_){
    logger.e(_);
    throw new Exception('Failed to clean lyric text');
  }

}

