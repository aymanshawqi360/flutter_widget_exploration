import 'package:flutter_widget_exploration/features/mini_app_widget/model/anime_info.dart';

class AnimeCard extends AnimeInfo {
  AnimeCard({
    required super.title,
    required super.description,
    required super.tags,
  });

  static List<AnimeCard> questions = [
    AnimeCard(
      title: "Attack on Titan",
      description:
          "In a world where humanity is on the brink of extinction due to giant creatures, a group of soldiers fights back to uncover the truth.",
      tags: ["Action", "Drama", "Wit Studio"],
    ),
    AnimeCard(
      title: "Death Note",
      description:
          "A high school student gains a notebook that allows him to kill anyone by writing their name, leading to a moral and psychological battle.",
      tags: ["Thriller", "Supernatural", "Psychological"],
    ),
    AnimeCard(
      title: "My Hero Academia",
      description:
          "In a world where superpowers (quirks) are common, a powerless boy dreams of becoming a hero.",
      tags: ["Shonen", "Superhero", "Bones Studio"],
    ),
    AnimeCard(
      title: "Demon Slayer",
      description:
          "After his family is slaughtered by demons, a young boy joins the Demon Slayer Corps to avenge them and save his sister.",
      tags: ["Action", "Fantasy", "Ufotable"],
    ),
    AnimeCard(
      title: "Jujutsu Kaisen",
      description:
          "A high school student joins a secret organization to fight curses using powerful sorcery.",
      tags: ["Dark Fantasy", "Supernatural", "MAPPA"],
    ),
  ];
}
