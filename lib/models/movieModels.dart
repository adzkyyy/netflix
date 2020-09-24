class Movie {
  String imageUrl;
  String title;
  String categories;
  int year;
  String country;
  int length;
  String description;
  List<String> screenshot;

  Movie({
    this.imageUrl,
    this.title,
    this.categories,
    this.year,
    this.country,
    this.length,
    this.description,
    this.screenshot,
  });
}

final List<Movie> movies = [
  Movie(
    imageUrl: 'gambar/images/spiderman.jpg',
    title: 'Spiderman: Far From Home',
    categories: 'Fantasy, Sci-Fi',
    year: 2018,
    country: 'USA',
    length: 129,
    description: 'ini spiderman',
    screenshot: [
      'gambar/images/spiderman_0.jpg',
      'gambar/images/spiderman_1.jpg',
    ],
  ),
  Movie(
    imageUrl: 'gambar/images/nutcracker.jpg',
    title: 'The Nutcracker And The Four Realms',
    categories: 'Adventure, Family, Fantasy',
    year: 2018,
    country: 'USA',
    length: 100,
    description: 'ini Nutcracker',
    screenshot: [
      'gambar/images/nutcracker_0.jpg',
      'gambar/images/nutcracker_1.jpg',
      'gambar/images/nutcracker_2.jpg',
    ],
  ),
  Movie(
    imageUrl: 'gambar/images/toystory.jpg',
    title: 'Toy Story 4',
    categories: 'Fantasy, Adventure',
    year: 2019,
    country: 'USA',
    length: 100,
    description: 'ini toy story',
    screenshot: [
      'gambar/images/toystory_0.jpg',
      'gambar/images/toystory_1.jpg',
      'gambar/images/toystory_2.jpg',
    ],
  ),
  Movie(
    imageUrl: 'gambar/images/theguard.jpg',
    title: 'The Old Guard',
    categories: 'Laga/Fantasy',
    year: 2020,
    country: 'Rusia',
    length: 125,
    description: 'ini The Old Guard',
    screenshot: [
      'gambar/images/theguard_1.jpg',
      'gambar/images/theguard_2.jpg',
      'gambar/images/theguard_3.jpg',
    ],
  ),
];

final List<String> labels = [
  'Temukan',
  'Kategori',
  'Top Film',
  'Terbaru',
];

final List<String> mylist = [
  'gambar/images/jojosiji.jpg',
  'gambar/images/jojoloro.jpg',
  'gambar/images/jojotelu.jpg',
  'gambar/images/jojopapat.jpg',
  'gambar/images/jojolimo.jpg',
  'gambar/images/jojoenem.jpg',
];

final List<String> popular = [
  'gambar/images/stranger_things.jpg',
  'gambar/images/endgame.jpg',
  'gambar/images/oitnb.jpg',
  'gambar/images/daredevil.jpg',
  'gambar/images/moneyheist.jpg',
];