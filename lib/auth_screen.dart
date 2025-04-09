import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shandcn/home_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String currentTab = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ShadTabs<String>(
              value: currentTab,
              onChanged: (val) => setState(() => currentTab = val),
              tabBarConstraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.5,
              ),
              contentConstraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.height,
              ),
              tabs: [
                ShadTab(
                  value: 'login',
                  child: const Text('Login'),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ShadCard(
                      title: const Text('Login'),
                      description: const Text(
                        "Enter your credentials to log in.",
                      ),
                      footer: ShadButton(
                        child: const Text('Login'),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 16),
                          ShadInputFormField(
                            label: const Text('Email'),
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(height: 8),
                          ShadInputFormField(
                            label: const Text('Password'),
                            obscureText: true,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
                ShadTab(
                  value: 'signup',
                  child: const Text('Sign Up'),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ShadCard(
                      title: const Text('Sign Up'),
                      description: const Text("Create a new account."),
                      footer: const ShadButton(child: Text('Sign Up')),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 16),
                          ShadInputFormField(label: const Text('Name')),
                          const SizedBox(height: 8),
                          ShadInputFormField(
                            label: const Text('Email'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 8),
                          ShadInputFormField(
                            label: const Text('Password'),
                            obscureText: true,
                          ),
                          const SizedBox(height: 8),
                          ShadInputFormField(
                            label: const Text('Phone Number'),
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
