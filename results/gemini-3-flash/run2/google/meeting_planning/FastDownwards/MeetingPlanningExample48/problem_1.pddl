(define (problem meeting_problem)
  (:domain meeting_planning)
  (:objects
    financial_district union_square - location
    t_0900 t_0909 t_2130 t_2145 t_2200 - time
    joseph - person
  )
  (:init
    ;; Initial state
    (at_loc financial_district)
    (time_at t_0900)

    ;; Temporal structure
    ;; t_0900 to t_0909 (9 minutes)
    ;; t_0909 to t_2130 (Wait until Joseph arrives)
    ;; t_2130 to t_2145 (15 minute slot)
    ;; t_2145 to t_2200 (15 minute slot)
    (next t_0900 t_0909)
    (next t_0909 t_2130)
    (next t_2130 t_2145)
    (next t_2145 t_2200)

    ;; Travel capabilities (9 minutes travel time)
    (can_travel financial_district union_square t_0900 t_0909)
    (can_travel union_square financial_district t_0900 t_0909)

    ;; Joseph's schedule at Union Square (9:30 PM to 10:00 PM)
    (person_at joseph union_square)
    (available_at joseph t_2130)
    (available_at joseph t_2145)
    (available_at joseph t_2200)
  )
  (:goal
    (and
      (has_met joseph)
    )
  )
)