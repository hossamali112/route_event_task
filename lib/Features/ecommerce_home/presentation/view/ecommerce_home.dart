import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_event_task/Features/ecommerce_home/presentation/view/widgets/custom_product_card.dart';


import '../../../../core/constants.dart';
import '../../../../core/main_widgets/custom_text_form field.dart';
import '../view_model/ecommerce_cubit.dart';

class products_grid_view extends StatefulWidget {
  const products_grid_view({super.key});

  @override
  State<products_grid_view> createState() => _products_grid_viewState();
}

class _products_grid_viewState extends State<products_grid_view> with TickerProviderStateMixin {
  late TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<EcommerceCubit>(context).getAllProducts();

    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<EcommerceCubit, EcommerceState>(
  builder: (context, state) {
    if(state is ProductsSuccess|| state is ProductsUpdate){
      return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            title: Image.asset(
              'assets/images/logo.png',
              width: 60,
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child:CustomTextFormField(
                        hintText: 'What Do You Search For?',
                        preIcon: Icons.search,
                        MyController: searchController,
                      ),
                    ),
                    Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.shopping_cart_checkout, color: AppConstants.kPrimaryColor,size: 30,),
                          onPressed: () {},
                        ))
                  ],
                ),
              )),

          SliverPadding(

            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            sliver: SliverGrid(delegate: SliverChildBuilderDelegate((context, index) {
              return  CustomProductCard(product: BlocProvider.of<EcommerceCubit>(context).allProducts[index],);
            },
                childCount: BlocProvider.of<EcommerceCubit>(context).allProducts.length,
            ), gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent:191,
                childAspectRatio:
                191/237,
                crossAxisSpacing: 10,mainAxisSpacing: 10)),
          )
        ],
      );
    }else if( state is ProductsFailiure){
      return Center(child: Icon(Icons.not_interested, size: 100,),);
    }else{
      return Center(child: CircularProgressIndicator(),);
    }
  },
));
  }
}
