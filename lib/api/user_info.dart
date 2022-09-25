import 'api_url.dart';
import 'my_network_manager.dart';

class UserInfoApi {
  Future<Map> fetchAndSetUserInfo() async {
    final extractedData = await MyNetworkManager.getData(AppUrl.getUserInfo);
    final userInfo = {};
    //UserInfo.fromJson(extractedData);
    return userInfo;
  }
}
