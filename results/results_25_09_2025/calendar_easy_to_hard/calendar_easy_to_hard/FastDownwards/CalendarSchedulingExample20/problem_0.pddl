(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - slot
  )

  (:init
    ;; Ralph availability (busy: 13:30-14:00 -> t13_30 ; 14:30-15:00 -> t14_30)
    (available-ralph t09_00) (available-ralph t09_30) (available-ralph t10_00) (available-ralph t10_30)
    (available-ralph t11_00) (available-ralph t11_30) (available-ralph t12_00) (available-ralph t12_30)
    (available-ralph t13_00)                         (available-ralph t14_00)
    (available-ralph t15_00) (available-ralph t15_30) (available-ralph t16_00) (available-ralph t16_30)

    ;; Peter availability (busy: 09:00-09:30 -> t09_00 ; 11:00-13:00 -> t11_00,t11_30,t12_00,t12_30 ; 16:00-16:30 -> t16_00)
    (available-peter t09_30) (available-peter t10_00) (available-peter t10_30)
                         (available-peter t13_00) (available-peter t13_30)
    (available-peter t14_00) (available-peter t14_30) (available-peter t15_00) (available-peter t15_30) (available-peter t16_30)

    ;; Daniel availability (busy: 09:00-10:00 -> t09_00,t09_30 ; 10:30-15:30 -> t10_30..t15_00 ; 16:00-17:00 -> t16_00)
    ;; After calculating overlaps, Daniel is available only at t10_00 and t15_30 in the given data.
    (available-daniel t10_00) (available-daniel t15_30)

    ;; Slots Daniel prefers to avoid (start >= 14:00). If a meeting is scheduled at these slots, daniel-confirm adds a penalty.
    (after-preferred t14_00) (after-preferred t14_30) (after-preferred t15_00)
    (after-preferred t15_30) (after-preferred t16_00) (after-preferred t16_30)

    ;; Initial cost
    (= (total-cost) 0)
  )

  ;; Goal: meeting scheduled (any slot). The metric in the domain will prefer slots respecting Daniel's preference when possible.
  (:goal (meeting-scheduled))
)