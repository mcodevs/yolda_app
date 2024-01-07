enum LocationState {
  fixed,
  notFixed,
  tracked;

  T map<T>({
    required T Function() onFixed,
    required T Function() onNotFixed,
    required T Function() onTracked,
  }) {
    return switch(name){
      "fixed" => onFixed(),
      "notFixed" => onNotFixed(),
      "tracked" => onTracked(),
     _ => onFixed(),
    };
  }
}
