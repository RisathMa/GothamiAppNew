// Album Model
class Album {
  final int id;
  final String albumName;
  final String coverPhotoUrl;
  final String? description;
  final int photoCount;
  final DateTime createdAt;
  final String? facebookLink;

  Album({
    required this.id,
    required this.albumName,
    required this.coverPhotoUrl,
    this.description,
    required this.photoCount,
    required this.createdAt,
    this.facebookLink,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      albumName: json['album_name'],
      coverPhotoUrl: json['cover_photo_url'],
      description: json['description'],
      photoCount: json['photo_count'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      facebookLink: json['facebook_link'],
    );
  }
}

// Album Photo Model
class AlbumPhoto {
  final int id;
  final int albumId;
  final String photoUrl;
  final String? photoDescription;
  final int photoOrder;
  final DateTime createdAt;

  AlbumPhoto({
    required this.id,
    required this.albumId,
    required this.photoUrl,
    this.photoDescription,
    required this.photoOrder,
    required this.createdAt,
  });

  factory AlbumPhoto.fromJson(Map<String, dynamic> json) {
    return AlbumPhoto(
      id: json['id'],
      albumId: json['album_id'],
      photoUrl: json['photo_url'],
      photoDescription: json['photo_description'],
      photoOrder: json['photo_order'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}