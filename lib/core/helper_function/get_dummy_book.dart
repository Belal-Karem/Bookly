import '../../features/home/data/model/book_model/book_model.dart';
import '../../features/home/data/model/book_model/image_links.dart';
import '../../features/home/data/model/book_model/volume_info.dart';

BookModel getDummyBook({
  required String title,
  required String author,
  required String image,
  String id = '0',
}) {
  return BookModel(
    id: id,
    kind: 'books#volume',
    volumeInfo: VolumeInfo(
      title: title,
      authors: [author],
      imageLinks: ImageLinks(smallThumbnail: image, thumbnail: image),
    ),
  );
}

List<BookModel> dummyBooksList = [
  getDummyBook(
    id: '1',
    title: 'Clean Code',
    author: 'Robert C. Martin',
    image: 'https://covers.openlibrary.org/b/id/9644151-L.jpg',
  ),
  getDummyBook(
    id: '2',
    title: 'The Pragmatic Programmer',
    author: 'Andrew Hunt',
    image: 'https://covers.openlibrary.org/b/id/8099256-L.jpg',
  ),
  getDummyBook(
    id: '3',
    title: 'Design Patterns',
    author: 'GoF',
    image: 'https://covers.openlibrary.org/b/id/8319251-L.jpg',
  ),
];
