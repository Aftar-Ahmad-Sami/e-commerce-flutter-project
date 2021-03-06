import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;

  final List<String> images = [
    "iphone11.jpg",
    "sweater.png",
    "laptop.jpg",
    "femalewear.png"
  ];
// List images = [
//     "https://images.samsung.com/bd/smartphones/galaxy-z-fold3-5g/images/galaxy-z-fold3-5g_highlights_kv_img_l.jpg",
//     "https://images.samsung.com/bd/smartphones/galaxy-z-flip3-5g/images/galaxy-z-flip3-5g_highlights_kv_l.jpg",
//     "https://images.samsung.com/is/image/samsung/p6pim/bd/feature/138058092/bd-feature-galaxy-a-457905559",
//     "https://images.samsung.com/bd/smartphones/galaxy-z-fold3-5g/images/galaxy-z-fold3-5g_highlights_kv_img_l.jpg",
//     "https://images.samsung.com/bd/smartphones/galaxy-z-flip3-5g/images/galaxy-z-flip3-5g_highlights_kv_l.jpg",
//     "https://images.samsung.com/is/image/samsung/p6pim/bd/feature/138058092/bd-feature-galaxy-a-457905559",
//   ];

  List<Widget> indicators(imagesLength, currentIndex) {
    return List.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 20,
        height: 10,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    });
  }

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Builder(builder: (context) {
            //  final double height = 200;
            return CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: images.map(
                (url) {
                  return Container(
                    //      margin: EdgeInsets.all(0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Image.asset(
                        url,
                        fit: BoxFit.cover,
                        width: 200.0,
                      ),
                    ),
                  );
                },
              ).toList(),
            );
          }),
        ),

        SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) => const Card(
              child: SizedBox(
                width: 200,
                child: Center(
                    child: Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
          ),
        ),
        // Container(
        //     color: const Color(0xff583D72),
        //     width: MediaQuery.of(context).size.width,
        //     height: 30,
        //     child: const Center(
        //       child: Text(
        //         "For You",
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     )),
        // Expanded(
        //   child: ListView.builder(
        //       itemCount: 5,
        //       itemBuilder: (BuildContext, int index) => const Card(
        //             child: SizedBox(
        //                 height: 40, child: Center(child: Text("Product"))),
        //           )),
        // ),
        Container(
            color: const Color(0xff583D72),
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: const Center(
              child: Text(
                "Products",
                style: TextStyle(color: Colors.white),
              ),
            )),
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext, int index) => const Card(
                    child: SizedBox(
                        height: 40, child: Center(child: Text("Product"))),
                  )),
        ),
      ],
    );
  }
}
