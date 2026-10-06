import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class StoryList extends StatelessWidget {
  const StoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 28),
        itemCount: stories.length + 1,
        separatorBuilder: (_, _) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 28,
              ),
            );
          }
          return Container(
            width: 60,
            padding: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: index == 1
                  ? Border.all(color: Colors.white, width: 2)
                  : null,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white24,
              backgroundImage: NetworkImage(stories[index - 1]),
            ),
          );
        },
      ),
    );
  }
}
