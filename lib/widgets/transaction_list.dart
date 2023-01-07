import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No tranactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return
                  // Using ListTyle approach
                  Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).errorColor, // Text Color
                          ),
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          onPressed: () => deleteTx(transactions[index].id),
                        )
                      : IconButton(
                          color: Theme.of(context).errorColor,
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                ),
              );

              // Using Card approach
              // Card(
              //     child: Row(
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.all(10),
              //       margin: const EdgeInsets.symmetric(
              //         vertical: 10,
              //         horizontal: 15,
              //       ),
              //       decoration: BoxDecoration(
              //           border: Border.all(
              //         // color: Colors.red,
              //         color: Theme.of(context).primaryColor,
              //         width: 2,
              //       )),
              //       child: Text(
              //         // tx.amount.toString(),
              //         '\$${transactions[index].amount.toStringAsFixed(2)}', // string interpolation
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //             color: Theme.of(context).primaryColor),
              //       ),
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           transactions[index].title,
              //           style: Theme.of(context).textTheme.headline6,

              //           // here above we are refering to app bar title theme
              //           // style: Theme.of(context).appBarTheme.titleTextStyle

              //           // style: const TextStyle(
              //           //   fontWeight: FontWeight.bold,
              //           //   fontSize: 16,
              //           // ),
              //         ),
              //         Text(
              //           DateFormat.yMMMd().format(transactions[index].date),
              //           style:
              //               const TextStyle(fontSize: 16, color: Colors.grey),
              //         ),
              //       ],
              //     )
              //   ],
              // ));
            },
            itemCount: transactions.length,
          );

    // using ListView(Children: []) approach
    // child: ListView(
    //   children: transactions.map((tx) {
    //     return Card(
    //         child: Row(
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.all(10),
    //           margin: const EdgeInsets.symmetric(
    //             vertical: 10,
    //             horizontal: 15,
    //           ),
    //           decoration: BoxDecoration(
    //               border: Border.all(
    //             color: Colors.purple,
    //             width: 2,
    //           )),
    //           child: Text(
    //             // tx.amount.toString(),
    //             '\$${tx.amount}', // string interpolation
    //             style: const TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 20,
    //                 color: Colors.purple),
    //           ),
    //         ),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               tx.title,
    //               style: const TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 18,
    //               ),
    //             ),
    //             Text(
    //               DateFormat.yMMMd().format(tx.date),
    //               style: const TextStyle(fontSize: 16, color: Colors.grey),
    //             ),
    //           ],
    //         )
    //       ],
    //     ));
    //   }).toList(),
    // ),
  }
}
