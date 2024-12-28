import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/juice/juice_bloc.dart';
import 'blocs/juice/juice_event.dart';
import 'blocs/juice/juice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JuicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<JuiceBloc, JuiceState>(
        builder: (context, state) {
          if (state is JuiceLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is JuiceLoaded) {
            final juice_data = state.juice_data;
            return ListView.builder(
              itemCount: juice_data.length,
              itemBuilder: (context, index) {
                final juice = juice_data[index];
                return ListTile(
                  title: Text(juice['name']),
                  subtitle: Text(juice['price'].toString()),
                );
              },
            );
          } else if (state is JuiceError) {
            return Center(child: Text(state.error));
          } else {
            return Center(child: Text('No juice found'));
          }
        },
      ),
    );
  }
}
