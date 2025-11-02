(define (domain hanoi8instance10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)
  (:predicates
    (on ?d - disk ?p - object)
    (clear ?o - object)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-to-peg
    :parameters (?disk - disk ?src - object ?dst - peg)
    :precondition (and
      (on ?disk ?src)
      (clear ?disk)
      (clear ?dst)
      (not (on ?disk ?dst))
    )
    :effect (and
      (not (on ?disk ?src))
      (on ?disk ?dst)
      (clear ?src)
      (not (clear ?dst))
      (clear ?disk)
    )
  )

  (:action move-to-disk
    :parameters (?disk - disk ?src - object ?dst - disk)
    :precondition (and
      (on ?disk ?src)
      (clear ?disk)
      (clear ?dst)
      (smaller ?disk ?dst)
      (not (on ?disk ?dst))
    )
    :effect (and
      (not (on ?disk ?src))
      (on ?disk ?dst)
      (clear ?src)
      (not (clear ?dst))
      (clear ?disk)
    )
  )
)