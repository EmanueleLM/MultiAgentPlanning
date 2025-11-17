(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)
  (:constants
    stephen edward angela - participant
  )
  (:predicates
    (free ?p - participant ?s - slot)
    (consecutive ?s1 - slot ?s2 - slot)
    (scheduled ?m - meeting)
  )
  (:action schedule-one-hour
    :parameters (?s1 - slot ?s2 - slot ?m - meeting)
    :precondition (and
      (consecutive ?s1 ?s2)
      (free stephen ?s1) (free stephen ?s2)
      (free edward ?s1) (free edward ?s2)
      (free angela ?s1) (free angela ?s2)
      (not (scheduled ?m))
    )
    :effect (and
      (scheduled ?m)
    )
  )
)