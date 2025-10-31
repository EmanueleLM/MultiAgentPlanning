(define (domain orchestrated-scheduling)
  (:requirements :strips :typing)
  (:types person meeting slot)
  (:predicates
    (next ?s1 - slot ?s2 - slot)
    (free ?p - person ?s - slot)
    (duration-60 ?m - meeting)
    (scheduled ?p - person ?m - meeting ?s - slot)
    (meeting-finalized ?m - meeting)
    (meeting-time ?m - meeting ?s - slot)
  )

  (:action schedule-person
    :parameters (?p - person ?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free ?p ?s1)
      (free ?p ?s2)
      (duration-60 ?m)
    )
    :effect (and
      (scheduled ?p ?m ?s1)
      (not (free ?p ?s1))
      (not (free ?p ?s2))
    )
  )

  (:action finalize-meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (next ?s1 ?s2)
      (scheduled ?p1 ?m ?s1)
      (scheduled ?p2 ?m ?s1)
      (scheduled ?p3 ?m ?s1)
      (duration-60 ?m)
    )
    :effect (and
      (meeting-finalized ?m)
      (meeting-time ?m ?s1)
    )
  )
)