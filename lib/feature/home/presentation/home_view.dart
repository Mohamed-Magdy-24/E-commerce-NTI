import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/api/api_helper.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';

import 'package:ntigradproject/core/utils/app_image.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/feature/home/data/repositories/repo_best_seller/repo_impl.dart';
import 'package:ntigradproject/feature/home/data/service/best_seller_service.dart';
import 'package:ntigradproject/feature/home/manage/bestsellerproduct/bestsellerproduct_cubit.dart';
import 'package:ntigradproject/feature/home/presentation/categories_views.dart';
import 'package:ntigradproject/feature/home/presentation/widget/carouser.dart';
import 'package:ntigradproject/feature/home/presentation/widget/item_card.dart';
import 'package:ntigradproject/feature/home/presentation/widget/slider_card.dart';

class FinalHomeView extends StatelessWidget {
  const FinalHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  bottomNavigationBar: TestView(),
      backgroundColor: MyColors.specialbackground,
      appBar: AppBar(
        centerTitle: true,

        backgroundColor: MyColors.white,
        title: SvgPicture.asset(AppIcon.homelogo),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 40,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MyColors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: SvgPicture.asset(AppIcon.search),
                    hintText: 'Search any Product',
                    hintStyle: TextStyle(
                      color: MyColors.gray1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  textDirection: TextDirection.ltr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text(
                  AppString.allfeatured,
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 25),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BlocProvider(
                          create:
                              (context) => BestsellerproductCubit(
                                RepoImpl(
                                  bestSellerService: BestSellerService(
                                    ApiHelper(),
                                  ),
                                )..getHomeData(),
                              ),
                          child: BlocBuilder<
                            BestsellerproductCubit,
                            BestsellerproductState
                          >(
                            builder: (context, state) {
                              if (state is BestsellerproductLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is BestsellerproductFailure) {
                                return Center(
                                  child: Text("❌ خطأ: ${state.errMessage}"),
                                );
                              } else if (state is BestsellerproductSuccess) {
                                return ListView.builder(
                                  itemCount:
                                      state
                                          .bestSeller
                                          .bestSellerProducts!
                                          .length,
                                  itemBuilder: (context, index) {
                                    final categiry =
                                        state
                                            .bestSeller
                                            .bestSellerProducts![index];
                                    return Container(
                                      color: Colors.amber,
                                      child: CategoryView(
                                        categorytext: categiry.price.toString(),
                                        image: categiry.imagePath.toString(),
                                      ),
                                    );
                                  },
                                );
                              }

                              return SizedBox();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Carouser(),

              Center(child: DotsIndicator(dotsCount: 3)),
              Text(
                AppString.recommended,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(child: Row(children: [ItemCard(), ItemCard()])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
