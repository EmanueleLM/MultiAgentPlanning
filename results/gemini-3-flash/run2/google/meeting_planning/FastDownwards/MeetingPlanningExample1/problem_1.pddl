(define (problem meeting_planning_example_1)
  (:domain meeting_planning)
  (:objects
    richmond_district financial_district - location
    t_0900 t_0922 t_1715 t_1815 t_1836 - time
    betty - person
  )
  (:init
    (at_loc richmond_district)
    (time_at t_0900)
    ;; Travel Richmond to Financial District (22 minutes)
    (can_travel richmond_district financial_district t_0900 t_0922)
    ;; Wait at Financial District until Betty arrives (9:22 AM to 5:15 PM)
    (can_wait financial_district t_0922 t_1715)
    ;; Meet Betty for 60 minutes (5:15 PM to 6:15 PM)
    (can_meet betty financial_district t_1715 t_1815)
    ;; Optional: Travel back to Richmond District (21 minutes)
    (can_travel financial_district richmond_district t_1815 t_1836)
  )
  (:goal
    (met betty)
  )
)