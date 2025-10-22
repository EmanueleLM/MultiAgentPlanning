(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)              ; nothing is on top of place ?p
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
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
    :parameters (?d - disk ?from - place ?dest - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?dest)
                    (smaller ?d ?dest)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?dest)
              (clear ?from)
              (not (clear ?dest))
            )
  )
)