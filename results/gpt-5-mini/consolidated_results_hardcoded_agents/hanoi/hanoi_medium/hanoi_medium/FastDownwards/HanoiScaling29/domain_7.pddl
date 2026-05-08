(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - loc stage)

  (:predicates
    (on ?d - disk ?p - loc)
    (clear ?p - loc)
    (smaller ?d1 - disk ?d2 - disk)
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action move-to-peg
    :parameters (?d - disk ?src - loc ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (clear ?src)
      (not (clear ?dst))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?src - loc ?dst - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (clear ?src)
      (not (clear ?dst))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)