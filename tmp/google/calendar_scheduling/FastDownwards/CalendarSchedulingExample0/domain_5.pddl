(define (domain meeting-scheduling)
  (:types 
    time
  )

  (:predicates
    (free ?slot - time)
    (blocked ?slot - time)
    (meeting-scheduled ?slot - time)
  )

  (:action mark-slot-free-michelle
    :parameters (?slot - time)
    :precondition (blocked ?slot)
    :effect (and (not (blocked ?slot)) (free ?slot))
  )

  (:action mark-slot-free-steven
    :parameters (?slot - time)
    :precondition (blocked ?slot)
    :effect (and (not (blocked ?slot)) (free ?slot))
  )

  (:action mark-slot-free-jerry
    :parameters (?slot - time)
    :precondition (blocked ?slot)
    :effect (and (not (blocked ?slot)) (free ?slot))
  )

  (:action schedule-meeting
    :parameters (?slot - time)
    :precondition (free ?slot)
    :effect (meeting-scheduled ?slot)
  )
)