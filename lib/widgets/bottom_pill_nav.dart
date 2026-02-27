import 'package:flutter/material.dart';

class BottomPillNav extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;

  const BottomPillNav({
    super.key,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xFFF6C200),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Item(
            selected: index == 0,
            icon: Icons.home_rounded,
            onTap: () => onChanged(0),
          ),
          _Item(
            selected: index == 1,
            icon: Icons.folder_rounded,
            onTap: () => onChanged(1),
          ),
          _Item(
            selected: index == 2,
            icon: Icons.group_rounded,
            onTap: () => onChanged(2),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final VoidCallback onTap;

  const _Item({
    required this.selected,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: selected ? Colors.white : Colors.black),
      ),
    );
  }
}
