import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'category_tabs.dart';
import 'story_list.dart';

class ChatHeaderDelegate extends SliverPersistentHeaderDelegate {
  ChatHeaderDelegate({required this.topPadding});

  final double topPadding;

  static const _toolbarHeight = 60.0;
  static const _tabsHeight = 64.0;
  static const _cardLip = 28.0;
  static const _expandedContent = 204.0;

  @override
  double get minExtent => topPadding + _toolbarHeight + _tabsHeight + _cardLip;

  @override
  double get maxExtent =>
      topPadding + _expandedContent + _tabsHeight + _cardLip;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final t = 1 - (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    final expandedOpacity = const Interval(0.4, 1).transform(t);
    final collapsedOpacity = (1 - t / 0.3).clamp(0.0, 1.0);

    return ColoredBox(
      color: AppColors.primary,
      child: Stack(
        children: [
          Positioned(
            top: topPadding + 20,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: expandedOpacity,
              child: Transform.translate(
                offset: Offset(0, -24 * (1 - t)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28),
                      child: Text(
                        'Chat with\nfriends',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),
                    ),
                    SizedBox(height: 28),
                    StoryList(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: topPadding,
            left: 28,
            right: 16,
            height: _toolbarHeight,
            child: IgnorePointer(
              ignoring: collapsedOpacity == 0,
              child: Opacity(
                opacity: collapsedOpacity,
                child: Row(
                  children: [
                    const Text(
                      'Chat with friends',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                const SizedBox(
                  height: _tabsHeight,
                  child: Center(child: CategoryTabs()),
                ),
                Container(
                  height: _cardLip,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(ChatHeaderDelegate oldDelegate) =>
      oldDelegate.topPadding != topPadding;
}
