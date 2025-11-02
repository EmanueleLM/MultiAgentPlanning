(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot)
  (:predicates
    (slot ?s - slot)
    (next ?s ?s2 - slot)
    (free-madison ?s - slot)
    (free-diana ?s - slot)
    (free-shirley ?s - slot)
    (scheduled)
    (scheduled-at ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s ?s2 - slot)
    :precondition (and
      (slot ?s) (slot ?s2) (next ?s ?s2)
      (free-madison ?s) (free-madison ?s2)
      (free-diana ?s) (free-diana ?s2)
      (free-shirley ?s) (free-shirley ?s2)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (scheduled-at ?s)
    )
  )
)