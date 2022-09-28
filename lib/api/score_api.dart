import '../config/token.dart';
import 'api_url.dart';
import 'my_network_manager.dart';

class ScoreApi {
  Future<bool> postScore(String score) async {
    const url = AppUrl.postUserScore;
    var token = await Token.getTokens();
    try {
      final extractedData = await MyNetworkManager.postData(url, {
        "score": score
      }, {
        'Authorization': 'Bearer $token',
      });
      if (extractedData != null) {
        return extractedData['success'];
      }
      return extractedData!['success'];
    } catch (error) {
      rethrow;
    }
  }

  Future<List<dynamic>> getTopScore() async {
    final extractedData =
        await MyNetworkManager.getDataList(AppUrl.getTopScore);
    return extractedData;
  }
}
