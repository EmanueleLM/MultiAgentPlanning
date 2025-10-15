(define (problem CalendarSchedulingExample49-prob)
  (:domain calendar-scheduling)
  (:objects
    alan mason dennis theresa brenda juan angela - participant
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )
  (:init
    ;; alan availability
    (available alan t09_30) (available alan t11_00) (available alan t12_00) (available alan t12_30)
    (available alan t13_00) (available alan t13_30) (available alan t14_00) (available alan t14_30)
    (available alan t15_00) (available alan t15_30) (available alan t16_00) (available alan t16_30)

    ;; mason availability (prefers not after 14:00; penalized times marked below)
    (available mason t09_00) (available mason t09_30) (available mason t10_00) (available mason t10_30)
    (available mason t11_00) (available mason t11_30) (available mason t12_00) (available mason t12_30)
    (available mason t13_00) (available mason t14_00) (available mason t14_30) (available mason t15_00)
    (available mason t15_30) (available mason t16_00)

    ;; dennis availability
    (available dennis t09_30) (available dennis t10_00) (available dennis t10_30) (available dennis t11_00)
    (available dennis t11_30) (available dennis t12_00) (available dennis t12_30) (available dennis t13_00)
    (available dennis t13_30) (available dennis t14_00) (available dennis t15_00) (available dennis t15_30)
    (available dennis t16_00) (available dennis t16_30)

    ;; theresa availability (free entire day)
    (available theresa t09_00) (available theresa t09_30) (available theresa t10_00) (available theresa t10_30)
    (available theresa t11_00) (available theresa t11_30) (available theresa t12_00) (available theresa t12_30)
    (available theresa t13_00) (available theresa t13_30) (available theresa t14_00) (available theresa t14_30)
    (available theresa t15_00) (available theresa t15_30) (available theresa t16_00) (available theresa t16_30)

    ;; brenda availability
    (available brenda t09_00) (available brenda t09_30) (available brenda t10_00)
    (available brenda t11_00) (available brenda t11_30) (available brenda t13_30)
    (available brenda t14_00) (available brenda t15_30)

    ;; juan availability
    (available juan t09_00) (available juan t10_00) (available juan t11_00)
    (available juan t13_00) (available juan t13_30) (available juan t14_00)
    (available juan t15_00) (available juan t15_30)

    ;; angela availability
    (available angela t10_00) (available angela t11_00) (available angela t12_00) (available angela t12_30)
    (available angela t14_00) (available angela t14_30) (available angela t15_30) (available angela t16_00)

    ;; penalized times for mason preference "prefers not to meet after 14:00" (starts at 14:30 and later)
    (penalized t14_30) (penalized t15_00) (penalized t15_30) (penalized t16_00) (penalized t16_30)

    ;; initial cost
    (= (total-cost) 0)
  )
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)