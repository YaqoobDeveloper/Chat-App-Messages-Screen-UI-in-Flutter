import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/dummy_data.dart';
import '../widgets/chat_header.dart';
import '../widgets/chat_tile.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _chats = [...chats];
  int? _openIndex = 1;

  void _delete(int index) {
    setState(() {
      _chats.removeAt(index);
      _openIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverPersistentHeader(
                pinned: true,
                delegate: ChatHeaderDelegate(
                  topPadding: MediaQuery.paddingOf(context).top,
                ),
              ),
            ),
          ],
          body: ColoredBox(
            color: Colors.white,
            child: Builder(
              builder: (context) => CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                      bottom: 24 + MediaQuery.paddingOf(context).bottom,
                    ),
                    sliver: SliverList.builder(
                      itemCount: _chats.length,
                      itemBuilder: (context, index) => ChatTile(
                        key: ValueKey(_chats[index].name),
                        chat: _chats[index],
                        index: index,
                        isOpen: _openIndex == index,
                        onOpenChanged: (open) =>
                            setState(() => _openIndex = open ? index : null),
                        onDelete: () => _delete(index),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
