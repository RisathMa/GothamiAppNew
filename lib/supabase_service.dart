import 'package:supabase_flutter/supabase_flutter.dart';
import 'models.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  factory SupabaseService() => _instance;
  SupabaseService._internal();

  final SupabaseClient supabase = Supabase.instance.client;

  // Fetch Gallery Images from Supabase
  Future<List<GalleryImage>> fetchGalleryImages() async {
    try {
      final response = await supabase
          .from('gallery_images')
          .select()
          .order('id', ascending: true);

      return (response as List)
          .map((json) => GalleryImage(
        id: json['id'],
        src: json['image_url'],
        alt: json['alt_text'] ?? '',
        category: _parseGalleryCategory(json['category']),
      ))
          .toList();
    } catch (e) {
      print('Error fetching gallery images: $e');
      return [];
    }
  }

  // Fetch School Events from Supabase
  Future<List<SchoolEvent>> fetchSchoolEvents() async {
    try {
      final response = await supabase
          .from('school_events')
          .select()
          .order('date', ascending: true);

      return (response as List)
          .map((json) => SchoolEvent(
        id: json['id'],
        title: json['title'],
        date: json['date'],
        time: json['time'],
        category: _parseEventCategory(json['category']),
        description: json['description'] ?? '',
      ))
          .toList();
    } catch (e) {
      print('Error fetching school events: $e');
      return [];
    }
  }

  // Subscribe to Gallery Images real-time updates
  RealtimeChannel subscribeToGalleryImages(Function(List<GalleryImage>) onUpdate) {
    return supabase
        .channel('gallery_images_changes')
        .onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'gallery_images',
      callback: (payload) async {
        final images = await fetchGalleryImages();
        onUpdate(images);
      },
    )
        .subscribe();
  }

  // Subscribe to School Events real-time updates
  RealtimeChannel subscribeToSchoolEvents(Function(List<SchoolEvent>) onUpdate) {
    return supabase
        .channel('school_events_changes')
        .onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'school_events',
      callback: (payload) async {
        final events = await fetchSchoolEvents();
        onUpdate(events);
      },
    )
        .subscribe();
  }

  // Helper method to parse gallery category from string
  GalleryCategory _parseGalleryCategory(String? category) {
    switch (category?.toLowerCase()) {
      case 'infrastructure':
        return GalleryCategory.infrastructure;
      case 'academic':
        return GalleryCategory.academic;
      case 'sports':
        return GalleryCategory.sports;
      case 'cultural':
        return GalleryCategory.cultural;
      default:
        return GalleryCategory.all;
    }
  }

  // Helper method to parse event category from string
  EventCategory _parseEventCategory(String? category) {
    switch (category?.toLowerCase()) {
      case 'academic':
        return EventCategory.academic;
      case 'sports':
        return EventCategory.sports;
      case 'cultural':
        return EventCategory.cultural;
      case 'meetings':
        return EventCategory.meetings;
      case 'general':
        return EventCategory.general;
      default:
        return EventCategory.all;
    }
  }
}