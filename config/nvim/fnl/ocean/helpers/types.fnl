(fn nil? [x]
  "Checks if `x` is an empty reference."
  (= x nil))

(fn str? [x]
  "Checks if `x` is a string definition."
  (= :string (type x)))

(fn num? [x]
  "Checks if `x` is a number definition."
  (= :number (type x)))

(fn bool? [x]
  "Checks if `x` is a boolean definition."
  (= :boolean (type x)))

(fn fn? [x]
  "Checks if `x` is a function definition."
  (= :function (type x)))

(fn tbl? [x]
  "Checks if `x` is a table definition."
  (= :table (type x)))

(fn ->str [x]
  "Converts [x] into a string."
  (tostring x))

(fn ->bool [x]
  "Converts [x] into a boolean type."
  (if x true false))

{: nil?
 : str?
 : num?
 : bool?
 : fn?
 : tbl?
 : ->str
 : ->bool}
