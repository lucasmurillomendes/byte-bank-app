class Transfer {
  final double value;
  final int numberAccount;

  Transfer(
    this.value,
    this.numberAccount,
  );

  @override
  String toString() {
    return 'Transfer{value: $value, numberAccount: $numberAccount}';
  }
}
