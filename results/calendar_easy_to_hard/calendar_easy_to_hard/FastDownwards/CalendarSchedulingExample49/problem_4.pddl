(define (problem CalendarSchedulingExample49-prob)
  (:domain calendar-scheduling)
  (:objects
    alan mason dennis theresa brenda juan angela - participant
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )
  (:init
    (valid-start t09_00) (valid-start t09_30) (valid-start t10_00) (valid-start t10_30)
    (valid-start t11_00) (valid-start t11_30) (valid-start t12_00) (valid-start t12_30)
    (valid-start t13_00) (valid-start t13_30) (valid-start t14_00) (valid-start t14_30)
    (valid-start t15_00) (valid-start t15_30) (valid-start t16_00) (valid-start t16_30)

    (available alan t09_30) (available alan t11_00) (available alan t12_00) (available alan t12_30)
    (available alan t13_00) (available alan t13_30) (available alan t14_00) (available alan t14_30)
    (available alan t15_00) (available alan t15_30) (available alan t16_00) (available alan t16_30)

    (available mason t09_00) (available mason t09_30) (available mason t10_00) (available mason t10_30)
    (available mason t11_00) (available mason t11_30) (available mason t12_00) (available mason t12_30)
    (available mason t13_00) (available mason t14_00) (available mason t14_30) (available mason t15_00)
    (available mason t15_30) (available mason t16_00)

    (available dennis t09_30) (available dennis t10_00) (available dennis t10_30) (available dennis t11_00)
    (available dennis t11_30) (available dennis t12_00) (available dennis t12_30) (available dennis t13_00)
    (available dennis t13_30) (available dennis t14_00) (available dennis t15_00) (available dennis t15_30)
    (available dennis t16_00) (available dennis t16_30)

    (available theresa t09_00) (available theresa t09_30) (available theresa t10_00) (available theresa t10_30)
    (available theresa t11_00) (available theresa t11_30) (available theresa t12_00) (available theresa t12_30)
    (available theresa t13_00) (available theresa t13_30) (available theresa t14_00) (available theresa t14_30)
    (available theresa t15_00) (available theresa t15_30) (available theresa t16_00) (available theresa t16_30)

    (available brenda t09_00) (available brenda t09_30) (available brenda t10_00)
    (available brenda t11_00) (available brenda t11_30) (available brenda t13_30)
    (available brenda t14_00) (available brenda t15_30)

    (available juan t09_00) (available juan t10_00) (available juan t11_00)
    (available juan t13_00) (available juan t13_30) (available juan t14_00)
    (available juan t15_00) (available juan t15_30)

    (available angela t10_00) (available angela t11_00) (available angela t12_00) (available angela t12_30)
    (available angela t14_00) (available angela t14_30) (available angela t15_30) (available angela t16_00)

    (penalized t14_30) (penalized t15_00) (penalized t15_30) (penalized t16_00) (penalized t16_30)

    (= (total-cost) 0)
  )
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)