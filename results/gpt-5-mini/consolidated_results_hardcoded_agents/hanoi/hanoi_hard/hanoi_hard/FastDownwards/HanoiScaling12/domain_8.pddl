(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (next ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)
    (on ?d - disk ?x - (either peg disk))
    (clear ?x - (either peg disk))
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - (either peg disk) ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?snext)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-stage ?s))
      (at-stage ?snext)
    )
  )

  (:action move-onto-disk
    :parameters (?d - disk ?from - (either peg disk) ?to - disk ?s - stage ?snext - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?snext)
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
      (not (at-stage ?s))
      (at-stage ?snext)
    )
  )
)