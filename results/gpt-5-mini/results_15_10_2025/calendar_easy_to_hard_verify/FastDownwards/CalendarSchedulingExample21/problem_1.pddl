(define (problem schedule-single-meeting)
  (:domain meeting-schedule)
  (:objects
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - timeslot
  )

  (:init
    ;; Availability derived from provided busy intervals (only explicit busy intervals were treated as unavailable).
    ;; sara: "I have no meetings on Monday between 09:00 and 17:00" -> all slots free
    (free sara t09_00) (free sara t09_30) (free sara t10_00) (free sara t10_30)
    (free sara t11_00) (free sara t11_30) (free sara t12_00) (free sara t12_30)
    (free sara t13_00) (free sara t13_30) (free sara t14_00) (free sara t14_30)
    (free sara t15_00) (free sara t15_30) (free sara t16_00) (free sara t16_30)

    ;; sarah: busy 12:00-12:30 and 15:00-15:30 -> those start slots unavailable
    (free sarah t09_00) (free sarah t09_30) (free sarah t10_00) (free sarah t10_30)
    (free sarah t11_00) (free sarah t11_30) (free sarah t12_30)
    (free sarah t13_00) (free sarah t13_30) (free sarah t14_00) (free sarah t14_30)
    (free sarah t15_30) (free sarah t16_00) (free sarah t16_30)

    ;; shirley: busy 13:30-14:00 and 14:30-15:00 -> those start slots unavailable
    (free shirley t09_00) (free shirley t09_30) (free shirley t10_00) (free shirley t10_30)
    (free shirley t11_00) (free shirley t11_30) (free shirley t12_00) (free shirley t12_30)
    (free shirley t13_00) (free shirley t14_00) (free shirley t15_00)
    (free shirley t15_30) (free shirley t16_00) (free shirley t16_30)

    ;; harold: busy 09:00-10:00, 10:30-12:30, 13:00-17:00 -> available only at 10:00-10:30
    (free harold t10_00)

    ;; terry: busy 09:00-10:00, 10:30-11:30, 12:00-17:00 -> available at 10:00-10:30 and 11:30-12:00
    (free terry t10_00) (free terry t11_30)
  )

  (:goal (scheduled))
)