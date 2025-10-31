(define (domain hanoi7-instance14)
  (:requirements :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)
    (clear ?x - object)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )
)