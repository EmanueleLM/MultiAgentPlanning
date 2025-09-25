(define (problem find-meeting)
  (:domain meeting-scheduling)
  (:objects
    arthur michael samantha - person
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )

  (:init
    ;; successor (half-hour progression)
    (succ t9_00  t9_30)
    (succ t9_30  t10_00)
    (succ t10_00 t10_30)
    (succ t10_30 t11_00)
    (succ t11_00 t11_30)
    (succ t11_30 t12_00)
    (succ t12_00 t12_30)
    (succ t12_30 t13_00)
    (succ t13_00 t13_30)
    (succ t13_30 t14_00)
    (succ t14_00 t14_30)
    (succ t14_30 t15_00)
    (succ t15_00 t15_30)
    (succ t15_30 t16_00)
    (succ t16_00 t16_30)

    ;; === Arthur's availability ===
    ;; Arthur is busy: 9:00-9:30 (t9_00), 10:30-12:00 (t10_30,t11_00,t11_30), 16:00-17:00 (t16_00,t16_30)
    ;; Mark free slots (all half-hours not listed as busy)
    (free arthur t9_30)
    (free arthur t10_00)
    (free arthur t12_00)
    (free arthur t12_30)
    (free arthur t13_00)
    (free arthur t13_30)
    (free arthur t14_00)
    (free arthur t14_30)
    (free arthur t15_00)
    (free arthur t15_30)

    ;; === Michael's availability ===
    ;; Michael is busy: 13:00-13:30 (t13_00), 14:00-14:30 (t14_00)
    (free michael t9_00)
    (free michael t9_30)
    (free michael t10_00)
    (free michael t10_30)
    (free michael t11_00)
    (free michael t11_30)
    (free michael t12_00)
    (free michael t12_30)
    (free michael t13_30)
    (free michael t14_30)
    (free michael t15_00)
    (free michael t15_30)
    (free michael t16_00)
    (free michael t16_30)

    ;; === Samantha's availability ===
    ;; Samantha is busy: 10:30-11:00 (t10_30), 12:00-15:00 (t12_00,t12_30,t13_00,t13_30,t14_00,t14_30), 15:30-17:00 (t15_30,t16_00,t16_30)
    (free samantha t9_00)
    (free samantha t9_30)
    (free samantha t10_00)
    (free samantha t11_00)
    (free samantha t11_30)
    (free samantha t15_00)
  )

  ;; Goal: schedule the meeting at some valid start time (one-hour = two consecutive half-hours).
  ;; Represented as a disjunction over all allowed start times (t9_00 .. t16_00).
  (:goal
    (or
      (scheduled t9_00) (scheduled t9_30) (scheduled t10_00) (scheduled t10_30)
      (scheduled t11_00) (scheduled t11_30) (scheduled t12_00) (scheduled t12_30)
      (scheduled t13_00) (scheduled t13_30) (scheduled t14_00) (scheduled t14_30)
      (scheduled t15_00) (scheduled t15_30) (scheduled t16_00)
    )
  )
)