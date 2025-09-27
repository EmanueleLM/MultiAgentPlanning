(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:predicates
    (unscheduled)
    (available ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (is-diane ?p - participant)
    (is-jack ?p - participant)
    (is-eugene ?p - participant)
    (is-patricia ?p - participant)
  )

  (:action schedule
    :parameters (?s - slot ?d - participant ?j - participant ?e - participant ?p - participant)
    :precondition (and
      (unscheduled)
      (is-diane ?d) (is-jack ?j) (is-eugene ?e) (is-patricia ?p)
      (available ?d ?s) (available ?j ?s) (available ?e ?s) (available ?p ?s)
    )
    :effect (and
      (not (unscheduled))
      (scheduled ?s)
    )
  )
)