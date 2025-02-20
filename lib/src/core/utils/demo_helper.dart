import '../../di.dart';

class DemoHelper {
  // factory DemoHelper(Ref ref) {
  //   _instance.ref = ref;
  //   return _instance;
  // }

  // DemoHelper._();

  // static final _instance = DemoHelper._();

  final bool _artificialDelay = false;

  Future<void> artificialDelay([int ms = 2000]) async {
    if (_artificialDelay) {
      await Future.delayed(Duration(milliseconds: ms));
    }
  }

  void resetLocal() {
    di.local.createAll([]);
  }
}
