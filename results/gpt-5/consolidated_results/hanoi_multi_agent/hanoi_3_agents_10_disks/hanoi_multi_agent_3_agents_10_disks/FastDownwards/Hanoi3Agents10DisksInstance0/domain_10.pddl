(define (domain hanoi-multiagent-3agents-10disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - disk)
    (on-peg ?d - disk ?p - peg)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (controls ?a - agent ?d - disk)
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (controls ?a ?d)
      (on-peg ?d ?p1)
      (clear ?d)
      (clear ?p2)
    )
    :effect (and
      (not (on-peg ?d ?p1))
      (on-peg ?d ?p2)
      (clear ?p1)
      (not (clear ?p2))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?p - peg ?s - disk)
    :precondition (and
      (controls ?a ?d)
      (on-peg ?d ?p)
      (clear ?d)
      (clear ?s)
      (smaller ?d ?s)
    )
    :effect (and
      (not (on-peg ?d ?p))
      (on ?d ?s)
      (clear ?p)
      (not (clear ?s))
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?s - disk ?p - peg)
    :precondition (and
      (controls ?a ?d)
      (on ?d ?s)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?s))
      (on-peg ?d ?p)
      (clear ?s)
      (not (clear ?p))
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?s - disk ?t - disk)
    :precondition (and
      (controls ?a ?d)
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (clear ?s)
      (not (clear ?t))
    )
  )
)