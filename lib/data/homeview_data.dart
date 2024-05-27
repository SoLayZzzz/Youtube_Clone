class HomeViewData {
  String? image, title, pf, viewDetail, nameAcc;
  HomeViewData(
      {this.image, this.pf, this.title, this.viewDetail, this.nameAcc});

  static List<HomeViewData> homeviewdata = [
    HomeViewData(
      nameAcc: "SokLay",
      viewDetail: "19,199 views . 20h ago",
      title: "Cartoon",
      pf: "assets/images/lay.jpg",
      image: "assets/images/forest.jpg",
    ),
    HomeViewData(
      nameAcc: "Hello",
      viewDetail: "19,199 views . 20h ago",
      title: "Cartoon",
      pf: "assets/images/lay.jpg",
      image: "assets/images/forest.jpg",
    ),
    HomeViewData(
      nameAcc: "Bye bye",
      viewDetail: "19,199 views . 20h ago",
      title: "Cartoon",
      pf: "assets/images/lay.jpg",
      image: "assets/images/forest.jpg",
    ),
  ];
}
