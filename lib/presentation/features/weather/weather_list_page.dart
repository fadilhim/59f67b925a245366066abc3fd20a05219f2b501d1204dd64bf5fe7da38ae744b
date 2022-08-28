import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weather/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather/presentation/routers/router.dart';
import 'package:weather/presentation/widgets/widgets.dart';

class WeatherListPage extends StatefulWidget {
  const WeatherListPage({Key? key}) : super(key: key);

  @override
  State<WeatherListPage> createState() => _WeatherListPageState();
}

class _WeatherListPageState extends State<WeatherListPage> {
  late final RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: () {
          context.read<WeatherBloc>().add(const WeatherEvent.loadWeather());
          _refreshController.refreshCompleted();
        },
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return state.weatherList.when(
              loading: (_) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 12),
                  itemCount: 10,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.grey,
                    );
                  },
                  itemBuilder: (context, index) {
                    return const WeatherLoadingCard();
                  },
                );
              },
              success: (_, __, data) {
                if (data == null) {
                  return const WeatherEmptyWidget();
                }
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 12),
                  itemCount: data.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.grey,
                    );
                  },
                  itemBuilder: (context, index) {
                    return WeatherCard(
                      entity: data[index],
                      onTap: () {
                        AutoRouter.of(context)
                            .push(WeatherDetailRouter(entity: data[index]));
                      },
                    );
                  },
                );
              },
              error: (_, __, ___) {
                return const WeatherErrorWidget();
              },
            );
          },
        ),
      ),
    );
  }
}
