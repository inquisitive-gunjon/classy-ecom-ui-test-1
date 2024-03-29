import 'package:classy_e_com_demo_test_ui_1/core/model/cart_model.dart';
import 'package:classy_e_com_demo_test_ui_1/core/model/wishlist_model.dart';
import 'package:classy_e_com_demo_test_ui_1/ui/signin_and_registration_module_pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  int countSet = 1;

  @override
  Widget build(BuildContext context) {
    final cartControll=Provider.of<CartModel>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .6,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: CartModel.list.length,
              //itemExtent: 100,
              itemBuilder: (context, index) {

                CartModel item = CartModel.list[index];
                int itemCount = item.count!;

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        leading: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: 100,
                          child: Image.asset(
                            item.imageUrl.toString(),
                          ),
                        ),
                        title: Text(
                          item.productName.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        subtitle: Text(
                          item.productPrice.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: IconButton(
                                iconSize: 15,
                                onPressed: () {
                                  cartControll.deleteList(index);
                                  print("Closed>>>>>>>>>>>");
                                },
                                icon: Icon(
                                  FontAwesomeIcons.timesCircle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              width: 100,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        //count.updateCount(index, countSet++);
                                        cartControll.addCount(index);
                                        //itemCount= itemCount+1;
                                        print(cartControll.getcount(index));
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Center(child: Text("+")),
                                    ),
                                  ),
                                  Text(
                                    //itemCount.toString(),
                                    cartControll.getcount(index).toString()
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if(itemCount>1){
                                        // int value=count.getcount(index)!.toInt();
                                        // count.updateCount(index, countSet--);
                                        // print(count.getcount(index));
                                        setState(() {
                                          // int? value=count.getcount(index);
                                          // count.updateCount(index, value!);
                                          // print(count.getcount(index));
                                          //itemCount= itemCount-1;
                                          cartControll.subCount(index);
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset:
                                            Offset(0, 1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Center(child: Text("-")),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 7,
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter your promo code",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color(0xffFF6000),
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total:"),
                  Text("\$" + "1241"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffFF6000),
                ),
                onPressed: () {//SplashScreen
                  cartControll.addCartList();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (Context) => SplashScreen()));
                },
                child: Text(
                  "Check Out",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
