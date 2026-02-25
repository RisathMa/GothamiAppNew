import 'models.dart';

class AppConstants {
  static const List<GalleryImage> galleryImages = [
    GalleryImage(
      id: 1,
      src: 'https://picsum.photos/seed/school1/400/300',
      alt: 'School Building',
      category: GalleryCategory.infrastructure,
    ),
    GalleryImage(
      id: 2,
      src: 'https://picsum.photos/seed/award/400/300',
      alt: 'Awards Ceremony',
      category: GalleryCategory.academic,
    ),
    GalleryImage(
      id: 3,
      src: 'https://picsum.photos/seed/sportsday/400/300',
      alt: 'Sports Day',
      category: GalleryCategory.sports,
    ),
    GalleryImage(
      id: 4,
      src: 'https://picsum.photos/seed/dance/400/300',
      alt: 'Cultural Dance',
      category: GalleryCategory.cultural,
    ),
    GalleryImage(
      id: 5,
      src: 'https://picsum.photos/seed/library/400/300',
      alt: 'School Library',
      category: GalleryCategory.infrastructure,
    ),
    GalleryImage(
      id: 6,
      src: 'https://picsum.photos/seed/classroom/400/300',
      alt: 'Classroom Session',
      category: GalleryCategory.academic,
    ),
    GalleryImage(
      id: 7,
      src: 'https://picsum.photos/seed/cricket/400/300',
      alt: 'Cricket Match',
      category: GalleryCategory.sports,
    ),
    GalleryImage(
      id: 8,
      src: 'https://picsum.photos/seed/music/400/300',
      alt: 'Music Event',
      category: GalleryCategory.cultural,
    ),
    GalleryImage(
      id: 9,
      src: 'https://picsum.photos/seed/lab/400/300',
      alt: 'Science Lab',
      category: GalleryCategory.academic,
    ),
  ];

  static const List<SchoolEvent> schoolEvents = [
    SchoolEvent(
      id: 1,
      title: 'Annual Sports Meet',
      date: 'July 20, 2024',
      time: '9:00 AM - 4:00 PM',
      category: EventCategory.sports,
      description:
      'The most anticipated sporting event of the year. Join us for a day of thrilling athletic competitions.',
    ),
    SchoolEvent(
      id: 2,
      title: 'Parent-Teacher Meeting',
      date: 'July 25, 2024',
      time: '10:00 AM - 1:00 PM',
      category: EventCategory.meetings,
      description:
      'An opportunity for parents to discuss their child\'s progress with teachers.',
    ),
    SchoolEvent(
      id: 3,
      title: 'Science Fair',
      date: 'August 5, 2024',
      time: 'All Day',
      category: EventCategory.academic,
      description:
      'Students from all grades will showcase their innovative science projects.',
    ),
    SchoolEvent(
      id: 4,
      title: 'Cultural Day Festival',
      date: 'August 15, 2024',
      time: '11:00 AM onwards',
      category: EventCategory.cultural,
      description:
      'A vibrant celebration of diverse cultures with music, dance, and food stalls.',
    ),
    SchoolEvent(
      id: 5,
      title: 'Mid-Term Examinations',
      date: 'September 2-10, 2024',
      time: 'As per schedule',
      category: EventCategory.academic,
      description: 'Scheduled mid-term exams for grades 6 to 11.',
    ),
  ];
}