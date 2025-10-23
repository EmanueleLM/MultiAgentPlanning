(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - object)
  (:predicates
    (on ?d - disk ?x - object)        ; disk ?d is directly on object ?x (peg or disk)
    (clear ?x - object)              ; object ?x (peg or disk) has no disk on top
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is smaller than ?d2
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)