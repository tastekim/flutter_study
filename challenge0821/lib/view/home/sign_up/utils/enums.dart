enum ItemType {
  music(list: [
    "Art",
    "Popular",
    "Country",
    "Electronic",
    "Hip hop",
    "Jazz",
    "Latin",
    "Pop",
    "Punk",
    "Reggae",
    "Rock",
    "Metal",
    "Soul",
    "R&B",
    "Polka",
    "Religious",
    "Traditional",
    "folk",
  ]),

  video(list: [
    "Daily Life",
    "Comedy",
    "Entertainment",
    "Animals",
    "Food",
    "Beauty & Style",
    "Drama",
    "Learning",
    "Talent",
    "Sports",
    "Auto",
    "Family",
    "Fitness & Health",
    "DIY & Life Hacks",
    "Arts & Crafts",
    "Dance",
    "Outdoors",
    "Oddly Satisfying",
    "Home & Garden",
  ]),

  entertainment(list:[
    "Action",
    "Adventure",
    "Comedy",
    "Crime and mystery",
    "Fantasy",
    "Historical",
    "Horror",
    "Romance",
    "Satire",
    "Science fiction",
    "Speculative",
    "Thriller",
    "Isekai",
    "Anime",
    "Other"
  ]);

  final List<String> list;

  const ItemType({required this.list});
}
