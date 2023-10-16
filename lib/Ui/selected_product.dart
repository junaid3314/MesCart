import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Bloc/addtoCart/addto_cart_bloc.dart';
import 'package:mes_kart/Bloc/getAproduct/get_aproduct_bloc.dart';
import 'package:mes_kart/Ui/cart.dart';


import '../Repository/modelclass/getAproductModelclass.dart';
import 'Widget/selected_product_slider.dart';

import 'order_summary.dart';

class SelectedProduct extends StatefulWidget {
  final String productId;

  const SelectedProduct({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<SelectedProduct> createState() => _SelectedProductState();
}

late GetAproductModelclass GetProduct;

TextEditingController count = TextEditingController(text: '1');

class _SelectedProductState extends State<SelectedProduct> {
  static int index = 0;

  @override
  void initState() {
    BlocProvider.of<GetAproductBloc>(context).add(FetchGetaProdcuct(ProductId: widget.productId.toString()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: BlocBuilder<GetAproductBloc, GetAproductState>(
            builder: (context, state) {
          if (state is GetAproductBlocLoading) {
            return CircularProgressIndicator();
          }
          if (state is GetAproductBlocError) {
            return Center(child: Text("Error"));
          }

          if (state is GetAproductBlocLoaded) {
            GetProduct =
                BlocProvider.of<GetAproductBloc>(context).getAproductModelclass;

            return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: mwidth,
                    height: mheight * 0.335,
                    child: Selected_Product_Slider(getAproduct:GetProduct),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.038),
                    child: SizedBox(
                        width: mwidth * 0.98,
                        child: Text(
                            GetProduct.data!.name.toString(),
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            height: 0.70.h,
                          )),
                        )),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.038),
                    child: Text(
                      'Paint World',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        color: Color(0xFF79747E),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.h,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: mwidth * 0.04, top: mheight * 0.014),
                    child: Row(
                      children: [
                        Text(
                    GetProduct.data!.price.toString(),
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            height: 0.67,
                          )),
                        ),
                        SizedBox(
                          width: mwidth * 0.03,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color(0xffF0F0F0),
                  ),
                  SizedBox(
                    height: mheight * 0.012,
                  ),
                  Center(
                    child: SizedBox(
                      width: mwidth * 0.512,
                      height: mheight * 0.05,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (int.parse(count.text) > 1) {
                                count.text =
                                    (int.parse(count.text) - 1).toString();
                              }
                            },
                            child: Container(
                              width: mwidth * 0.12,
                              height: mheight * 0.05,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      color: const Color(0xffEEEEEE))),
                              child: const Center(
                                child: Icon(
                                  Icons.horizontal_rule_rounded,
                                  color: Color(0xff929292),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: mwidth * 0.02,
                          ),
                          Container(
                            width: mwidth * 0.23,
                            height: mheight * 0.05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                border:
                                    Border.all(color: const Color(0xffEEEEEE))),
                            child: Center(
                                child: TextFormField(
                              style: const TextStyle(color: Color(0xff929292)),
                              controller: count,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Color(0xff929292),
                                      fontSize: 13.5)),
                            )),
                          ),
                          SizedBox(
                            width: mwidth * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              count.text =
                                  (int.parse(count.text) + 1).toString();
                            },
                            child: Container(
                              width: mwidth * 0.12,
                              height: mheight * 0.05,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      color: const Color(0xffEEEEEE))),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xff929292),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.03,
                  ),
                  Center(
                    child: SizedBox(
                      width: 324.w,
                      height: 130.h,
                      child: Text(
                        GetProduct.data!.description.toString(),
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.50.h,
                          ),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ),
                  ),
                  Center(
                    child: BlocListener<AddtoCartBloc, AddtoCartState>(
                      listener: (context, state) {
                        if (state is AddtoCartBlocLoading) {
                          print("loading");
                          showDialog(
                              context: context,
                              builder: (BuildContext a) => const Center(
                                  child: CircularProgressIndicator()));
                        }
                        if (state is AddtoCartBlocLoaded) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Item added to cart'),
                            action: SnackBarAction(
                                label: 'Go To Cart',
                                textColor: Colors.orange,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => CartPage()));
                                }),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(bottom: mheight * 0.02),
                          ));
                          Navigator.of(context).pop();
                          print("loaded");
                        }
                        if (state is AddtoCartBlocError) {
                          print("error");
                        }
                      },
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<AddtoCartBloc>(context)
                              .add(FetchAddtoCart(
                            productId: widget.productId,
                            quantity: int.parse(count.text),
                          ));
                        },
                        child: Container(
                            margin: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                top: 6.h,
                                bottom: 13.h),
                            width: 335.w,
                            height: 60.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xff264050),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r)),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F303030),
                                  blurRadius: 20.r,
                                  offset: Offset(0, 10),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'ADD TO CART',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.5.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) =>OrderSummary(Product: GetProduct,index: index, quantity: int.parse(count.text),))),
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 20.w, right: 20.w, bottom: 35.h),
                          width: 335.w,
                          height: 60.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF4400),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F303030),
                                blurRadius: 20.r,
                                offset: Offset(0, 10),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'BUY NOW',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.5.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ]));
          } else {
            return SizedBox();
          }
        })));
  }
}
