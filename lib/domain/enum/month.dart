enum Month {
  january('JANUARY', "Январь"),
  february('FEBRUARY', "Февраль"),
  march('MARCH', "Март"),
  april('APRIL', "Апрель"),
  june('JUNE', "Июнь"),
  july('JULY', "Июль"),
  august('AUGUST', "Август"),
  september('SEPTEMBER', "Сентябрь"),
  october('OCTOBER', "Октябрь"),
  november('NOVEMBER', "Ноябрь"),
  december('DECEMBER', "Декабрь");

  final String enName;
  final String ruName;

  const Month(this.enName, this.ruName);
}
