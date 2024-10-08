library api_5000hits;

import 'package:api_5000hits/album.dart';
import 'package:api_5000hits/artist.dart';
import 'package:api_5000hits/auth.dart';
import 'package:api_5000hits/music.dart';
import 'package:api_5000hits/src/exceptions/auth_error.dart';
import 'package:api_5000hits/src/exceptions/error_types.dart';
import 'package:api_5000hits/src/mixins/mixins.dart';

import 'lyric.dart';
import 'src/utils/api_client.dart';
import 'video.dart';

export 'package:api_5000hits/src/features/album/mp3_album.dart' show Mp3Album;
export 'package:api_5000hits/src/features/music/mp3_music.dart' show Mp3Music;
export 'package:api_5000hits/src/features/album/pagiination_results.dart';
part 'api_5000hits_base.dart';


