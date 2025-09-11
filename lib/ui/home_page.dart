import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/models/business_model.dart';
import 'package:provider_sample/providers/business_provider.dart';
import 'package:provider_sample/ui/business_list.dart';
import 'package:provider_sample/ui/error_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BusinessProvider>().fetchBusinesses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Directory'),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<BusinessProvider>(
        builder: (context, provider, child) {
          switch (provider.state) {
            case ViewState.loading:
              return Center(child: SizedBox(height: 30, width: 30, child: CircularProgressIndicator(strokeWidth: 2)));

            case ViewState.success:
              return BusinessList<BusinessModel>(options: provider.businesses);

            case ViewState.empty:
              return const Text('No businesses found.');

            case ViewState.error:
              return ErrorView(message: provider.errorMessage, onRetry: () => provider.fetchBusinesses());

            case ViewState.idle:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
