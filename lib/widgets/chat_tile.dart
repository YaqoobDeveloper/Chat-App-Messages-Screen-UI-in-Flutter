import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../data/dummy_data.dart';

class ChatTile extends StatefulWidget {
  const ChatTile({
    super.key,
    required this.chat,
    required this.index,
    required this.isOpen,
    required this.onOpenChanged,
    required this.onDelete,
  });

  final Chat chat;
  final int index;
  final bool isOpen;
  final ValueChanged<bool> onOpenChanged;
  final VoidCallback onDelete;

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile>
    with SingleTickerProviderStateMixin {
  static const _revealWidth = 130.0;

  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
    value: widget.isOpen ? 1 : 0,
  );

  @override
  void didUpdateWidget(ChatTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen != oldWidget.isOpen) _animate(widget.isOpen);
  }

  void _animate(bool open) => open
      ? _controller.animateTo(1, curve: Curves.easeOutCubic)
      : _controller.animateTo(0, curve: Curves.easeOutCubic);

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    final open =
        velocity < -300 || (velocity <= 300 && _controller.value > 0.5);
    _animate(open);
    if (open != widget.isOpen) widget.onOpenChanged(open);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + widget.index * 90),
      curve: Curves.easeOutCubic,
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: Transform.translate(
          offset: Offset(0, 30 * (1 - t)),
          child: child,
        ),
      ),
      child: GestureDetector(
        onHorizontalDragUpdate: (d) =>
            _controller.value -= d.primaryDelta! / _revealWidth,
        onHorizontalDragEnd: _onDragEnd,
        onTap: widget.isOpen ? () => widget.onOpenChanged(false) : null,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Stack(
            alignment: Alignment.centerRight,
            children: [
              Positioned(
                right: 24,
                child: Opacity(
                  opacity: _controller.value,
                  child: Transform.scale(
                    scale: 0.6 + 0.4 * _controller.value,
                    child: Row(
                      children: [
                        _ActionButton(
                          icon: Icons.more_horiz_rounded,
                          color: AppColors.actionBg,
                          iconColor: AppColors.primary,
                          onTap: () => widget.onOpenChanged(false),
                        ),
                        const SizedBox(width: 12),
                        _ActionButton(
                          icon: Icons.delete_rounded,
                          color: AppColors.accent,
                          iconColor: Colors.white,
                          onTap: widget.onDelete,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(-105 * _controller.value, 0),
                child: child,
              ),
            ],
          ),
          child: _ChatContent(chat: widget.chat, controller: _controller),
        ),
      ),
    );
  }
}

class _ChatContent extends StatelessWidget {
  const _ChatContent({required this.chat, required this.controller});

  final Chat chat;
  final Animation<double> controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.fromLTRB(28, 14, 28, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeTransition(
            opacity: ReverseAnimation(controller),
            child: _Avatar(chat: chat),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        chat.name,
                        style: const TextStyle(
                          color: AppColors.title,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      chat.time,
                      style: const TextStyle(
                        color: AppColors.subtitle,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  chat.message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.subtitle,
                    fontSize: 15,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 27,
          backgroundColor: AppColors.actionBg,
          backgroundImage: NetworkImage(chat.avatar),
        ),
        if (chat.unread > 0)
          Positioned(
            top: -2,
            left: -4,
            child: Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: chat.muted ? AppColors.muted : AppColors.accent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Text(
                '${chat.unread}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, color: iconColor, size: 22),
      ),
    );
  }
}
