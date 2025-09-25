(define (problem schedule-30min-monday)
  (:domain meeting-scheduling)
  (:objects
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )
  (:init
    (free karen t10_30) (free karen t11_00) (free karen t11_30) (free karen t12_00)
    (free karen t12_30) (free karen t13_00) (free karen t13_30) (free karen t14_00)
    (free karen t14_30) (free karen t15_00) (free karen t15_30) (free karen t16_00)

    (free brandon t09_00) (free brandon t10_00) (free brandon t11_00) (free brandon t12_30)
    (free brandon t13_00) (free brandon t13_30) (free brandon t14_00) (free brandon t14_30)
    (free brandon t15_00) (free brandon t16_00)

    (free donald t10_30) (free donald t14_00)

    (free kelly t09_30) (free kelly t10_00) (free kelly t11_00) (free kelly t12_00)
    (free kelly t12_30) (free kelly t13_00) (free kelly t14_00) (free kelly t15_30)
  )
  (:goal (meeting-scheduled))
)