(define (problem tripplanningexample48)
  (:domain trip_planning)
  (:objects
    d0 d1 d2 d3 d4 - day
  )
  (:init
    (at_city manchester) ; Assuming start in Manchester
    (current_day d0)
    (next_day d0 d1)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)

    ; Flight paths explicitly stated in problem description
    (flight split geneva)
    (flight geneva split)
    (flight manchester split)
    (flight manchester geneva)
    (flight geneva manchester)

    ; Friend meeting days (between day 2 and day 3 means on day 2 or day 3)
    (is_friend_meeting_day d2)
    (is_friend_meeting_day d3)
  )
  (:goal (and
    (current_day d4) ; Trip must end on day 4 (4 full days spent after d0)
    (visited_split_day_2) ; Visit Split for 2 days
    (visited_manchester_day_2) ; Stay in Manchester for 2 days
    (visited_geneva_day_2) ; Visit Geneva for 2 days
    (met_friend_in_split) ; Meet friend in Split
  ))
)