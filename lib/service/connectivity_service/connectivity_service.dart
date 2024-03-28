import 'package:connectivity/connectivity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_service.g.dart';

class ConnectivityService {
  Future<ConnectivityResult> checkConnectivity() async {
    final connectivity = Connectivity();
    return connectivity.checkConnectivity();
  }

  Stream<ConnectivityResult> get onConnectivityChanged {
    final connectivity = Connectivity();
    return connectivity.onConnectivityChanged;
  }
}

@riverpod
FutureOr<ConnectivityResult> connectivity(ConnectivityRef ref) {
  return ConnectivityService().checkConnectivity();
}
