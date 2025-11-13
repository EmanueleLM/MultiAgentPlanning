(define (domain meeting60)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    thomas dylan jerry - person
  )
  (:predicates
    (next ?s1 - slot ?s2 - slot)
    (free ?p - person ?s - slot)
    (chosen ?s - slot)
    (uses ?s - slot)
    (scheduled)
  )

  (:action choose-start
    :parameters (?s - slot)
    :precondition (and
      (free thomas ?s)
      (free dylan ?s)
      (free jerry ?s)
    )
    :effect (and
      (chosen ?s)
    )
  )

  (:action choose-follow
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (chosen ?s1)
      (next ?s1 ?s2)
      (free thomas ?s2)
      (free dylan ?s2)
      (free jerry ?s2)
    )
    :effect (and
      (scheduled)
      (uses ?s1)
      (uses ?s2)
    )
  )
)