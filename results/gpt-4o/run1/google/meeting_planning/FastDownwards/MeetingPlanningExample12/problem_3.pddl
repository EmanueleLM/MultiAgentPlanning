(define (problem sf_meeting_instance)
  (:domain sf_meeting_plan)
  (:objects
    north_beach alamo_square - location
    barbara - person
    you - person
    morning afternoon evening - time_slot
  )
  (:init
    (at you north_beach)
    (at barbara alamo_square)
    (can_meet barbara)
    (current_time morning)
  )
  (:goal
    (meeting_goal_achieved)
  )
)