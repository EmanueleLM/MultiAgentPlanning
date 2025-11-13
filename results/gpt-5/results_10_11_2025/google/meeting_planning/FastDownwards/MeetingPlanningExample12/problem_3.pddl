(define (problem meetingplanningexample12-instance)
  (:domain meetingplanningexample12)
  (:objects
    you - agent
    t0900 t1744 t1800 t2130 - time
  )
  (:init
    (at you north_beach)
    (at-time t0900)

    ; waiting jump compiled to a single step to the chosen departure time
    (jump t0900 t1744)

    ; travel pairs encode exact durations
    (travel-nb-as t1744 t1800)

    ; chosen meeting uses the full window from 18:00 to 21:30 (210 minutes)
    (meet-end-210-barbara t1800 t2130)
  )
  (:goal
    (and
      (met you barbara)
    )
  )
)