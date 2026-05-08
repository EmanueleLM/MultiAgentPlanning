(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)        ; disk ?d is directly on object ?x (disk or peg)
    (clear ?x - object)              ; nothing is directly on top of object ?x
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is strictly smaller than ?d2
  )

  ; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (not (= ?from ?to))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  ; Move a top disk onto a larger disk
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (not (= ?from ?to))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )
)