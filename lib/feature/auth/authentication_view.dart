import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/feature/auth/authentication_provider.dart';
import 'package:flutter_firebase_project/product/constants/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {
  final authProvider =
      StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });

  @override
  void initState() {
    super.initState();
    checkUser(FirebaseAuth.instance.currentUser);
  }

  void checkUser(User? user) {
    ref.read(authProvider.notifier).fetchUserDetail(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: firebase.FirebaseUIActions(
        actions: [
          firebase.AuthStateChangeAction<firebase.SignedIn>((context, state) {
            if (state.user != null) checkUser(state.user);
          })
        ],
        child: SafeArea(
          child: Padding(
            padding: context.paddingLow,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const _Header(),
                    Padding(
                      padding: context.paddingNormal,
                      child: firebase.LoginView(
                        action: firebase.AuthAction.signIn,
                        providers: firebase.FirebaseUIAuth.providersFor(
                          FirebaseAuth.instance.app,
                        ),
                        showTitle: false,
                      ),
                    ),
                    if (ref.watch(authProvider).isRedirect)
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          StringConstants.continueToApp,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodySmall?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstants.loginWelcomeBack,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: context.onlyTopPaddingLow),
          Text(
            StringConstants.loginWelcomeDetail,
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
