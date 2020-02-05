private class Parameter<T> {
  char id;
  String label;
  T data;
  
  private Parameter (char ident, String name, T initialValue) {
    id = ident;
    label = name;
    data = initialValue;
  }

  char getIdent() {
    return id;
  }

  String getLabel() {
    return label+ ": ";
  }
  
  T getData() {
    return data;
  }

  void updateData(T newData) {
    data = newData;
  }
}
