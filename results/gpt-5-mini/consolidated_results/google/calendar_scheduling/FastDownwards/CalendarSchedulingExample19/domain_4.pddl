(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)
  (:predicates
    (free ?p - participant ?s - slot)
    (consecutive ?s1 - slot ?s2 - slot)
    (occupied ?s - slot)
    (scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (consecutive ?s1 ?s2)
      (free ?p1 ?s1) (free ?p1 ?s2)
      (free ?p2 ?s1) (free ?p2 ?s2)
      (free ?p3 ?s1) (free ?p3 ?s2)
      (not (occupied ?s1)) (not (occupied ?s2))
      (not (scheduled ?m))
    )
    :effect (and
      (scheduled ?m)
      (occupied ?s1) (occupied ?s2)
      (not (free ?p1 ?s1)) (not (free ?p1 ?s2))
      (not (free ?p2 ?s1)) (not (free ?p2 ?s2))
      (not (free ?p3 ?s1)) (not (free ?p3 ?s2))
    )
  )
)