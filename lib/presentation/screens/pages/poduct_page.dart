
import 'package:ecommerce_app/presentation/screens/pages/product_bloc/product_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/product_bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc,ProductState>(
        builder: (_,state){
          if(state is PLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is PErrorState){
            return Center(child: Text(state.msg),);
          }else if(state is PLoadedState){
            return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.dataModel.data!.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220,
                  childAspectRatio: 10/16,
                ),
                itemBuilder: (_, index){
                  var  mData=state.dataModel.data![index];
                  return Container(
                    width: 300,
                    height: 300,
                    margin: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.grey.shade300,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.network('${mData.image}',),
                              Text('${mData.name}',textAlign: TextAlign.start,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${mData.price}'),
                                  Row(children: List.generate(4, (index){
                                    if(index==3){
                                      return Container(
                                        width: 20,height: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle,
                                            border: Border.all()
                                        ),
                                        child: Center(child: Text('+2'),),
                                      );
                                    }else{
                                      return Container(
                                        width: 20,height: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            shape: BoxShape.circle,
                                            border: Border.all()
                                        ),
                                      );
                                    }
                                  })
                                    ,)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 48,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(21),
                                  bottomLeft: Radius.circular(22)),
                              color: Colors.orange.shade700,
                            ),

                            child: Center(
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ),
                        ),

                      ],
                    ),
                  );});

          }
          return Container();
        },
      ),
    );
  }
}