(define (domain calendar-scheduling)
  (:requirements :typing :strips :negative-preconditions)
  (:types participant timeslot)

  (:predicates
    (busy ?p - participant ?s - timeslot)
    (within-work ?s - timeslot)
    (scheduled ?s - timeslot)
    (assigned ?p - participant ?s - timeslot)
  )

  (:action schedule-at-slot
    :parameters (?s - timeslot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (within-work ?s)
      (not (scheduled ?s))
      (not (busy ?p1 ?s)) (not (busy ?p2 ?s)) (not (busy ?p3 ?s))
    )
    :effect (and
      (scheduled ?s)
      (assigned ?p1 ?s) (assigned ?p2 ?s) (assigned ?p3 ?s)
    )
  )
)