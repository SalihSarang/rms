import 'package:flutter/material.dart';

class StaffTable extends StatelessWidget {
  const StaffTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          const Divider(color: Colors.white12),
          _buildRow(),
          const SizedBox(height: 16),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: const [
        _HeaderText('Name', flex: 2),
        _HeaderText('Role'),
        _HeaderText('Email Address', flex: 2),
        _HeaderText('Status'),
        _HeaderText('Last Active'),
        _HeaderText('Actions'),
      ],
    );
  }

  Widget _buildRow() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.blueGrey.shade700,
                child: const Text("AL", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 12),
              const Text("Alex Johnson", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        _roleChip("Manager"),
        const Expanded(
          flex: 2,
          child: Text(
            "alex.j@restomgr.com",
            style: TextStyle(color: Colors.white70),
          ),
        ),
        Switch(value: true, onChanged: (_) {}),
        Row(
          children: const [
            Icon(Icons.access_time, size: 16, color: Colors.white54),
            SizedBox(width: 6),
            Text("2h ago", style: TextStyle(color: Colors.white54)),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.edit, color: Colors.white54),
            SizedBox(width: 12),
            Icon(Icons.delete_outline, color: Colors.white54),
          ],
        ),
      ],
    );
  }

  Widget _roleChip(String role) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(role, style: const TextStyle(color: Colors.blue)),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Showing 1 to 1 of 1 results",
          style: TextStyle(color: Colors.white54),
        ),
        Row(
          children: [
            _pageButton("Previous"),
            _pageButton("1", active: true),
            _pageButton("2"),
            _pageButton("Next"),
          ],
        ),
      ],
    );
  }

  Widget _pageButton(String text, {bool active = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: active ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(
        text,
        style: TextStyle(color: active ? Colors.white : Colors.white70),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  final String text;
  final int flex;
  const _HeaderText(this.text, {this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white54,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
