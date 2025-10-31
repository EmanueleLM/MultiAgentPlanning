(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?s - (either disk peg))
    (clear ?x - (either disk peg))
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?peg - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
      (not (= ?from ?peg))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?disk2 - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?disk2)
      (smaller ?d ?disk2)
      (not (= ?from ?disk2))
      (not (= ?d ?disk2))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?disk2)
      (clear ?from)
      (not (clear ?disk2))
    )
  )
)