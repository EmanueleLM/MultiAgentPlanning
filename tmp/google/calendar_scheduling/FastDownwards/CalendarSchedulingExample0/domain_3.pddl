(define (domain combined-meeting-scheduling)
  (:types 
    time
  )

  (:predicates
    (free ?slot - time)
    (blocked ?slot - time)
    (meeting-scheduled ?slot - time)
  )

  (:action schedule-meeting-agent1
    :parameters (?slot - time)
    :precondition (and (free ?slot))
    :effect (meeting-scheduled ?slot)
  )

  (:action find-free-slot-agent2
    :parameters (?slot - time)
    :precondition (free ?slot)
    :effect (meeting-scheduled ?slot)
  )

  (:action mark-free-agent3
    :parameters (?slot - time)
    :precondition (and (not (blocked ?slot)))
    :effect (free ?slot)
  )
)