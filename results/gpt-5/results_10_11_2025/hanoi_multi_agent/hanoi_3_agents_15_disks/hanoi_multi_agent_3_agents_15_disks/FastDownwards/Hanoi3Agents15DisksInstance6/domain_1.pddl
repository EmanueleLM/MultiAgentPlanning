(define (domain hanoi_3agents_15disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (controlled-by ?d - disk ?a - agent)
  )

  (:action move-peg-peg
    :parameters (?a - agent ?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (on ?d ?p1)
      (clear ?d)
      (clear ?p2)
      (controlled-by ?d ?a)
    )
    :effect (and
      (not (on ?d ?p1))
      (on ?d ?p2)
      (clear ?p1)
      (not (clear ?p2))
    )
  )

  (:action move-peg-disk
    :parameters (?a - agent ?d - disk ?p - peg ?t - disk)
    :precondition (and
      (on ?d ?p)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (controlled-by ?d ?a)
    )
    :effect (and
      (not (on ?d ?p))
      (on ?d ?t)
      (clear ?p)
      (not (clear ?t))
    )
  )

  (:action move-disk-peg
    :parameters (?a - agent ?d - disk ?s - disk ?p - peg)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?p)
      (controlled-by ?d ?a)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?p)
      (clear ?s)
      (not (clear ?p))
    )
  )

  (:action move-disk-disk
    :parameters (?a - agent ?d - disk ?s - disk ?t - disk)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (controlled-by ?d ?a)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (clear ?s)
      (not (clear ?t))
    )
  )
)