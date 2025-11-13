(define (problem meetingplanningexample12-instance)
  (:domain meetingplanningexample12)

  (:objects
    you - agent
    barbara - friend
    north_beach alamo_square - location
  )

  (:init
    (at you north_beach)
    (connected north_beach alamo_square)
    (connected alamo_square north_beach)
    (before-window-barbara)
    (= (total-cost) 0)
  )

  (:goal
    (and
      (met you barbara)
    )
  )

  (:metric minimize (total-cost))
)