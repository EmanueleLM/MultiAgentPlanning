(define (domain hanoi-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg - support
    disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (owned-by ?d - disk ?a - agent)
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (owned-by ?d ?a)
      (on ?d ?p1)
      (clear ?d)
      (clear ?p2)
    )
    :effect (and
      (not (on ?d ?p1))
      (on ?d ?p2)
      (clear ?p1)
      (not (clear ?p2))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?p1 - peg ?d2 - disk)
    :precondition (and
      (owned-by ?d ?a)
      (on ?d ?p1)
      (clear ?d)
      (clear ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?p1))
      (on ?d ?d2)
      (clear ?p1)
      (not (clear ?d2))
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?d1 - disk ?p2 - peg)
    :precondition (and
      (owned-by ?d ?a)
      (on ?d ?d1)
      (clear ?d)
      (clear ?p2)
    )
    :effect (and
      (not (on ?d ?d1))
      (on ?d ?p2)
      (clear ?d1)
      (not (clear ?p2))
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?d1 - disk ?d2 - disk)
    :precondition (and
      (owned-by ?d ?a)
      (on ?d ?d1)
      (clear ?d)
      (clear ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?d1))
      (on ?d ?d2)
      (clear ?d1)
      (not (clear ?d2))
    )
  )
)