part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexPage;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    indexPage = 1;
    pageController = PageController(initialPage: indexPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: blackColor,
          ),
          SafeArea(
              child: Container(
            color: whiteColor,
          )),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                indexPage = index;
              });
            },
            children: <Widget>[
              Center(
                child: Text("halam 2"),
              ),
              MoviePage(),
              Center(
                child: Text("halam 3"),
              )
            ],
          ),
          createCustomButtonNavBar()
        ],
      ),
    );
  }

  Widget createCustomButtonNavBar() => Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: blackColor,
        height: 50,
        child: BottomNavigationBar(
          backgroundColor: blackColor,
          elevation: 10,
          currentIndex: indexPage,
          unselectedItemColor: Color(0xFFE5E5EE),
          selectedItemColor: mainColor,
          onTap: (index) {
            setState(() {
              indexPage = index;
              pageController.jumpToPage(index);
            });
          },
          items: [
            BottomNavigationBarItem(
                title: SizedBox.shrink(),
                icon: Container(
                    height: 28,
                    child: Image.asset((indexPage == 0)
                        ? "assets/transaction-yellow.png"
                        : "assets/transaction.png"))),
            BottomNavigationBarItem(
                title: SizedBox.shrink(),
                icon: Container(
                    height: 30,
                    child: Center(
                      child: Image.asset((indexPage == 1)
                          ? "assets/movie-yellow.png"
                          : "assets/movie.png"),
                    ))),
            BottomNavigationBarItem(
                title: SizedBox.shrink(),
                icon: Container(
                    height: 30,
                    child: Image.asset((indexPage == 2)
                        ? "assets/ticket-yellow.png"
                        : "assets/ticket.png"))),
          ],
        ),
      ));
}
