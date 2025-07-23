import 'package:flutter/material.dart';
import 'package:quran_apps/app/theme/app_colors.dart';

class AudioPlayerBar extends StatelessWidget {
  final String title;
  final String artist;
  final Duration current;
  final Duration total;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final bool isPlaying;

  const AudioPlayerBar({
    super.key,
    required this.title,
    required this.artist,
    required this.current,
    required this.total,
    required this.onPlayPause,
    required this.onNext,
    required this.onPrevious,
    this.isPlaying = false,
  });

  @override
  Widget build(BuildContext context) {
    final progressPercent = total.inMilliseconds == 0
        ? 0.0
        : current.inMilliseconds / total.inMilliseconds;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title & Artist
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A202C),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  artist,
                  style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          // Progress Slider
          Row(
            children: [
              Text(
                _formatDuration(current),
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Slider(
                  value: progressPercent.clamp(0.0, 1.0),
                  onChanged: (_) {}, // Optional: handle seek
                  activeColor: const Color(0xFF2F855A),
                  inactiveColor: Colors.grey.shade300,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _formatDuration(total),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          // Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.fast_rewind),
                color: Colors.blueGrey,
                onPressed: onPrevious,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  color: Colors.white,
                  onPressed: onPlayPause,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.fast_forward),
                color: Colors.blueGrey,
                onPressed: onNext,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes)}:${twoDigits(d.inSeconds.remainder(60))}";
  }
}
