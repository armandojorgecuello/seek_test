part of 'services.dart';

class InternetConnectionService {
  InternetConnectionService();

  Future<bool> fetchInternet() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }else{
      return false;
    }
  }
}
