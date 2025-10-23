(define (domain hanoi5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?x - place)
    (clear ?x - place)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-to-peg
    :parameters (?d - disk ?src - place ?dst - peg)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
      (not (= ?src ?dst))
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?src)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?src - place ?dst - disk)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
      (not (= ?src ?dst))
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?src)
    )
  )
)