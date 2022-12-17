import 'package:flutter/material.dart';

class OverviewMarketDepth extends StatefulWidget {
  const OverviewMarketDepth({super.key});

  @override
  State<OverviewMarketDepth> createState() => _OverviewMarketDepthState();
}

class _OverviewMarketDepthState extends State<OverviewMarketDepth> {
  double totalBid = 0.0;
  double totalOffer = 0.0;
  bool isDataLoading = true;

  @override
  void initState() {
    super.initState();
    // context.read<MarketDepthCubit>().getMarketDepthData();
  }

  @override
  Widget build(BuildContext context) {
    // AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    //
    // return BlocBuilder<MarketDepthCubit, MarketDepthState>(
    //     builder: (context, state) {
    //       if (state is MarketDepthLoadingState) {
    //         const LoadingWidget(
    //           height: 170,
    //         );
    //       }
    //
    //
    //       if (state is MarketDepthDoneState) {
    //
    //         if(state.marketDepthModel != null) {
    //           totalBid = state.marketDepthModel
    //               .map((e) => e.bbuyQty + totalBid)
    //               .first;
    //
    //           totalOffer = state.marketDepthModel
    //               .map((e) => e.bsellQty + totalOffer)
    //               .first;
    //         }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Market Depth"),
        SizedBox(height: 20,),
        // SimpleHeadings(
        //   title: appLocalizations.marketDepth,
        //   onTapFunc: () {},
        //   onTapFunc2: () {},
        //   isUploadVisible: false,
        //   isButtonVisible: false,
        //   margin: const EdgeInsets.symmetric(vertical: 16),
        // ),

        /*const SizedBox(
              height: 12,
            ),*/

        const ArrowLine2(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "Qty",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                ),
              ),
              const Expanded(
                child: Text(
                  "Ord",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                ),
              ),
              const Expanded(
                child: Text(
                  "Bid",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const Expanded(
                child: Text(
                  "Offer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ),
              const Expanded(
                child: Text(
                  "Ord",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                ),
              ),
              const Expanded(
                child: Text(
                  "Qty",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
        ),
        const ArrowLine2(),
        const SizedBox(
          height: 15,
        ),
        Column(
          children: [
            MarketDepthRow(),
            MarketDepthRow(),
            MarketDepthRow(),
            MarketDepthRow(),
            MarketDepthRow(),

          ],
        ),

        const SizedBox(
          height: 8,
        ),
        const ArrowLine2(),
        MarketDepthRow2(
          t1: totalBid.toStringAsFixed(2),
          t2: "Total Bid",
          t3: "Total Offer",
          t4: totalOffer.toStringAsFixed(2),
        ),
      ],
    );
  }
}

class MarketDepthRow2 extends StatelessWidget {
  const MarketDepthRow2({
    super.key,
    required this.t1,
    required this.t2,
    required this.t3,
    required this.t4,
  });

  final String t1;
  final String t2;
  final String t3;
  final String t4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              t1,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              t2,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: 'be_vietnam_pro',
              ),
            ),
          ),
          Expanded(
            child: Text(
              t3,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: 'be_vietnam_pro',
              ),
            ),
          ),
          Expanded(
            child: Text(
              t4,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: 'be_vietnam_pro',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MarketDepthRow extends StatelessWidget {
  // final MarketDepthModel marketDepth;
  // const MarketDepthRow({
  //   super.key,
  //   required this.marketDepth,
  // });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '-',
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w400,
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '-',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w400,
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '-',
              //'1643.50',
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w400,
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              '-',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w400,
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '-',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w400,
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '-',
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w400,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArrowLine2 extends StatelessWidget {
  const ArrowLine2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.2,
      color: const Color(0xff969ba1).withOpacity(0.2),
    );
  }
}
