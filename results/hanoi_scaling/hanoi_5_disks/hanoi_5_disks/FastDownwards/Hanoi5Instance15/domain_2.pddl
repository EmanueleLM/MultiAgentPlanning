(define (domain hanoi5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?x - (either disk peg))
    (clear ?x - (either disk peg))
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-to-peg
    :parameters (?d - disk ?src - (either disk peg) ?dst - peg)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?src)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?src - (either disk peg) ?dst - disk)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?src)
    )
  )
)