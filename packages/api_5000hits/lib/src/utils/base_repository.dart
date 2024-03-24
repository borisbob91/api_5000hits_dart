import 'api_client.dart';

class BaseRepository{
  final ApiClient apiClient = ApiClient();
  String route = "";
  dynamic data = {};
  BaseRepository();
}
