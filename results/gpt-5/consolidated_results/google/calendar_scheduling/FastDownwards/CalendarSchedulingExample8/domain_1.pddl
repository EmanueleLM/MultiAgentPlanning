(define (domain monday-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)
  (:predicates
    (slot-exists ?s - slot)
    (available ?p - participant ?s - slot)
    (all-available ?s - slot)
    (scheduled ?m - meeting)
    (meeting-at ?m - meeting ?s - slot)
  )
  (:action schedule-meeting-at-common-slot
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (slot-exists ?s)
      (all-available ?s)
      (not (scheduled ?m))
    )
    :effect (and
      (scheduled ?m)
      (meeting-at ?m ?s)
    )
  )
)