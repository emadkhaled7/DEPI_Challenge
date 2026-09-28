import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  final List<Map<String, dynamic>> movies = const [
    {
      'title': 'Interstellar',
      'image': 'assets/movies/interstellar.jpg',
      'rating': 8.7,
      'genre': 'Sci-Fi',
    },
    {
      'title': 'The Dark Knight',
      'image': 'assets/movies/the_dark_knight.jpg',
      'rating': 9.0,
      'genre': 'Action',
    },
    {
      'title': 'Avatar',
      'image': 'assets/movies/avatar.jpg',
      'rating': 7.8,
      'genre': 'Adventure',
    },
    {
      'title': 'Dune',
      'image': 'assets/movies/dune.jpg',
      'rating': 8.0,
      'genre': 'Sci-Fi',
    },
  ];

  final List<Map<String, dynamic>> popularMovies = const [
    {
      'title': 'Oppenheimer',
      'image': 'assets/movies/oppenheimer.jpg',
      'rating': 8.6,
    },
    {
      'title': 'Spider-Man',
      'image': 'assets/movies/spider_man.jpg',
      'rating': 8.2,
    },
    {
      'title': 'Inception',
      'image': 'assets/movies/inception.jpg',
      'rating': 8.8,
    },
    {
      'title': 'Interstellar',
      'image': 'assets/movies/interstellar.jpg',
      'rating': 8.7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0D0F14),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildHero(),
              _buildSectionTitle('Now Playing'),
              _buildMovieList(),
              _buildSectionTitle('Popular Movies'),
              _buildPopularMovies(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'CineMax',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: const Color(0xff1A1D24),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xffE85D4A),
            child: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      height: 330,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        image: const DecorationImage(
          image: AssetImage('assets/movies/inception_banner.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(.9),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FEATURED MOVIE',
              style: TextStyle(
                color: Color(0xffFF7664),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.3,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Inception',
              style: TextStyle(
                color: Colors.white,
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 7),
            Row(
              children: const [
                Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                SizedBox(width: 5),
                Text(
                  '8.8   •   Sci-Fi   •   2010',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Watch Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffE85D4A),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Text(
            'See all',
            style: TextStyle(
              color: Color(0xffFF7664),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieList() {
    return SizedBox(
      height: 265,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return Container(
            width: 150,
            margin: const EdgeInsets.only(right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    movie['image'],
                    height: 205,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  movie['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '${movie['rating']}',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      movie['genre'],
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularMovies() {
    return SizedBox(
      height: 125,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        itemCount: popularMovies.length,
        itemBuilder: (context, index) {
          final movie = popularMovies[index];

          return Container(
            width: 230,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: const Color(0xff181B22),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    movie['image'],
                    width: 72,
                    height: 105,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie['title'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${movie['rating']}',
                            style: const TextStyle(
                              color: Colors.white60,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xff12141A),
      selectedItemColor: const Color(0xffE85D4A),
      unselectedItemColor: Colors.white38,
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border_rounded),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}