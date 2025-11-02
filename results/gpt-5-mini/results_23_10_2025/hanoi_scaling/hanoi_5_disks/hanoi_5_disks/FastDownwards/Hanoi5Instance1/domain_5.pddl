(define (domain hanoi5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)        ; disk ?d is directly on object ?x (peg or disk)
    (clear ?x - object)              ; nothing is on top of object ?x (peg or disk)
    (smaller ?d - disk ?e - disk)    ; disk ?d is smaller than disk ?e
  )

  ;; Move a top disk onto an empty peg
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
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a top disk onto another top disk (must be larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?t - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (not (= ?from ?t))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
    )
  )
)