(define (problem coordinate_meeting)
  (:domain multi_agent_meeting)
  (:objects
    FishermansWharf NobHill - location
    visitor - person
    kenneth - person
    9.00 14.15 19.45 - time
  )

  (:init
    (at visitor FishermansWharf)
    (at kenneth NobHill)
    (can_meet)
    (current_time 9.00)
  )

  (:goal
    (meeting-scheduled)
  )
)