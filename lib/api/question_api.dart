import 'api_url.dart';
import 'my_network_manager.dart';

class ScoreApi {
  Future<Map> getQuestions() async {
    final extractedData = await MyNetworkManager.getData(AppUrl.getQusetions);
    final getQusetions = {};
    // UserScore.fromJson(extractedData);
    return getQusetions;
  }
}
