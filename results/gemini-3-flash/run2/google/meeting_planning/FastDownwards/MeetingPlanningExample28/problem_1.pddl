(define (problem meeting_planning_example_28)
  (:domain meeting_planning)
  (:objects
    union_square chinatown - location
    t_09_00 t_09_07 t_18_00 t_19_15 t_21_30 - time
    joshua - person
  )
  (:init
    ;; Starting state: Arrive at Union Square at 9:00 AM
    (at_loc union_square)
    (time_at t_09_00)

    ;; Travel distance from Union Square to Chinatown is 7 minutes
    ;; (9:00 AM to 9:07 AM)
    (can_travel union_square chinatown t_09_00 t_09_07)

    ;; Once in Chinatown, wait until Joshua arrive at 6:00 PM (18:00)
    (can_wait chinatown t_09_07 t_18_00)

    ;; Joshua is at Chinatown from 6:00 PM to 9:30 PM (18:00 to 21:30).
    ;; Meeting Joshua for a minimum of 75 minutes.
    ;; (18:00 to 19:15 satisfies the 75-minute requirement)
    (can_meet joshua chinatown t_18_00 t_19_15)

    ;; Allow waiting in Chinatown after the meeting until he leaves
    (can_wait chinatown t_19_15 t_21_30)

    ;; Travel distance from Chinatown to Union Square is 7 minutes
    ;; (Provided in spec, though not required to meet the goal)
    (can_travel chinatown union_square t_19_15 t_19_22)
    (can_travel chinatown union_square t_21_30 t_21_37)
  )
  (:goal
    (met joshua)
  )
)