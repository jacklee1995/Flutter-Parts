import 'package:flutter/material.dart';
import 'package:flutter_parts/flutter_parts.dart';

import 'widgets/linked_article_tile.dart';

class ScrollBlogView extends StatelessWidget {
  static const String url = '/totop-scroll-view';
  const ScrollBlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TotopScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Body(),
          ),
        ],
      ),
    );
  }
}

class ArticleData {
  final String title;
  final String brief;
  final String authorID;
  final String articleID;

  ArticleData({
    required this.title,
    required this.brief,
    required this.authorID,
    required this.articleID,
  });
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ArticleData> items = [
      ArticleData(
        title: '标题',
        brief:
            'wergv ipsum drewgfr sit amreget, etbh erg arewg, r5g do aertg srtbnh wrgf ut tb et etb etrg aeb.',
        authorID: 'user_83256f34',
        articleID: 'id6516',
      ),
    ];
    List<ArticleData> repeatedItems = [];
    for (int i = 0; i < 100; i++) {
      repeatedItems.addAll(items);
    }
    return Column(
      children: repeatedItems.map((data) {
        return Column(
          children: [
            LinkedArticleTile(
              onTap: () {},
              title: data.title,
              brief: data.brief,
              authorID: data.authorID,
              articleID: data.articleID,
            ),
            const Divider(thickness: 2),
          ],
        );
      }).toList(),
    );
  }
}
