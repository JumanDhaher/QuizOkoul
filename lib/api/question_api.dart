import 'api_url.dart';
import 'my_network_manager.dart';

class QuestionApi {
  Future<List<dynamic>> getQuestions() async {
    final extractedData =
        await MyNetworkManager.getDataList(AppUrl.getQusetions);
    // final getQusetions = {};
    // UserScore.fromJson(extractedData);
    return extractedData;
  }
}
