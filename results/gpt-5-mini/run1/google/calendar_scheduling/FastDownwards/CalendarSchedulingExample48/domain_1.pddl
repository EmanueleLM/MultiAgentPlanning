(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (occupied ?p - person ?s - slot)
    (meeting_not_scheduled)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
    (allowed_start ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (meeting_not_scheduled)
      (next ?s ?s2)
      (allowed_start ?s)
      (available janet ?s)
      (available janet ?s2)
      (available rachel ?s)
      (available rachel ?s2)
      (available cynthia ?s)
      (available cynthia ?s2)
    )
    :effect (and
      (not (meeting_not_scheduled))
      (meeting_scheduled)
      (scheduled_at ?s)

      (occupied janet ?s)
      (occupied janet ?s2)
      (not (available janet ?s))
      (not (available janet ?s2))

      (occupied rachel ?s)
      (occupied rachel ?s2)
      (not (available rachel ?s))
      (not (available rachel ?s2))

      (occupied cynthia ?s)
      (occupied cynthia ?s2)
      (not (available cynthia ?s))
      (not (available cynthia ?s2))
    )
  )
)