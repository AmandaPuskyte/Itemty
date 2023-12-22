import 'package:flutter/material.dart';
import 'package:pos/styles/colors.dart';
import 'package:pos/styles/padding.dart';
import 'package:pos/styles/pos_icons.dart';
import 'package:sidebarx/sidebarx.dart';

void main() {
  runApp(POSApp());
}

class POSApp extends StatelessWidget {
  POSApp({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: Colors.white,
                    title: Text(_pageByIndex(_controller.selectedIndex)),
                    leading: IconButton(
                      onPressed: () {
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: DashboardSidebar(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) DashboardSidebar(controller: _controller),
                Expanded(
                  child: Center(
                    child: _Screens(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DashboardSidebar extends StatelessWidget {
  const DashboardSidebar({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(
              color: POSColors.grey.selection,
              width: 2,
            ),
          ),
        ),
        hoverColor: POSColors.grey.line,
        textStyle: TextStyle(color: POSColors.grey.darkText),
        hoverTextStyle: TextStyle(
          color: POSColors.grey.darkText,
        ),
        selectedTextStyle: TextStyle(
            color: POSColors.grey.darkText, fontWeight: FontWeight.w600),
        padding: const EdgeInsets.all(8),
        itemPadding: const EdgeInsets.all(6),
        selectedItemPadding: const EdgeInsets.all(6),
        itemMargin: EdgeInsets.only(bottom: 20),
        selectedItemMargin: EdgeInsets.only(
          bottom: 20,
        ),
        itemTextPadding: const EdgeInsets.only(left: 20),
        selectedItemTextPadding: const EdgeInsets.only(left: 20),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedItemDecoration: BoxDecoration(
          color: POSColors.grey.selection,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      extendedTheme: const SidebarXTheme(
        padding: const EdgeInsets.all(6),
        width: 160,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.black12,
              width: 2,
            ),
          ),
          color: Colors.white,
        ),
      ),
      headerBuilder: (context, extended) {
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
              decoration: BoxDecoration(
                color: POSColors.brand.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: new IconButton(
                  icon: new Icon(
                    
                    POS.add,
                    color: Colors.white,
                  ),
                  onPressed: null),
            ),
          ),
        );
      },
      footerItems: [
        const SidebarXItem(
          iconWidget: Icon(POS.chat),
          label: 'Chat',
        ),
        const SidebarXItem(
          iconWidget: Icon(POS.help),
          label: 'Help',
        ),
        const SidebarXItem(
          iconWidget: Icon(POS.settings),
          label: 'Settings',
        ),
      ],
      items: [
        SidebarXItem(
          iconWidget: Icon(POS.home),
          label: 'Home',
        ),
        const SidebarXItem(
          iconWidget: Icon(POS.list),
          label: 'List',
        ),
        const SidebarXItem(
          iconWidget: Icon(POS.reports),
          label: 'Reports',
        ),
        const SidebarXItem(
          iconWidget: Icon(POS.sales),
          label: 'Sales',
        ),
      ],
    );
  }
}

class _Screens extends StatelessWidget {
  const _Screens({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.l, vertical: AppPadding.xs),
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    final pageTitle = _pageByIndex(controller.selectedIndex);
                    switch (controller.selectedIndex) {
                      default:
                        return Text(
                          pageTitle,
                          style: TextStyle(
                              color: POSColors.brand.primary,
                              fontWeight: FontWeight.w600),
                        );
                    }
                  },
                ),
              ),
              const Spacer(),
              Image.asset(
                "assets/images/logo.png",
                height: 30,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  POS.search,
                  size: 20,
                ),
                color: Colors.black,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  POS.notifications,
                  size: 20,
                ),
                color: Colors.black,
                onPressed: () {},
              ),
              SizedBox(
                width: AppPadding.s,
              ),
              ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(18),
                  child: Image.asset(
                    "assets/images/Antonio.jpg",
                    height: 10,
                  ),
                ),
              ),
              SizedBox(
                width: AppPadding.m,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Role",
                    style: TextStyle(color: POSColors.grey.lightText),
                  )
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: POSColors.grey.line,
          thickness: 2,
        ),
       
      ],
    );
  }
}

String _pageByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'List';
    case 2:
      return 'Reports';
    case 3:
      return 'Sales';
    case 4:
      return 'Chat';
    case 5:
      return 'Help';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}
