(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (is-slot ?s - slot)
    (is-participant ?p - participant)
    (monday-slot ?s - slot)            ; marks slots that belong to Monday/work window
    (next ?s1 - slot ?s2 - slot)       ; ordering between contiguous slots
    (available ?p - participant ?s - slot)
    (scheduled ?s - slot)
  )

  (:action schedule-slot
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (is-slot ?s)
      (monday-slot ?s)
      (is-participant ?p1) (is-participant ?p2) (is-participant ?p3)
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
      (not (scheduled ?s))
    )
    :effect (and
      (scheduled ?s)
      (not (available ?p1 ?s))
      (not (available ?p2 ?s))
      (not (available ?p3 ?s))
    )
  )
)