class Phone {
  String _companyName ;
  String _cpu;

  Phone({String companyName = 'Samsung', String? cpu})
      : this._companyName = companyName,
        this._cpu = cpu ?? '';

  String get cpu => _cpu;

  String get companyName => _companyName;
}

