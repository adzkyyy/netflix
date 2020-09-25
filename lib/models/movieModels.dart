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
    description: 'Peter Parker (Tom Holland) tengah mengunjungi Eropa untuk liburan panjang bersama temaan-temanya. Sayangnya , Parker tidak bisa dengan tenang menikmati liburannya, karena Nick Fury datang secara tiba-tiba di kamar hotelnya. Selama di Eropa pun Peter harus menghadapi banyak musuh mulai dari Hydro Man, Sandman dan Molten Man.',
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
    description: 'Woody selalu merasa percaya diri akan posisinya di dunia, dan prioritasnya adalah menjaga anaknya, baik itu Andy atau Bonnie. Namun ketika Bonnie menambahkan sebuah mainan baru bernama Forky dalam kamar mainannya, sebuah pengembaraan bersama teman-teman lama dan baru akan membawa Woody untuk menyaksikan betapa besarnya dunia ini bagi sebuah mainan seperti dirinya.',
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
    description: 'mengisahkan tentang sekelompok prajurit bayaran rahasia yang memiliki kemampuan untuk hidup abadi. Mereka bertugas untuk melindungi dunia selama berabad-abad lamanya. Para prajurit bayaran ini dipimpin oleh seorang prajurit perempuan bernama Andy (Charlize Theron).',
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