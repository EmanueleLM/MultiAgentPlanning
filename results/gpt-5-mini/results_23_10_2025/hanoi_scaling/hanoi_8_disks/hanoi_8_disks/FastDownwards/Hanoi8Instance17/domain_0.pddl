(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)        ; disk ?d is immediately on object ?x (peg or disk)
    (clear ?x - object)              ; nothing is on top of object ?x (peg or disk)
    (smaller ?a - disk ?b - disk)    ; disk ?a is strictly smaller than disk ?b
  )

  ;; Move a disk onto an empty peg (destination is a peg that is clear)
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

  ;; Move a disk onto another disk (destination disk must be larger)
  (:action move-onto-disk
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