class Common {
  caculateDays(DateTime lovedDate) {
    int loveDays = 0;
    // DateTime lovedDate = DateTime(2024, 7, 31);
    DateTime currentDate = DateTime.now();
    loveDays = currentDate.difference(lovedDate).inDays;
    return loveDays;
  }

  convertDate(DateTime date) {
    String s = "";
    s = s + "${date.day}/${date.month}/${date.year}";
    return s;
  }
}
