(define (domain hanoi3agents10disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support stage agent - object
    disk peg - support
  )
  (:predicates
    (on ?x - disk ?y - support)
    (clear ?x - support)
    (smaller ?d1 - disk ?d2 - disk)
    (allowed ?a - agent ?d - disk)
    (ok-target ?d - disk ?to - support)
    (at ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - support ?to - support ?t - stage ?t2 - stage)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (ok-target ?d ?to)
      (at ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?t))
      (at ?t2)
    )
  )
)