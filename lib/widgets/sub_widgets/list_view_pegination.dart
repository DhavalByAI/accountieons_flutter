// ignore_for_file: non_constant_identifier_names
import 'package:accountieons_flutter/utils/app_colors.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/ctext.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'c_card.dart';
import 'ctextfield_common.dart';

Widget ListViewPagination({
  Widget? cAppBar,
  // required Widget child,
  required RefreshController controller,
  ScrollController? scrollController,
  Function()? onLoad,
  bool? enablePullUp,
  Function()? onRefresh,
  List? data,
  required Widget? Function(int index)? child,
}) {
  return SmartRefresher(
    controller: controller,
    scrollController: scrollController,
    header: BezierHeader(
      bezierColor: AppColors.mainColor,
      child: const Center(
        child: Icon(
          Icons.rocket,
          size: 62,
          color: Colors.white,
        ),
      ),
    ),
    onLoading: () {
      onLoad != null ? onLoad() : null;
      controller.loadComplete();
      controller.refreshCompleted();
    },
    onRefresh: () {
      onRefresh != null ? onRefresh() : null;
      controller.refreshCompleted();
      controller.loadComplete();
    },
    enablePullUp: enablePullUp ?? true,
    primary: false,
    child: Stack(
      children: [
        cAppBar ?? const SizedBox(),
        Padding(
          padding: const EdgeInsets.all(20).copyWith(top: 95),
          child: cCard(
              height: 45,
              color: Colors.black12,
              radius: 25,
              child: Row(
                children: [
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: cTextFieldCommon(
                      fontColor: Colors.black,
                      maxLines: 1,
                      fontSize: 16,
                      cursorColor: Colors.black,
                      hintTextColor: Colors.black45,
                      hint: 'Search',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Image.asset(
                      'assets/icons/search.png',
                      height: 22,
                    ),
                  ),
                ],
              )),
        ),
        data != null && data.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(20).copyWith(top: 65 + 95),
                child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return child!(index);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 12);
                    },
                    itemCount: data.length),
              )
            : Center(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/empty.gif'),
                  const SizedBox(
                    height: 12,
                  ),
                  ctext('Data Not Found', fontSize: 14),
                ],
              ))
      ],
    ),
  );
}
