(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)

  (:predicates
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
    (busy ?p - participant ?s - slot)
    (next ?s - slot ?s2 - slot)
  )

  (:action choose-start-slot
    :parameters (?m - meeting ?s - slot ?s2 - slot)
    :precondition (and
      (unscheduled ?m)
      (next ?s ?s2)
      ;; Theresa must be free in both slots
      (not (busy theresa ?s))
      (not (busy theresa ?s2))
      ;; Charles must be free in both slots
      (not (busy charles ?s))
      (not (busy charles ?s2))
      ;; Betty must be free in both slots
      (not (busy betty ?s))
      (not (busy betty ?s2))
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled ?m ?s)
    )
  )
)