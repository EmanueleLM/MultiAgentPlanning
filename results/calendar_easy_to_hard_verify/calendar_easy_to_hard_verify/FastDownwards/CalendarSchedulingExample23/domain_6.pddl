(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)
  (:constants elijah janet brian carl timothy - participant)
  (:predicates
    (available ?p - participant ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (available elijah ?s)
      (available janet ?s)
      (available brian ?s)
      (available carl ?s)
      (available timothy ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)