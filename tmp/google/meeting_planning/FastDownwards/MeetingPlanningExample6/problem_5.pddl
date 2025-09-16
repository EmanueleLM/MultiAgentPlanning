(define (problem coordinate_meeting)
  (:domain multi_agent_meeting)
  (:objects
    FishermansWharf NobHill - location
    visitor - person
    kenneth - person
  )

  (:init
    (at visitor FishermansWharf)
    (at kenneth NobHill)
    (can_meet)
  )

  (:goal
    (meeting-scheduled)
  )
)