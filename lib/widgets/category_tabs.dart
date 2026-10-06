import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  static const _tabs = ['Messages', 'Calls', 'Groups'];
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        children: [
          for (var i = 0; i < _tabs.length; i++)
            GestureDetector(
              onTap: () => setState(() => _selected = i),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.only(right: 28),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: _selected == i ? 5 : 0,
                      height: 5,
                      margin: EdgeInsets.only(right: _selected == i ? 8 : 0),
                      decoration: const BoxDecoration(
                        color: AppColors.accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 250),
                      style: TextStyle(
                        fontFamily: DefaultTextStyle.of(context)
                            .style
                            .fontFamily,
                        fontSize: 17,
                        color: _selected == i ? Colors.white : Colors.white54,
                        fontWeight: _selected == i
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                      child: Text(_tabs[i]),
                    ),
                  ],
                ),
              ),
            ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'CREATE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
