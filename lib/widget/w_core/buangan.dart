String validate(value) {
  if (value.isEmpty) {
    return "Field tidak boleh kosong";
  } else {
    return null;
  }
}
