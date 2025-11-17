(define (domain hanoi2agents15_strips)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent time
    support - object
    peg - support
    disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (held-by ?a - agent ?d - disk)
    (at ?t - time)
    (succ ?t1 - time ?t2 - time)
  )

  (:action move-onto-disk
    :parameters (?a - agent ?x - disk ?from - support ?to - disk ?t - time ?t2 - time)
    :precondition (and
      (held-by ?a ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (on ?x ?to)
      (not (clear ?to))
      (not (at ?t))
      (at ?t2)
    )
  )

  (:action move-onto-peg
    :parameters (?a - agent ?x - disk ?from - support ?to - peg ?t - time ?t2 - time)
    :precondition (and
      (held-by ?a ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (on ?x ?to)
      (not (clear ?to))
      (not (at ?t))
      (at ?t2)
    )
  )
)