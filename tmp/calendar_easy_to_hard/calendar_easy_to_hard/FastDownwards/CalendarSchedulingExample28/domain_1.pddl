(define (domain merged-meeting-scheduling)
  (:requirements :typing :negative-preconditions :equality)
  (:types person slot meeting)
  (:predicates
    (work-slot ?s - slot)
    (available ?p - person ?s - slot)
    (free ?p - person ?s - slot)
    (scheduled-slot ?s - slot)
    (meeting-at ?s - slot)
    (attending ?p - person ?s - slot)
    (scheduled ?m - meeting)
    (scheduled-at ?m - meeting ?s - slot)
    (booked ?s - slot)
  )

  (:action schedule_agent1
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s))
    :effect (scheduled-slot ?s)
  )

  (:action schedule_meeting_agent2
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (work-slot ?s)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (and
      (meeting-at ?s)
      (attending ?p1 ?s)
      (attending ?p2 ?s)
      (attending ?p3 ?s)
      (not (free ?p1 ?s))
      (not (free ?p2 ?s))
      (not (free ?p3 ?s))
    )
  )

  (:action schedule_meeting_agent3
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (available ?p1 ?s) (available ?p2 ?s) (available ?p3 ?s)
      (not (booked ?s))
    )
    :effect (and
      (scheduled ?m)
      (scheduled-at ?m ?s)
      (booked ?s)
      (not (available ?p1 ?s))
      (not (available ?p2 ?s))
      (not (available ?p3 ?s))
    )
  )
)