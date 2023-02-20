enum Month {
  january('JANUARY', 'January', 'Январь'),
  february('FEBRUARY', 'February', 'Февраль'),
  march('MARCH', 'March', 'Март'),
  april('APRIL', 'April', 'Апрель'),
  may('MAY', 'May', 'Май'),
  june('JUNE', 'June', 'Июнь'),
  july('JULY', 'July', 'Июль'),
  august('AUGUST', 'August', 'Август'),
  september('SEPTEMBER', 'September', 'Сентябрь'),
  october('OCTOBER', 'October', 'Октябрь'),
  november('NOVEMBER', 'November', 'Ноябрь'),
  december('DECEMBER', 'December', 'Декабрь');

  const Month(this.value, this.enName, this.ruName);

  final String value;
  final String enName;
  final String ruName;
}
