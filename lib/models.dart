enum GalleryCategory {
  all('All'),
  infrastructure('Infrastructure'),
  academic('Academic'),
  sports('Sports'),
  cultural('Cultural');

  final String displayName;
  const GalleryCategory(this.displayName);
}

class GalleryImage {
  final int id;
  final String src;
  final String alt;
  final GalleryCategory category;

  const GalleryImage({
    required this.id,
    required this.src,
    required this.alt,
    required this.category,
  });
}

enum EventCategory {
  all('All Events'),
  academic('Academic'),
  sports('Sports'),
  cultural('Cultural'),
  meetings('Meetings'),
  general('General');

  final String displayName;
  const EventCategory(this.displayName);
}

class SchoolEvent {
  final int id;
  final String title;
  final String date;
  final String time;
  final EventCategory category;
  final String description;

  const SchoolEvent({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.category,
    required this.description,
  });
}