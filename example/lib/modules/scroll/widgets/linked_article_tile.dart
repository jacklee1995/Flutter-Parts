import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';

import 'easy_img.dart';
import 'inkwell_overlay.dart';

class LinkedArticleTile extends StatelessWidget {
  final String author;
  final String avatarUrl;
  final String authorID;
  final String title;
  final String brief;
  final String articleID;
  final VoidCallback? onTap;

  const LinkedArticleTile({
    super.key,
    this.author = 'Guest User',
    required this.authorID,
    this.avatarUrl = 'assets/images/picture.png',
    required this.title,
    required this.brief,
    required this.articleID,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellOverlay(
      onTap: () {
        onTap!();
      },
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: ListTile(
        trailing: Img(avatarUrl),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 25,
              height: 25,
              child: CircleAvatar(),
            ),
            const Gap(9),
            // 用户名
            Text(
              author,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(9),
            // 标题
            Text(
              title,
              maxLines: 3,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            const Gap(9),
            // 描述文本
            Text(
              brief,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
