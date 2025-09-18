(define (problem meet-matthew-multiagent)
  (:domain meeting-multiagent)

  (:objects
    nobhill presidio - location
    matthew - person
  )

  (:init
    ;; Agent1 initial state: at Nob Hill at 9:00AM (clock = 0)
    (at nobhill)
    (= (clock) 0)
    (= (busy) 0)

    ;; Agent2 initial state: at Nob Hill at 9:00AM -> 9:00 = 540 minutes since midnight
    (at-nobhill)
    (= (time) 540)
  )

  ;; Goals: maximize meetings by having both agents meet Matthew.
  ;; - Agent1's meeting recorded as (met matthew)
  ;; - Agent2's meeting recorded as (met-agent2)
  (:goal (and
           (met matthew)
           (met-agent2)
         )
  )
)