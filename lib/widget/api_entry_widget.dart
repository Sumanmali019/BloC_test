import 'package:assigment/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({Key? key}) : super(key: key);

  Future<bool> _launchURL(String url) async {
    try {
      // ignore: deprecated_member_use
      await launch(
        url,
        enableJavaScript: true,
      );
      return true;
    } catch (e) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiBloc, ApiState>(
      builder: (context, state) {
        if (state is ApiInitial) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
              color: Colors.black,
            ),
          );
        } else if (state is ApiLoaded) {
          final entries = state.data['entries'];

          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              final httpsIcon = entry['HTTPS']
                  ? const Icon(Icons.check, color: Colors.green)
                  : const Icon(Icons.close, color: Colors.red);
              final category = entry['Category'] ?? 'No Auth Data';
              final title = entry['API'] ?? 'No API Data';
              final description = entry['Description'] ?? 'No Description Data';
              final link = entry['Link'] ?? 'No Description Data';

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Title: ',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Description: ',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                description,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            'Category: ',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            category,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            "HTTP Supported:",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          httpsIcon,
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(link);
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.link),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '$link',
                              style: const TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is ApiError) {
          return Center(
            child: Text("Error: ${state.message}"),
          );
        } else {
          return const Center(
            child: Text("Unknown state"),
          );
        }
      },
    );
  }
}
