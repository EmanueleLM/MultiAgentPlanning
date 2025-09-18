(define (domain meeting-orchestration)
  (:requirements :typing :strips)
  (:types person slot)
  (:predicates
    (current ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (available ?p - person ?s - slot)
    (scheduled ?s - slot)
    (attendee ?p - person ?s - slot)
    (meeting-scheduled)
  )

  (:action confirm-brittany
    :parameters (?s - slot)
    :precondition (and
      (current ?s)
      (available brittany ?s)
    )
    :effect (attendee brittany ?s)
  )

  (:action confirm-emily
    :parameters (?s - slot)
    :precondition (and
      (current ?s)
      (available emily ?s)
    )
    :effect (attendee emily ?s)
  )

  (:action confirm-doris
    :parameters (?s - slot)
    :precondition (and
      (current ?s)
      (available doris ?s)
    )
    :effect (attendee doris ?s)
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and
      (current ?s)
      (attendee brittany ?s)
      (attendee emily ?s)
      (attendee doris ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )

  (:action advance-time
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)
    )
  )
)