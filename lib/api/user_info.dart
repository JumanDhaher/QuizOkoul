import 'api_url.dart';
import 'my_network_manager.dart';

class UserInfoApi {
  Future<Map<String, dynamic>?> fetchAndSetUserInfo() async {
    final extractedData = await MyNetworkManager.getData(AppUrl.getUserInfo);
    print(extractedData);
    return extractedData;
  }
}
