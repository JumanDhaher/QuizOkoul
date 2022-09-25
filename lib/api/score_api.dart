import 'api_url.dart';
import 'my_network_manager.dart';

class ScoreApi {
  Future<bool> postScore(String score) async {
    const url = AppUrl.postUserScore;
    try {
      final extractedData =
          await MyNetworkManager.postData(url, {"score": score});
      if (extractedData != null) {
        if (extractedData['success']) {}
      }
      return extractedData!['success'];
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<Map> getTopScore() async {
    final extractedData = await MyNetworkManager.getData(AppUrl.getTopScore);
    final getTopScore = {};
    // UserScore.fromJson(extractedData);
    return getTopScore;
  }
}
