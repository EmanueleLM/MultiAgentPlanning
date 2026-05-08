(define (problem meeting_planning_instance)
  (:domain meeting_planning)
  (:objects
    me margaret - person
    union_square north_beach - location
    t_0900 t_2135 t_2145 t_2230 - time
  )
  (:init
    (at me union_square)
    (at margaret north_beach)
    (current_time t_0900)
    ;; Wait from arrival at 9:00 AM until the time we must leave for the meeting
    (next t_0900 t_2135)
    ;; Travel from Union Square to North Beach (10 minutes)
    ;; 9:35 PM to 9:45 PM (21:35 to 21:45)
    (travel_time union_square north_beach t_2135 t_2145)
    ;; Margaret is at North Beach from 9:45 PM to 10:30 PM (21:45 to 22:30)
    ;; Meeting duration is 45 minutes, which matches the window duration exactly.
    (meeting_window margaret north_beach t_2145 t_2230)
  )
  (:goal
    (met margaret)
  )
)