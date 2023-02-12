(fn nil? [x]
  "Checks if the type of [x] matches nil."
  (= nil x))

(fn str? [x]
  "Checks if the type of [x] matches string."
  (= :string (type x)))

(fn num? [x]
  "Checks if the type of [x] matches number."
  (= :number (type x)))

(fn bool? [x]
  "Checks if the type of [x] matches bool."
  (= :boolean (type x)))

(fn fn? [x]
  "Checks if the type of [x] matches function."
  (= :function (type x)))

(fn tbl? [x]
  "Checks if the type of [x] matches table."
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
