import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sfss/config/server_config.dart';
import 'package:sfss/data/user_data.dart';


class ServerApi {
  static Future<Map<String, dynamic>> getProfile(int uid) async {
  final url = Uri.parse(ServerConfig.url + '/api/profile/'+uid.toString());
    final response = await http.get(url, headers: {'token': UserData.token});
    if (response.statusCode == 200) {
      final res = jsonDecode(utf8.decode(response.bodyBytes));
      return res['data']??{};
    } else {
      throw Exception('Failed to load data');
    }
  }
}