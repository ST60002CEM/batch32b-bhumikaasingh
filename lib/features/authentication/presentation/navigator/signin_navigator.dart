import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/authentication/presentation/navigator/signup_navigator.dart';
import 'package:final_assignment/features/authentication/presentation/view/signin_view.dart';
import 'package:final_assignment/features/home/presentation/navigator/homepage_navigator.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final SignInViewNavigatorProvider = Provider((ref) => SignInViewNavigator());

class SignInViewNavigator with SignUpViewRoute,HomePageViewRoute {}

mixin SignInViewRoute {
  openSignInView() {
    NavigateRoute.pushRoute(const SignInPageView());
  }
}
