import 'package: uuid/uuid.dart';


class IdUtil{
    static final Uuid _uuid = Uuid();

    static String generateId() => _uuid.v4();
}