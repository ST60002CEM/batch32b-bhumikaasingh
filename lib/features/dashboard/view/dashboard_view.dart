import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/core/utils/asset_provider.dart';
import 'package:final_assignment/core/utils/util.dart';
import 'package:final_assignment/features/authentication/presentation/view/signin_view.dart';
import 'package:final_assignment/features/product/presentation/viewmodel/product_viewmodel.dart';
import 'package:final_assignment/features/sensors/domain/usecases/double_shake_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageView extends ConsumerStatefulWidget {
  const HomePageView({super.key});

  @override
  ConsumerState<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends ConsumerState<HomePageView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final TextEditingController _searchController = TextEditingController();
  late DoubleShakeDetectorService _doubleShakeDetectorService;

  @override
  void initState() {
    super.initState();
    // Initialize shake detection service
    _doubleShakeDetectorService =
        DoubleShakeDetectorService(onShake: _handleShake);
    _doubleShakeDetectorService.startListening();
  }

  // @override
  // void dispose() {
  //   // Clean up when the widget is disposed
  //   _doubleShakeDetectorService.stopListening();
  //   super.dispose();
  // }

  void _handleShake() {
    _doubleShakeDetectorService.stopListening();
    _logout();
  }

  void _logout() {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: kHorizontalMargin, vertical: kVerticalMargin),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: Image.asset(
                Assets.images.Banner,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: state.lstProducts.length,
                itemBuilder: (context, index) {
                  final product = state.lstProducts[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            Assets.images.SplashScreen,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.productName!,
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
          ],
        ),
      ),
    );
  }
}
