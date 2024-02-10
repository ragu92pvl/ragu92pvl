import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:userapp/navigation/page_navigation.dart';
import 'package:userapp/page/home/leads/leads_page.dart';
import 'package:userapp/provider/data_provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../utils/validation_utils.dart';


class HomePage extends ConsumerStatefulWidget {

  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with 3 tabs
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Dispose the TabController when the widget is disposed
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _key = GlobalKey();
    var homeRef = ref.watch(profileDataProvider);

    return Scaffold(
      key: _key,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        backgroundColor: AppColors.loginDividerColor,
        title: Text(
          'Dashboard',
          style: TextStyle(
              fontFamily: AppStyle.poppinsRegular, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          // Hamburger icon
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            // Hamburger icon
            onPressed: () {
                PageNavigation.gotoNotificationPage(context);
            },
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: 'FollowUp'),
            Tab(text: 'Leads'),
          ],
        ),
      ),
      drawer: homeRef.when(
          data: (data) {
            context.loaderOverlay.hide();
            return  Drawer(
              // Left menu
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: AppColors.loginDividerColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset("assets/images/profile.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  StringUtils.capitalize(
                                      data.user!.name!),
                                  style: TextStyle(
                                      fontFamily: AppStyle.poppinsBold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  data.user!.email!,
                                  style: TextStyle(
                                      fontFamily: AppStyle.poppinsRegular,
                                      fontSize: 14),
                                ),
                                // const SizedBox(width: 1,),
                                // Text("View Profile",style: TextStyle(fontFamily: AppStyle.poppinsBold,fontSize: 16,decorationColor: Colors.white,
                                //     color:Colors.white,decoration: TextDecoration.underline),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: AppColors.loginDividerColor,
                    ),
                    title: Text(
                      'View Profile',
                      style: TextStyle(fontFamily: AppStyle.poppinsRegular),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: AppColors.loginDividerColor,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(fontFamily: AppStyle.poppinsRegular),
                    ),
                    onTap: () {},
                  ),
                  // Add more menu items as needed
                ],
              ),
            );
          },
          error: (err,s){
            context.loaderOverlay.hide();
            ValidationUtils.showAppToast(err.toString());
            print(err.toString());
            return null;
          },
          loading: (){
            context.loaderOverlay.show();
            return null;
          }
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Tab 1 Content')),
          LeadsPage(),
        ],
      ),
    );
  }
}
