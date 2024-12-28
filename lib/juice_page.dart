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
            // Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Navigator.pushNamed(context, '/add');
            },
          ),
        ],
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
                return Center(
                  child: Column(
                    children: [
                      Image.network(
                        juice['imageURL'],
                        width: 200,
                        height: 200,
                      ),
                      ListTile(
                        title:
                            Text(juice['name'], style: TextStyle(fontSize: 24)),
                        subtitle: Text(
                          juice['serving'],
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: Card(
                            color: Colors.blue,
                            child: SizedBox(
                              height: 50,
                              width: 100,
                              child: state.quantity == 0
                                  ? TextButton(
                                      child: const Text(
                                        'Add Item',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        BlocProvider.of<JuiceBloc>(context)
                                            .add(AddOneToCartEvent());
                                      },
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () {
                                            BlocProvider.of<JuiceBloc>(context)
                                                .add(RemoveOneFromCartEvent());
                                          },
                                        ),
                                        Text(state.quantity.toString()),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () {
                                            BlocProvider.of<JuiceBloc>(context)
                                                .add(AddOneToCartEvent());
                                          },
                                        ),
                                      ],
                                    ),
                            )),
                      ),
                      Text(
                        juice['serving'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        juice['description'],
                        style: TextStyle(fontSize: 20),
                      ),
                      ListTile(
                        leading: Icon(Icons.timer),
                        title: Text('Delivery Time'),
                        subtitle: Text(
                          juice['delivery time'],
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ListTile(
                        title:
                            Text('Total Price', style: TextStyle(fontSize: 20)),
                        subtitle: Text(
                          '\$${juice['price'].toString()}',
                          style: TextStyle(fontSize: 24),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            print('Add to cart button pressed');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded edges
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 16, // Text size
                              fontWeight: FontWeight.bold, // Text weight
                            ),
                          ),
                        ),
                        // Text(
                        //   juice['price'].toString(),
                        //   style: TextStyle(fontSize: 20),
                        // ),
                      )
                    ],
                  ),
                );

                // ListTile(
                //   title: Text(juice['name']),
                //   subtitle: Text(juice['price'].toString()),
                // );
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

// class AddToCartButton extends StatefulWidget {
//   const AddToCartButton({Key? key}) : super(key: key);

//   @override
//   State<AddToCartButton> createState() => _AddToCartButtonState();
// }

// class _AddToCartButtonState extends State<AddToCartButton> {
//   int quantity = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//         color: Colors.blue,
//         child: SizedBox(
//           height: 50,
//           width: 100,
//           child: quantity == 0
//               ? TextButton(
//                   child: const Text(
//                     'Add Item',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   onPressed: () {
//                     BlocProvider.of<JuiceBloc>(context)
//                         .add(AddOneToCartEvent(quantity: quantity));
//                   },
//                 )
//               : Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.remove),
//                       onPressed: () {
//                         BlocProvider.of<JuiceBloc>(context)
//                             .add(RemoveOneFromCartEvent(quantity: quantity));
//                       },
//                     ),
//                     Text(quantity.toString()),
//                     IconButton(
//                       icon: const Icon(Icons.add),
//                       onPressed: () {
//                         BlocProvider.of<JuiceBloc>(context)
//                             .add(AddOneToCartEvent(quantity: quantity));
//                       },
//                     ),
//                   ],
//                 ),
//         ));
//   }
// }


//  Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text(
//                             juice['name'],
//                             style: TextStyle(fontSize: 20),
//                           ),
//                           Card(
//                               color: Colors.blue,
//                               child: SizedBox(
//                                 height: 50,
//                                 width: 100,
//                                 child: state.quantity == 0
//                                     ? TextButton(
//                                         child: const Text(
//                                           'Add Item',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         onPressed: () {
//                                           BlocProvider.of<JuiceBloc>(context)
//                                               .add(AddOneToCartEvent());
//                                         },
//                                       )
//                                     : Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           IconButton(
//                                             icon: const Icon(Icons.remove),
//                                             onPressed: () {
//                                               BlocProvider.of<JuiceBloc>(
//                                                       context)
//                                                   .add(
//                                                       RemoveOneFromCartEvent());
//                                             },
//                                           ),
//                                           Text(state.quantity.toString()),
//                                           IconButton(
//                                             icon: const Icon(Icons.add),
//                                             onPressed: () {
//                                               BlocProvider.of<JuiceBloc>(
//                                                       context)
//                                                   .add(AddOneToCartEvent());
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                               )),
//                         ],
//                       ),