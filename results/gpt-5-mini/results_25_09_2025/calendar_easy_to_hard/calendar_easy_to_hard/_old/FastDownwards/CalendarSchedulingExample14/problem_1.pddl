(define (problem orchestrated-schedule-30min-monday)
  (:domain orchestrated-meeting)

  (:objects
    brandon jerry bradley - participant

    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )

  (:init
    ;; Preferred times according to Brandon's stated preference (>= 14:30)
    (preferred t14_30)
    (preferred t15_00)
    (preferred t15_30)
    (preferred t16_00)
    (preferred t16_30)

    ;; Jerry: all-day free
    (free jerry t09_00) (free jerry t09_30) (free jerry t10_00) (free jerry t10_30)
    (free jerry t11_00) (free jerry t11_30) (free jerry t12_00) (free jerry t12_30)
    (free jerry t13_00) (free jerry t13_30) (free jerry t14_00) (free jerry t14_30)
    (free jerry t15_00) (free jerry t15_30) (free jerry t16_00) (free jerry t16_30)

    ;; Brandon availability (busy: 13:00-14:00 blocks t13_00 and t13_30; busy: 15:30-16:00 blocks t15_30; busy: 16:30-17:00 blocks t16_30)
    (free brandon t09_00) (free brandon t09_30) (free brandon t10_00) (free brandon t10_30)
    (free brandon t11_00) (free brandon t11_30) (free brandon t12_00) (free brandon t12_30)
    (free brandon t14_00) (free brandon t14_30) (free brandon t15_00) (free brandon t16_00)

    ;; Bradley availability (free only at listed slots)
    (free bradley t11_30)
    (free bradley t15_00)
    (free bradley t15_30)
    (free bradley t16_30)
  )

  ;; Goal: schedule exactly one 30-minute meeting (one start slot) that all attend.
  (:goal (meeting-scheduled))
)