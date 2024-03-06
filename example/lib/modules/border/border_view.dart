import 'package:flutter/material.dart';
import 'package:flutter_parts/flutter_parts.dart';

import '../../widgets/box_container.dart';

class BorderView extends StatefulWidget {
  static const String url = '/border';
  const BorderView({super.key});

  @override
  State<BorderView> createState() => _BorderViewState();
}

class _BorderViewState extends State<BorderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('index'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const BorderBox(
                borderStyle: CustomBorderStyle.solid,
                borderWidth: 1.0,
                borderRadiusSize: BorderRadiusSize.small,
                boxShadowStyle: BoxShadowStyle.basic,
                child: BoxContainer(
                  child: Text('基本用法'),
                ),
              ),
              const BorderBox(
                borderStyle: CustomBorderStyle.dashed,
                borderWidth: 2.0,
                borderRadiusSize: BorderRadiusSize.large,
                boxShadowStyle: BoxShadowStyle.light,
                child: BoxContainer(
                  child: Text('虚线边框'),
                ),
              ),
              const BorderBox(
                borderStyle: CustomBorderStyle.solid,
                borderWidth: 1.0,
                borderRadiusSize: BorderRadiusSize.round,
                boxShadowStyle: BoxShadowStyle.dark,
                child: BoxContainer(
                  child: Text('圆角和阴影'),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: const BorderBox(
                  borderStyle: CustomBorderStyle.solid,
                  borderWidth: 1.0,
                  borderRadiusSize: BorderRadiusSize.small,
                  boxShadowStyle: BoxShadowStyle.lighter,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('按钮'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
