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

  (:action schedule-agent1
    :parameters (?b - person ?e - person ?d - person ?s - slot)
    :precondition (and
      (current ?s)
      (available ?b ?s)
      (available ?e ?s)
      (available ?d ?s)
    )
    :effect (and
      (scheduled ?s)
      (attendee ?b ?s)
      (attendee ?e ?s)
      (attendee ?d ?s)
      (meeting-scheduled)
    )
  )

  (:action schedule-agent2
    :parameters (?b - person ?e - person ?d - person ?s - slot)
    :precondition (and
      (current ?s)
      (available ?b ?s)
      (available ?e ?s)
      (available ?d ?s)
    )
    :effect (and
      (scheduled ?s)
      (attendee ?b ?s)
      (attendee ?e ?s)
      (attendee ?d ?s)
      (meeting-scheduled)
    )
  )

  (:action schedule-agent3
    :parameters (?b - person ?e - person ?d - person ?s - slot)
    :precondition (and
      (current ?s)
      (available ?b ?s)
      (available ?e ?s)
      (available ?d ?s)
    )
    :effect (and
      (scheduled ?s)
      (attendee ?b ?s)
      (attendee ?e ?s)
      (attendee ?d ?s)
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