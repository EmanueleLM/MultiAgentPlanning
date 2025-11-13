(define (domain hanoi-coop)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk - support
    peg - support
    stage
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?p1 - peg ?p2 - peg ?s - stage ?t - stage)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?p1)
      (clear-disk ?d)
      (clear-peg ?p2)
      (at-stage ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?d ?p1))
      (on ?d ?p2)
      (clear-peg ?p1)
      (not (clear-peg ?p2))
      (not (at-stage ?s))
      (at-stage ?t)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?p1 - peg ?x - disk ?s - stage ?t - stage)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?p1)
      (clear-disk ?d)
      (clear-disk ?x)
      (smaller ?d ?x)
      (at-stage ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?d ?p1))
      (on ?d ?x)
      (clear-peg ?p1)
      (not (clear-disk ?x))
      (not (at-stage ?s))
      (at-stage ?t)
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?x - disk ?p2 - peg ?s - stage ?t - stage)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?x)
      (clear-disk ?d)
      (clear-peg ?p2)
      (at-stage ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?d ?x))
      (on ?d ?p2)
      (clear-disk ?x)
      (not (clear-peg ?p2))
      (not (at-stage ?s))
      (at-stage ?t)
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?x - disk ?y - disk ?s - stage ?t - stage)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?x)
      (clear-disk ?d)
      (clear-disk ?y)
      (smaller ?d ?y)
      (at-stage ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?d ?x))
      (on ?d ?y)
      (clear-disk ?x)
      (not (clear-disk ?y))
      (not (at-stage ?s))
      (at-stage ?t)
    )
  )
)