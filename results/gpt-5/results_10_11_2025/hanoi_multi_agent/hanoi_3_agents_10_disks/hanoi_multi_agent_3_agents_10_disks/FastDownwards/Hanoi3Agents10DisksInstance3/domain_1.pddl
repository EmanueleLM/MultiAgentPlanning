(define (domain hanoi3agents10disks)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types
    disk peg agent - object
  )
  (:predicates
    (on ?x - disk ?y - object)
    (clear ?x - object)
    (smaller ?d1 - disk ?d2 - disk)
    (allowed ?a - agent ?d - disk)
    (ok-target ?d - disk ?to - object)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - object ?to - object)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
      (ok-target ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)