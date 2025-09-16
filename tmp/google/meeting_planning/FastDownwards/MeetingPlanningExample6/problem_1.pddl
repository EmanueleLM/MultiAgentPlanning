(define (problem coordinate_meeting)
  (:domain multi_agent_meeting)
  (:objects
    FishermansWharf NobHill - location
    Visitor - person
    Kenneth - person
  )

  (:init
    (at Visitor FishermansWharf)
    (at Kenneth NobHill)
    (can_meet)
  )

  (:goal
    (meeting-scheduled)
  )
)