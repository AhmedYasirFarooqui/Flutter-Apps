import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/add_expens.dart';

class ShowData extends StatelessWidget {
  const ShowData({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final controller = Provider.of<AddExpenseController>(context);
    ('build show data');
    return controller.data!.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemCount: controller.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Consumer<AddExpenseController>(
                          builder: (context, value, child) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              width: width * 0.15,
                              height: height * 0.15,
                              child:
                                  value.data![index].typeOfAmount == 'Expenses'
                                      ? const Icon(
                                          Icons.arrow_back,
                                          color: Colors.red,
                                          size: 25.0,
                                        )
                                      : const Icon(
                                          Icons.arrow_forward,
                                          color: Colors.green,
                                          size: 25.0,
                                        ),
                            );
                          },
                        ),
                        SizedBox(
                          width: width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Consumer<AddExpenseController>(
                                builder: (context, value, child) {
                                  return Text(
                                    value.data![index].title!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 4.0),
                              Consumer<AddExpenseController>(
                                builder: (context, value, child) {
                                  return Text(
                                    value.data![index].description!,
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 2.0),
                              Consumer<AddExpenseController>(
                                builder: (context, value, child) {
                                  return Text(
                                    '${value.data![index].selectedDate!} at ${value.data![index].selectedTime!}',
                                    style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 12.0,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.2,
                          child: Center(
                            child: Consumer<AddExpenseController>(
                              builder: (context, value, child) {
                                return Text(
                                  value.data![index].amount!.toString(),
                                  softWrap: true,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : const Center(
            child: Text(
              'Nothing to show.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          );
  }
}
