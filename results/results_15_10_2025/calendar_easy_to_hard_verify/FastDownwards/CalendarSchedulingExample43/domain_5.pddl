(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)
  (:constants wayne edward lauren helen michael joseph vincent - participant)
  (:predicates
    (available ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and (not (meeting-scheduled))
      (available wayne ?s) (available edward ?s) (available lauren ?s)
      (available helen ?s) (available michael ?s) (available joseph ?s)
      (available vincent ?s))
    :effect (and (meeting-scheduled) (scheduled ?s))
  )
)