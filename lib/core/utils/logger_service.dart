import 'package:logging/logging.dart';
import 'package:get_it/get_it.dart';

class LoggerService {
  final Logger _logger;

  LoggerService(String name) : _logger = Logger(name);

  void info(String message) {
    _logger.info(message);
  }

  void warning(String message) {
    _logger.warning(message);
  }

  void severe(String message) {
    _logger.severe(message);
  }

  void fine(String message) {
    _logger.fine(message);
  }



  static void setupLogging() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print(
          '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
    });
  }
}

void setupLoggerService() {
  GetIt.I.registerFactoryParam<LoggerService, String, void>(
    (name, _) => LoggerService(name),
  );
}
