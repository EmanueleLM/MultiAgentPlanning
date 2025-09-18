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

  (:action confirm-person
    :parameters (?p - person ?s - slot)
    :precondition (and
      (current ?s)
      (available ?p ?s)
    )
    :effect (attendee ?p ?s)
  )

  (:action finalize-meeting
    :parameters (?p1 - person ?p2 - person ?p3 - person ?s - slot)
    :precondition (and
      (current ?s)
      (attendee ?p1 ?s)
      (attendee ?p2 ?s)
      (attendee ?p3 ?s)
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