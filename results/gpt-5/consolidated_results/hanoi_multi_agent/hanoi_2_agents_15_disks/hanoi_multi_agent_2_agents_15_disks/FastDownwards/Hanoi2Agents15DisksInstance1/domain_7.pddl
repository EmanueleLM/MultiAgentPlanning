(define (domain hanoi2agents_staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent stage support
    disk peg - support
  )
  (:predicates
    (on ?d1 - disk ?d2 - disk)
    (on-peg ?d - disk ?p - peg)
    (clear ?s - support)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?ag - agent ?d - disk)
    (cur ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move-disk-to-disk
    :parameters (?ag - agent ?x - disk ?from - disk ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (can-move ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
      (cur ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
      (not (cur ?t))
      (cur ?t2)
    )
  )

  (:action move-disk-to-peg
    :parameters (?ag - agent ?x - disk ?from - disk ?p - peg ?t - stage ?t2 - stage)
    :precondition (and
      (can-move ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?p)
      (cur ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?x ?from))
      (on-peg ?x ?p)
      (clear ?from)
      (not (clear ?p))
      (not (cur ?t))
      (cur ?t2)
    )
  )

  (:action move-peg-to-disk
    :parameters (?ag - agent ?x - disk ?p - peg ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (can-move ?ag ?x)
      (on-peg ?x ?p)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
      (cur ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-peg ?x ?p))
      (clear ?p)
      (on ?x ?to)
      (not (clear ?to))
      (not (cur ?t))
      (cur ?t2)
    )
  )

  (:action move-peg-to-peg
    :parameters (?ag - agent ?x - disk ?p1 - peg ?p2 - peg ?t - stage ?t2 - stage)
    :precondition (and
      (can-move ?ag ?x)
      (on-peg ?x ?p1)
      (clear ?x)
      (clear ?p2)
      (cur ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-peg ?x ?p1))
      (clear ?p1)
      (on-peg ?x ?p2)
      (not (clear ?p2))
      (not (cur ?t))
      (cur ?t2)
    )
  )
)