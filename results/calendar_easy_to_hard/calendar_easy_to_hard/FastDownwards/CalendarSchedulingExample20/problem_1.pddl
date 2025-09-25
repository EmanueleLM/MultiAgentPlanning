(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - slot
  )

  (:init
    (available-ralph t09_00) (available-ralph t09_30) (available-ralph t10_00) (available-ralph t10_30)
    (available-ralph t11_00) (available-ralph t11_30) (available-ralph t12_00) (available-ralph t12_30)
    (available-ralph t13_00) (available-ralph t14_00)
    (available-ralph t15_00) (available-ralph t15_30) (available-ralph t16_00) (available-ralph t16_30)

    (available-peter t09_30) (available-peter t10_00) (available-peter t10_30) (available-peter t13_00) (available-peter t13_30)
    (available-peter t14_00) (available-peter t14_30) (available-peter t15_00) (available-peter t15_30) (available-peter t16_30)

    (available-daniel t10_00) (available-daniel t15_30)

    (after-preferred t14_00) (after-preferred t14_30) (after-preferred t15_00)
    (after-preferred t15_30) (after-preferred t16_00) (after-preferred t16_30)

    (= (total-cost) 0)
  )

  (:metric minimize (total-cost))

  (:goal (meeting-scheduled))
)