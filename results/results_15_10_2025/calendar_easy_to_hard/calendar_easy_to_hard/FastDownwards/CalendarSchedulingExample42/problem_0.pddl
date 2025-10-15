(define (problem schedule-single-30min-monday)
  (:domain meeting-scheduling)

  ;; time slots from 09:00 to 16:30 in 30-minute increments (last start 16:30 -> finishes 17:00)
  (:objects
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )

  (:init
    ;; numeric initializations
    (= (total-cost) 0)
    (= (time-value t0) 0)
    (= (time-value t1) 1)
    (= (time-value t2) 2)
    (= (time-value t3) 3)
    (= (time-value t4) 4)
    (= (time-value t5) 5)
    (= (time-value t6) 6)
    (= (time-value t7) 7)
    (= (time-value t8) 8)
    (= (time-value t9) 9)
    (= (time-value t10) 10)
    (= (time-value t11) 11)
    (= (time-value t12) 12)
    (= (time-value t13) 13)
    (= (time-value t14) 14)
    (= (time-value t15) 15)

    ;; Availability facts (interpret every busy/blocked interval as unavailable; all other slots are available)
    ;; Samantha blocked: t4 (11:00-11:30), t8 (13:00-13:30), t13 (15:30-16:00), t15 (16:30-17:00)
    (available samantha t0) (available samantha t1) (available samantha t2) (available samantha t3)
    (available samantha t5) (available samantha t6) (available samantha t7)
    (available samantha t9) (available samantha t10) (available samantha t11)
    (available samantha t12) (available samantha t14)

    ;; Brian: free entire day
    (available brian t0) (available brian t1) (available brian t2) (available brian t3)
    (available brian t4) (available brian t5) (available brian t6) (available brian t7)
    (available brian t8) (available brian t9) (available brian t10) (available brian t11)
    (available brian t12) (available brian t13) (available brian t14) (available brian t15)

    ;; Arthur blocked: t9 (13:30-14:00), t14 (16:00-16:30)
    (available arthur t0) (available arthur t1) (available arthur t2) (available arthur t3)
    (available arthur t4) (available arthur t5) (available arthur t6) (available arthur t7)
    (available arthur t8)             (available arthur t10) (available arthur t11)
    (available arthur t12) (available arthur t13) (available arthur t15)

    ;; Matthew: free entire day
    (available matthew t0) (available matthew t1) (available matthew t2) (available matthew t3)
    (available matthew t4) (available matthew t5) (available matthew t6) (available matthew t7)
    (available matthew t8) (available matthew t9) (available matthew t10) (available matthew t11)
    (available matthew t12) (available matthew t13) (available matthew t14) (available matthew t15)

    ;; Marilyn blocked: t0,t1 (09:00-10:00), t3,t4 (10:30-11:30), t6,t7 (12:00-13:00), t10 (14:00-14:30), t14 (16:00-16:30)
    (available marilyn t2) (available marilyn t5) (available marilyn t8)
    (available marilyn t9) (available marilyn t11) (available marilyn t12)
    (available marilyn t13) (available marilyn t15)

    ;; Mark blocked: t1,t2,t3 (09:30-11:00), t5,t6,t7,t8 (11:30-13:30), t10 (14:00-14:30), t12,t13 (15:00-16:00)
    (available mark t0) (available mark t4) (available mark t9)
    (available mark t11) (available mark t14) (available mark t15)

    ;; Andrea blocked: t1,t2,t3 (09:30-11:00), t5,t6,t7,t8,t9,t10 (11:30-14:30), t12 (15:00-15:30)
    (available andrea t0) (available andrea t4)
    (available andrea t11) (available andrea t13) (available andrea t14) (available andrea t15)
  )

  ;; Goal: every participant attends the single 30-minute meeting (attendance is tied to the chosen/proposed time via preconditions).
  (:goal (and
    (attending samantha)
    (attending brian)
    (attending arthur)
    (attending matthew)
    (attending marilyn)
    (attending mark)
    (attending andrea)
  ))
)