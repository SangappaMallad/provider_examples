import 'package:api_integration_demo/providers/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProviders>(context, listen: false).getAllComments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Comments')),
      ),
      body: Consumer<UserProviders>(builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final todos = value.todos;

        return Container(
          color: Colors.grey,
          child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final comments = todos[index];

                return Card(
                  shadowColor: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        comments.id.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      comments.name.toString().toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        '${comments.email.toString()}\n ${comments.body.toString()}'),
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                );
              }),
        );
      }),
    );
  }
}
