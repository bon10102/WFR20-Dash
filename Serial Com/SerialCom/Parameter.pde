public class Parameter<T> {
  char id;
  String label;
  T data;
  private final Class<T> type;

  public Parameter (Class<T> type, char id, String label, T initialData) {
    this.id = id;
    this.label = label;
    data = initialData;
    this.type = type;
  }

  char getIdent() {
    return id;
  }

  String getLabel() {
    return label;
  }

  T getData() {
    return data;
  }
  @SuppressWarnings("unchecked")
    void updateData(String newData) {
    if (type.isAssignableFrom(String.class)) {
      data = (T) newData;
    } else if (type.isAssignableFrom(Integer.class)) {
      data = (T) Integer.valueOf(newData);
    } else if (type.isAssignableFrom(Boolean.class)) {
      data = (T) Boolean.valueOf(newData);
    } else if (type.isAssignableFrom(Float.class)) {
      data = (T) Float.valueOf(newData);
    } else {
      throw new IllegalArgumentException("Bad type.");
    }
  }
}
