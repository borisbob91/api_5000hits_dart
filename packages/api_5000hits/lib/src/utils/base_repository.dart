
import 'package:api_5000hits/src/utils/api_client.dart';

class BaseRepository{
  final ApiClient apiClient = ApiClient();
  String route = "";
  dynamic data = {};
  BaseRepository();
}
