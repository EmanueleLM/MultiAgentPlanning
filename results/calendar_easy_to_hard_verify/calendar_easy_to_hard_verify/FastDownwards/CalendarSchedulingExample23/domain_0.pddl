(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
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