(define (domain hanoi-coop)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk - support
    peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?p1)
      (clear-disk ?d)
      (clear-peg ?p2)
    )
    :effect (and
      (not (on ?d ?p1))
      (on ?d ?p2)
      (clear-peg ?p1)
      (not (clear-peg ?p2))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?p1 - peg ?x - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?p1)
      (clear-disk ?d)
      (clear-disk ?x)
      (smaller ?d ?x)
    )
    :effect (and
      (not (on ?d ?p1))
      (on ?d ?x)
      (clear-peg ?p1)
      (not (clear-disk ?x))
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?x - disk ?p2 - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?x)
      (clear-disk ?d)
      (clear-peg ?p2)
    )
    :effect (and
      (not (on ?d ?x))
      (on ?d ?p2)
      (clear-disk ?x)
      (not (clear-peg ?p2))
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?x - disk ?y - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?x)
      (clear-disk ?d)
      (clear-disk ?y)
      (smaller ?d ?y)
    )
    :effect (and
      (not (on ?d ?x))
      (on ?d ?y)
      (clear-disk ?x)
      (not (clear-disk ?y))
    )
  )
)