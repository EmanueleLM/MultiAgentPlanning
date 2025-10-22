(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)              ; nothing is on top of place ?p (peg or disk)
    (smaller ?x - disk ?y - disk)   ; disk ?x is strictly smaller than disk ?y
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg)
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

  ;; Move a top disk onto another disk (must be smaller than destination)
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
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