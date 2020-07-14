import 'common/global.dart';

void main() async {
  try {
    await Global.init();
    print('成功');
  } catch (e) {
    print('失败');
  }
}
