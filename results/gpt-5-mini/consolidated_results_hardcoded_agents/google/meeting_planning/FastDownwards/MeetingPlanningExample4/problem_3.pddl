(define (problem MeetingPlanningExample4-problem)
  (:domain MeetingPlanningExample4)

  (:objects
    Presidio MarinaDistrict - location
    jessica - friend
    ;; Minimal time points required for the selected schedule:
    ;; t0 = 09:00, t1 = 09:05, t2 = 09:10, t3 = 09:15 ... through t14 = 10:15
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 - time
  )

  ;; Initial state: only the subset of facts needed to support the chosen feasible schedule
  (:init
    ;; Successor chain for the contiguous times used by the plan (t0 -> ... -> t14)
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4) (succ t4 t5) (succ t5 t6)
    (succ t6 t7) (succ t7 t8) (succ t8 t9) (succ t9 t10) (succ t10 t11) (succ t11 t12)
    (succ t12 t13) (succ t13 t14)

    ;; Connectivity between locations
    (connected Presidio MarinaDistrict)
    (connected MarinaDistrict Presidio)

    ;; Initial position: you are at Presidio at 09:00 (t0)
    (at Presidio t0)

    ;; Jessica is present at MarinaDistrict during the contiguous block when the planned meeting may occur.
    ;; (This subset encodes the relevant portion of her 09:15-17:45 availability needed for the chosen plan.)
    (present jessica MarinaDistrict t3) (present jessica MarinaDistrict t4)
    (present jessica MarinaDistrict t5) (present jessica MarinaDistrict t6)
    (present jessica MarinaDistrict t7) (present jessica MarinaDistrict t8)
    (present jessica MarinaDistrict t9) (present jessica MarinaDistrict t10)
    (present jessica MarinaDistrict t11) (present jessica MarinaDistrict t12)
    (present jessica MarinaDistrict t13) (present jessica MarinaDistrict t14)
  )

  ;; Goal: have met Jessica for at least 60 contiguous minutes (encoded as the 'met' fluent set by meet-60min).
  (:goal (and (met jessica)))
)