import 'package:supabase_flutter/supabase_flutter.dart';
import 'album_models.dart';

class AlbumService {
  static final AlbumService _instance = AlbumService._internal();
  factory AlbumService() => _instance;
  AlbumService._internal();

  final SupabaseClient supabase = Supabase.instance.client;

  // Fetch all albums
  Future<List<Album>> fetchAlbums() async {
    try {
      final response = await supabase
          .from('albums')
          .select()
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => Album.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching albums: $e');
      return [];
    }
  }

  // Fetch photos for specific album
  Future<List<AlbumPhoto>> fetchAlbumPhotos(int albumId) async {
    try {
      final response = await supabase
          .from('album_photos')
          .select()
          .eq('album_id', albumId)
          .order('photo_order', ascending: true);

      return (response as List)
          .map((json) => AlbumPhoto.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching album photos: $e');
      return [];
    }
  }

  // Subscribe to albums real-time updates
  RealtimeChannel subscribeToAlbums(Function(List<Album>) onUpdate) {
    return supabase
        .channel('albums_changes')
        .onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'albums',
      callback: (payload) async {
        final albums = await fetchAlbums();
        onUpdate(albums);
      },
    )
        .subscribe();
  }

  // Subscribe to album photos real-time updates
  RealtimeChannel subscribeToAlbumPhotos(
      int albumId,
      Function(List<AlbumPhoto>) onUpdate,
      ) {
    return supabase
        .channel('album_photos_changes_$albumId')
        .onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'album_photos',
      callback: (payload) async {
        final photos = await fetchAlbumPhotos(albumId);
        onUpdate(photos);
      },
    )
        .subscribe();
  }
}