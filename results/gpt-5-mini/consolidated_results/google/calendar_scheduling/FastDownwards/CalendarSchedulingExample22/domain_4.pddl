(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)

  (:predicates
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot ?s2 - slot)
    (busy ?p - participant ?s - slot)
    (next ?s - slot ?s2 - slot)
  )

  (:action choose-start-slot
    :parameters (?m - meeting ?s - slot ?s2 - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (unscheduled ?m)
      (next ?s ?s2)
      (not (busy ?p1 ?s))
      (not (busy ?p1 ?s2))
      (not (busy ?p2 ?s))
      (not (busy ?p2 ?s2))
      (not (busy ?p3 ?s))
      (not (busy ?p3 ?s2))
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled ?m ?s ?s2)
    )
  )
)