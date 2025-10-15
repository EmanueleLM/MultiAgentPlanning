(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types participant slot)

  (:predicates
    (busy ?p - participant ?s - slot)
    (slot-available ?s - slot)
    (meeting-scheduled ?s - slot)
    (scheduled)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (slot-available ?s)
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled ?s)
      (scheduled)
    )
  )
)