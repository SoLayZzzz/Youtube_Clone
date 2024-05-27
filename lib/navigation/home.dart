import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/color/color.dart';
import 'package:youtube_clone/component/iconbotton.dart';
import 'package:youtube_clone/provider/homeProvider.dart';
import 'package:youtube_clone/provider/navigaProvider.dart';
import 'package:youtube_clone/view/MyDrawer.dart';
import 'package:youtube_clone/view/homeView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabcontroller;
  late HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();

    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    _tabcontroller = TabController(
        length:
            homeProvider.homecate.isEmpty ? 0 : homeProvider.homecate.length,
        vsync: this);

    _tabcontroller.animateTo(1);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeProvider.onInit();
    });

    _tabcontroller.addListener(() {
      if (_tabcontroller.index == 0) {
        context.read<NavigaProvider>().scaffoldKey;
        return;
      }
      homeProvider.filterByIndex(_tabcontroller.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, _) {
      return DefaultTabController(
        length: provider.homecate.isEmpty ? provider.homecate.length : 0,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: noColor,
          drawer: MyDrawer(),
          appBar: _appBar(),
          body: _buildBody(),
        )),
      );
    });
  }

  Widget _buildBody() {
    return Column(
      children: [
        //
        _tabBar(),
        _buildView()
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      title: Row(
        children: [
          Container(
            height: 30,
            width: 50,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/youtube.jpg"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 5,
          ),
          const Text("YouTube")
        ],
      ),
      actions: [
        IconBottonEdit(icon: Icons.cast, ontap: () {}),
        IconBottonEdit(icon: Icons.notifications_none_outlined, ontap: () {}),
        IconBottonEdit(icon: Icons.search_outlined, ontap: () {}),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }

  Widget _tabBar() {
    return TabBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
        unselectedLabelColor: black,
        indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
        indicator:
            BoxDecoration(color: black, borderRadius: BorderRadius.circular(5)),
        isScrollable: true,
        labelColor: white,
        controller: _tabcontroller,
        dividerColor: noColor,
        indicatorColor: noColor,
        tabAlignment: TabAlignment.start,
        tabs: homeProvider.homecate.map((e) {
          if (e.icon != null) {
            return InkWell(
              onTap: () {
                context.read<NavigaProvider>().openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: e.icon!,
              ),
            );
          }
          return Tab(
            child: Container(
              height: 30,
              width: 90,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: black.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  e.title.toString(),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        }).toList()
        //
        );
  }

  Widget _buildView() {
    return Expanded(child: HomeView(datayt: homeProvider.data));
  }
}
