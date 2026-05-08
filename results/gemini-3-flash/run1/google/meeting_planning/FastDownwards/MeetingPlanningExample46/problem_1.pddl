(define (problem MeetingPlanningExample46)
  (:domain meeting_planning)
  (:objects
    haight_ashbury north_beach - location
    t_0900 t_0919 t_1611 t_1630 t_1800 t_1930 t_2000 t_2100 t_2130 - timepoint
    robert - person
  )
  (:init
    (at_location haight_ashbury)
    (at_time t_0900)

    ;; Travel possibilities (HA to NB is 19 minutes)
    (travel_possible haight_ashbury north_beach t_0900 t_0919)
    (travel_possible haight_ashbury north_beach t_1611 t_1630)

    ;; Time progression for the wait action
    (next t_0900 t_0919)
    (next t_0919 t_1611)
    (next t_1611 t_1630)
    (next t_1630 t_1800)
    (next t_1800 t_1930)
    (next t_1930 t_2000)
    (next t_2000 t_2100)
    (next t_2100 t_2130)

    ;; Meeting possibilities (Robert at NB from 16:30 to 21:30, needs 90 mins)
    (can_meet robert north_beach t_1630 t_1800)
    (can_meet robert north_beach t_1800 t_1930)
    (can_meet robert north_beach t_1930 t_2100)
    (can_meet robert north_beach t_2000 t_2130)
  )
  (:goal
    (and
      (met robert)
    )
  )
)