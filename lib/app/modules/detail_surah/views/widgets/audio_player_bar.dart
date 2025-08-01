import 'package:flutter/material.dart';
import 'package:quran_apps/app/constants/app_colors.dart';

class AudioPlayerBar extends StatelessWidget {
  final String title;
  final String artist;
  final String current;
  final String total;
  final Widget progressDisplay;
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
    required this.progressDisplay,
  });

  @override
  Widget build(BuildContext context) {
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
              Text(current, style: const TextStyle(fontSize: 12)),
              const SizedBox(width: 8),
              Expanded(child: progressDisplay),
              const SizedBox(width: 8),
              Text(total, style: const TextStyle(fontSize: 12)),
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
}
