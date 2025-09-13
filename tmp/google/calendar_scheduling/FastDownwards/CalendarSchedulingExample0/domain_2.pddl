(define (domain combined-meeting-scheduling)
  (:predicates
    (free ?slot)
    (blocked ?slot)
    (meeting-scheduled ?slot)
  )

  (:action schedule-meeting-agent1
    :parameters (?slot)
    :precondition (and (free ?slot))
    :effect (meeting-scheduled ?slot)
  )

  (:action find-free-slot-agent2
    :parameters (?slot)
    :precondition (free ?slot)
    :effect (meeting-scheduled ?slot)
  )

  (:action mark-free-agent3
    :parameters (?slot)
    :precondition (and (not (blocked ?slot)))
    :effect (free ?slot)
  )
)