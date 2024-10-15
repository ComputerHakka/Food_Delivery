part of 'cart_screen.dart';

class _CartItemCell extends StatelessWidget {
  const _CartItemCell({super.key, required this.item, required this.count});

  final MenuEntity item;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Ink(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              offset: Offset(0.0, 5.5),
            )
          ],
        ),
        child: Row(
          children: [
            _CartItemImageWidget(item: item),
            const SizedBox(width: 16),
            _CartItemMainInfoWidget(count: count, item: item),
          ],
        ),
      ),
    );
  }
}

class _CartItemImageWidget extends StatelessWidget {
  const _CartItemImageWidget({
    super.key,
    required this.item,
  });

  final MenuEntity item;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              item.images!.first,
            ),
          ),
        ),
      ),
    );
  }
}

class _CartItemMainInfoWidget extends StatelessWidget {
  const _CartItemMainInfoWidget(
      {super.key, required this.item, required this.count});

  final MenuEntity item;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.name.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${(item.cost * count).toString()} ₽',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Ink(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: unselectedItemColor,
                    width: 1,
                  ),
                ),
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<CartBloc>(context)
                                  .add(RemoveProductEvent(menu: item));
                            },
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(10)),
                            child: const SizedBox(
                              height: double.infinity,
                              child: Icon(
                                Icons.remove,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Text(
                              state.cartItems[item].toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<CartBloc>(context)
                                  .add(AddProductEvent(menu: item));
                            },
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(10)),
                            child: const SizedBox(
                              height: double.infinity,
                              child: Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
