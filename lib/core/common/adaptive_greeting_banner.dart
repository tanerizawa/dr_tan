import 'package:flutter/material.dart';
import '../../features/chat/greeting/greeting_service.dart';
import '../ai/ai_service.dart';

class AdaptiveGreetingBanner extends StatefulWidget {
  final String pageName;
  const AdaptiveGreetingBanner({super.key, required this.pageName});

  @override
  State<AdaptiveGreetingBanner> createState() => _AdaptiveGreetingBannerState();
}

class _AdaptiveGreetingBannerState extends State<AdaptiveGreetingBanner> {
  late Future<String> _futureInsight;

  @override
  void initState() {
    super.initState();
    final greeting = GreetingService.getGreeting();
    final prompt =
        '$greeting Saya sedang di tab ${widget.pageName}. Berikan refleksi singkat.';
    _futureInsight = AiService().getInsight(prompt);
  }

  @override
  Widget build(BuildContext context) {
    final greeting = GreetingService.getGreeting();
    return FutureBuilder<String>(
      future: _futureInsight,
      builder: (context, snapshot) {
        final aiText = snapshot.data;
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.secondaryContainer,
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(greeting, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              if (snapshot.connectionState == ConnectionState.waiting)
                const LinearProgressIndicator()
              else if (aiText != null)
                Text(aiText)
              else
                const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
