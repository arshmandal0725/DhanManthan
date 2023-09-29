import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed_revised/webfeed_revised.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

Future<List<RssItem>> fetchYahooFinanceNews(String rssFeedUrl) async {
  final response = await http.get(Uri.parse(rssFeedUrl));

  if (response.statusCode == 200) {
    final feed = RssFeed.parse(response.body);
    return feed.items ?? []; // Return an empty list if there are no items.
  } else {
    throw Exception('Failed to fetch Yahoo Finance news');
  }
}

class _NewsPageState extends State<NewsPage> {
  final String yahooFinanceTopNewsFeed =
      'https://finance.yahoo.com/rss/topstories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 150,
            padding: const EdgeInsets.all(10),
            child: const Center(
              child: Text(
                'NEWS',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: FutureBuilder<List<RssItem>>(
                future: fetchYahooFinanceNews(yahooFinanceTopNewsFeed),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final newsItems = snapshot.data;
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: newsItems!.length,
                      itemBuilder: (context, index) {
                        final item = newsItems[index];
                        return Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 105, 173, 255),
                                  borderRadius: BorderRadius.circular(18)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 150,
                                    child: CachedNetworkImage(
                                      imageUrl: item.enclosure?.url ?? '',
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.error,
                                        color: Colors.white,
                                      ), // Error widget.
                                    ),
                                  ),
                                  Text(
                                    item.title!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
