(define (problem meet_betty_problem)
  (:domain meeting_planning)
  (:objects
    richmond_district financial_district - location
    t_09_00 t_09_22 t_17_15 t_18_15 t_21_45 - timepoint
    betty - friend
  )
  (:init
    (at richmond_district)
    (time_at t_09_00)
    ;; Travel from Richmond to Financial (22 mins)
    (can_travel richmond_district financial_district t_09_00 t_09_22)
    ;; Wait until Betty's arrival window (starts at 17:15)
    (can_wait t_09_22 t_17_15)
    ;; Meet Betty at Financial District for 60 mins (17:15 to 18:15)
    (can_meet betty financial_district t_17_15 t_18_15)
    ;; Betty remains until 21:45
    (can_wait t_18_15 t_21_45)
  )
  (:goal (met betty))
)