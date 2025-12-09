(define (domain hanoi-5-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support - object
    disk peg - support
    stage - object
  )

  (:predicates
    (on ?d - disk ?x - support)
    (clear ?x - support)
    (smaller ?d1 - disk ?d2 - disk)
    (succ ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  (:action mover-move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action mover-move-to-disk
    :parameters (?d - disk ?from - support ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)