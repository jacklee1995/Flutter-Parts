import 'package:get/get.dart';

import '../modules/border/border_view.dart';
import '../modules/buttons/base_button_view.dart';
import '../modules/index/index_view.dart';
import '../modules/kingkong/KingkongView.dart';
import '../modules/label/label_view.dart';

class AppRoutes {
  static final routes = [
    // 主视图
    GetPage(
      name: IndexView.url,
      page: () => const IndexView(),
    ),
    // 边框
    GetPage(
      name: BorderView.url,
      page: () => const BorderView(),
    ),
    // 金刚区
    GetPage(
      name: KingkongView.url,
      page: () => const KingkongView(),
    ),
    // 标签
    GetPage(
      name: BaseButtonView.url,
      page: () => const BaseButtonView(),
    ),
    // 标签
    GetPage(
      name: LabelView.url,
      page: () => const LabelView(),
    ),
  ];
}
