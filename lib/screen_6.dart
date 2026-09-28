import 'package:flutter/material.dart';

class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  final TextEditingController searchController = TextEditingController();

  String selectedGenre = 'All';

  final List<String> genres = [
    'All',
    'Fiction',
    'Business',
    'Self Growth',
    'Technology',
  ];

  final List<Map<String, dynamic>> books = [
    {
      'title': 'Atomic Habits',
      'author': 'James Clear',
      'image': 'assets/books/atomic_habits.jpg',
      'rating': 4.8,
      'genre': 'Self Growth',
    },
    {
      'title': 'The Alchemist',
      'author': 'Paulo Coelho',
      'image': 'assets/books/the_alchemist.jpg',
      'rating': 4.7,
      'genre': 'Fiction',
    },
    {
      'title': '1984',
      'author': 'George Orwell',
      'image': 'assets/books/1984.jpg',
      'rating': 4.6,
      'genre': 'Fiction',
    },
    {
      'title': 'Clean Code',
      'author': 'Robert C. Martin',
      'image': 'assets/books/clean_code.jpg',
      'rating': 4.8,
      'genre': 'Technology',
    },
    {
      'title': 'Deep Work',
      'author': 'Cal Newport',
      'image': 'assets/books/deep_work.jpg',
      'rating': 4.7,
      'genre': 'Self Growth',
    },
    {
      'title': 'Rich Dad Poor Dad',
      'author': 'Robert Kiyosaki',
      'image': 'assets/books/rich_dad_poor_dad.jpg',
      'rating': 4.5,
      'genre': 'Business',
    },
    {
      'title': 'The Psychology of Money',
      'author': 'Morgan Housel',
      'image': 'assets/books/the_psychology_of_money.jpg',
      'rating': 4.8,
      'genre': 'Business',
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get filteredBooks {
    final searchText = searchController.text.toLowerCase();

    return books.where((book) {
      final matchesSearch =
          book['title'].toString().toLowerCase().contains(searchText) ||
          book['author'].toString().toLowerCase().contains(searchText);

      final matchesGenre =
          selectedGenre == 'All' || book['genre'] == selectedGenre;

      return matchesSearch && matchesGenre;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F1EB),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildSearch(),
            _buildGenres(),
            _buildContinueReading(),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                'Your Library',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 13),
            Expanded(
              child: filteredBooks.isEmpty
                  ? const Center(
                      child: Text(
                        'No books found',
                        style: TextStyle(color: Colors.black54),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
                      itemCount: filteredBooks.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 17,
                        childAspectRatio: .63,
                      ),
                      itemBuilder: (context, index) {
                        return _buildBookCard(filteredBooks[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 16),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good afternoon',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'My Library',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 43,
            width: 43,
            decoration: BoxDecoration(
              color: const Color(0xff252A24),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.bookmark_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: searchController,
        onChanged: (_) {
          setState(() {});
        },
        decoration: const InputDecoration(
          hintText: 'Search books or authors...',
          prefixIcon: Icon(Icons.search_rounded),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget _buildGenres() {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(18, 15, 18, 10),
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final genre = genres[index];
          final isSelected = genre == selectedGenre;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedGenre = genre;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xff252A24)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                genre,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black54,
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContinueReading() {
    return Container(
      height: 145,
      margin: const EdgeInsets.fromLTRB(18, 10, 18, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffD7DDCF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/books/atomic_habits.jpg',
              width: 85,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'CONTINUE READING',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Atomic Habits',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'James Clear',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: LinearProgressIndicator(
                          value: .64,
                          minHeight: 5,
                          backgroundColor: Colors.white,
                          color: const Color(0xff252A24),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '64%',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
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
  }

  Widget _buildBookCard(Map<String, dynamic> book) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      padding: const EdgeInsets.all(9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      book['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 7,
                  top: 7,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      size: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 9),
          Text(
            book['title'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            book['author'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.star_rounded,
                color: Color(0xffC58B35),
                size: 15,
              ),
              const SizedBox(width: 3),
              Text(
                '${book['rating']}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}