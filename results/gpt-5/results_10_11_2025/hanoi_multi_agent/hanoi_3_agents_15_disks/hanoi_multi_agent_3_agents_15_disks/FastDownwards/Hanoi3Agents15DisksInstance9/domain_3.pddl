(define (domain hanoi3agents15)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (controls ?a - agent ?d - disk)
  )
  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (controls ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - support ?x - disk)
    :precondition (and
      (controls ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?x)
      (smaller ?d ?x)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?x)
      (clear ?from)
      (not (clear ?x))
    )
  )
)