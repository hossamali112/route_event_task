import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../data/product_model.dart';
import '../../view_model/ecommerce_cubit.dart';


class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: AppConstants.kPrimaryColor.withOpacity(0.3), width: 2)),
      child: Column(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.topRight,
            width: double.infinity,
            decoration:  BoxDecoration(
                borderRadius:const BorderRadius.only(
                    topRight: Radius.circular(18),
                    topLeft: Radius.circular(18)),
                image: DecorationImage(
                    image: NetworkImage(product.imagePath),
                    fit: BoxFit.fitWidth)),
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  BlocProvider.of<EcommerceCubit>(context).addOrRemoveFaveoriteProduct(product);
                  print(product.productSelected);
                },
                child: CircleAvatar(
                  backgroundColor: product.productSelected ? Colors.red: Colors.white,
                  radius: 16,
                  child: product.productSelected?Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 20,
                  ) : Icon(
                    Icons.favorite_border,
                    color: AppConstants.kPrimaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          )),
          Expanded(
              child: Container(
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child:  Text(
                        product.productTitle,
                        style: TextStyle(
                            fontSize: 14,
                            color: AppConstants.kPrimaryColor,
                            fontWeight: FontWeight.w400),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${product.productPrice}\$',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('${(product.productPrice + ((product.productSale/10)+ product.productPrice)).toStringAsFixed(2)}\$',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: AppConstants.kPrimaryColor
                                      .withOpacity(0.6))),
                          SizedBox(width: 30,)
                        ],
                      ),
                    )),
                Expanded(flex: 3, child: Container(
                  padding:const  EdgeInsets.all(8),
                  child: Row(
                    children: [
                       Text('Review (${product.productRate})', style: TextStyle(
                        fontSize: 12,
                        color: AppConstants.kPrimaryColor,
                        fontWeight: FontWeight.bold

                      ),),
                    const   SizedBox(width: 5,),
                      Image.asset('assets/images/star.png'),
                    const   Spacer(),
                    const   CircleAvatar(
                        child: Icon(Icons.add, color: Colors.white,),
                        radius: 15,
                        backgroundColor: AppConstants.kPrimaryColor,
                      )
                    ],
                  ),
                )),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
