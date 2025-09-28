(define (domain meeting-scheduler)
  (:requirements :typing :fluents :action-costs :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (meeting-not-scheduled)
    (meeting-at ?s - slot)
  )
  (:functions
    (total-cost)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (meeting-not-scheduled)
      (available elijah ?s)
      (available janet ?s)
      (available brian ?s)
      (available carl ?s)
      (available timothy ?s)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-at ?s)
      (increase (total-cost) 1)
    )
  )
)