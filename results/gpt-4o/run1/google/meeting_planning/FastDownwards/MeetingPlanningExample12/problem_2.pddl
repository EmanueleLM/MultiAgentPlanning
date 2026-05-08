(define (problem sf_meeting_instance)
  (:domain sf_meeting_plan)
  (:objects
    north_beach alamo_square - location
    barbara - person
    you - person
  )
  (:init
    (at you north_beach)
    (at barbara alamo_square)
    (can_meet barbara)
  )
  (:goal
    (meeting_goal_achieved)
  )
)