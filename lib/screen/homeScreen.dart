import 'package:flutter/material.dart';
import 'package:netflix/screen/movieScreen.dart';
import 'package:netflix/models/movieModels.dart';
import 'package:netflix/widget/content_scroll.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController _pageController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _movieSelector(int index){
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget){
        double value = 1;

        if (_pageController.position.haveDimensions){
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.01).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      
      child: GestureDetector( 
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (_) => MovieScreen(movie: movies[index]),
          ),
        ),

        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: movies[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(movies[index].imageUrl),
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: Container(
                width: 250.0,
                child: Text(
                  movies[index].title.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(bottom: 20.0),
          children: [
            DrawerHeader(
              child: Text('assg') ,
              decoration: BoxDecoration(
                color: Colors.black
              ),
            ),
          ]
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(
          child: Image(
            image: AssetImage('gambar/images/netflix_logo.png'),
            width: 130,
            height: 130,
          ),
        ),

        actions: <Widget> [
          IconButton(
          padding: EdgeInsets.only(right: 10.0),
          onPressed: () => print('Search'),
          icon: Icon(Icons.search),
          iconSize: 25.0,
          color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
          height: 280.0, 
          width: double.infinity, 
          child: PageView.builder(
            controller: _pageController,
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return _movieSelector(index);
              },
            ),
          ),
          Container(
            height: 90.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFD45253),
                        Color(0xFF9E1F28),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF9E1F28),
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context, MaterialPageRoute(
                          builder: (_) => MovieScreen(movie: movies[index],) )),
                      child: Text(labels[index].toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.8,
                      ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.0,),
          ContentScroll(
           images: mylist,
           title: 'Pernah di Lihat',
           imageHeight: 300.0,
           imageWidth: 150.0,
          ),
          SizedBox(
            height: 15.0,
          ),
           ContentScroll(
           images: popular,
           title: 'Populer',
           imageHeight: 300.0,
           imageWidth: 150.0,
          ),
        ],
      ),
    );
  }
}