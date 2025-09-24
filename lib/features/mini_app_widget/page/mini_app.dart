import 'package:flutter/material.dart';
import 'package:flutter_widget_exploration/features/mini_app_widget/model/anime_card.dart';

class MiniApp extends StatelessWidget {
  const MiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: AnimeCard.questions.length,
        itemBuilder: (context, index) {
          final item = AnimeCard.questions[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              backgroundColor: Colors.amber,
              collapsedBackgroundColor: Colors.blue,
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              title: Text(item.title),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item.description),
                ),
                Wrap(
                  spacing: 6,
                  children: item.tags.map((tag) {
                    return Tooltip(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      message: 'Tag: $tag',
                      child: Chip(
                        color: WidgetStateProperty.all(Colors.white),
                        label: Text(tag, style: TextStyle(color: Colors.black)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
