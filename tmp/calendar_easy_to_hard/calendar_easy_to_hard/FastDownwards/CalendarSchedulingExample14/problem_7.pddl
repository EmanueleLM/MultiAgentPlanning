(define (problem schedule-30min-monday)
  (:domain meeting-scheduling)
  (:objects
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )
  (:init
    ;; Karen busy 09:00-10:30 and 16:30-17:00 -> free starts at:
    (free karen t10_30) (free karen t11_00) (free karen t11_30) (free karen t12_00)
    (free karen t12_30) (free karen t13_00) (free karen t13_30) (free karen t14_00)
    (free karen t14_30) (free karen t15_00) (free karen t15_30) (free karen t16_00)

    ;; Brandon busy 09:30-10:00,10:30-11:00,11:30-12:30,15:30-16:00,16:30-17:00 -> free starts:
    (free brandon t09_00) (free brandon t10_00) (free brandon t11_00) (free brandon t12_30)
    (free brandon t13_00) (free brandon t13_30) (free brandon t14_00) (free brandon t14_30)
    (free brandon t15_00) (free brandon t16_00)

    ;; Donald busy 09:00-10:30,11:00-14:00,14:30-17:00 -> free starts:
    (free donald t10_30) (free donald t14_00)

    ;; Kelly busy 09:00-09:30,10:30-11:00,11:30-12:00,13:30-14:00,14:30-15:30,16:00-17:00 -> free starts:
    (free kelly t09_30) (free kelly t10_00) (free kelly t11_00) (free kelly t12_00)
    (free kelly t12_30) (free kelly t13_00) (free kelly t14_00) (free kelly t15_30)
  )
  (:goal (meeting-scheduled))
)