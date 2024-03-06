import 'package:flutter/material.dart';

import 'package:get/get.dart';

class IndexView extends StatefulWidget {
  static const String url = '/index';
  const IndexView({super.key});

  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('index'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('边框'),
              onTap: () => Get.toNamed('/border'),
            ),
            ListTile(
              title: const Text('King Kong（金刚区）'),
              onTap: () => Get.toNamed('/king-kong'),
            ),
            ListTile(
              title: const Text('基本按钮'),
              onTap: () => Get.toNamed('/base-button'),
            ),
            ListTile(
              title: const Text('标签'),
              onTap: () => Get.toNamed('/label'),
            ),
            ListTile(
              title: const Text('回顶部包装器'),
              onTap: () => Get.toNamed('/totop-scroll-view'),
            ),
          ],
        ),
      ),
    );
  }
}
