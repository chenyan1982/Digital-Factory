import 'package:supabase_flutter/supabase_flutter.dart';

export 'database/database.dart';
export 'storage/storage.dart';

const _kSupabaseUrl = 'https://jftuaailmarskealdrmx.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpmdHVhYWlsbWFyc2tlYWxkcm14Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE2MTE4NDUsImV4cCI6MTk4NzE4Nzg0NX0.u8OBwaxWmVPkx0KsqK4OBZL7XMS909RCPlrZdqPCXyY';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
      );
}
