import 'dart:async';

import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/core/utils/asset_provider.dart';
import 'package:final_assignment/core/utils/util.dart';
import 'package:final_assignment/features/authentication/presentation/view/signin_view.dart';
import 'package:final_assignment/features/product/presentation/viewmodel/product_viewmodel.dart';
import 'package:final_assignment/features/sensors/domain/usecases/double_shake_use_case.dart';
import 'package:final_assignment/features/sensors/domain/usecases/gyroscope_usecase.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePageView extends ConsumerStatefulWidget {
  const HomePageView({super.key});

  @override
  ConsumerState<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends ConsumerState<HomePageView> {
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _searchController = TextEditingController();
  late DoubleShakeDetectorService _doubleShakeDetectorService;

  late GyroscopeService _gyroscopeService;
  late StreamSubscription<GyroscopeEvent> _gyroscopeSubscription;
  int _selectedIndex = 0;

  final List<Widget> bottomScreens = [
    const HomePageView(),
    const HomePageView(),
    const HomePageView(),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize shake detection service
    _doubleShakeDetectorService =
        DoubleShakeDetectorService(onShake: _handleShake);
    _doubleShakeDetectorService.startListening();
    _gyroscopeService = GyroscopeService();
    _gyroscopeSubscription = _gyroscopeService.gyroscopeStream.listen((event) {
      // Example: Check if the device is tilted in a specific direction
      if (event.x > 1.0) {
        // Perform an action, e.g., log out
        _logout();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _doubleShakeDetectorService.stopListening();
    _gyroscopeSubscription.cancel();
    _gyroscopeService.dispose();

    super.dispose();
  }

  void _handleShake() {
    _doubleShakeDetectorService.stopListening();
    _logout();
  }

  void _logout() {
    print('shack');
    NavigateRoute.pushRoute(const SignInPageView());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: kHorizontalMargin, vertical: kVerticalMargin),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Image.asset(
              Assets.images.Banner,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: 10, // Adjust this to the length of your product list
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            Assets.images
                                .SplashScreen, // replace with your product image path
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Product Name $index',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
