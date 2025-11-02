(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk is on a place (a peg or another disk). 'object' is the universal type.
    (on ?d - disk ?p - object)
    ;; place (peg or disk) has no disk on top
    (clear ?p - object)
    ;; size ordering: smaller ?d1 ?d2 means ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a disk onto a (empty) peg
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)            ; disk ?d is sitting on ?from
      (clear ?d)               ; nothing on top of ?d (it is the top disk)
      (clear ?to)              ; destination peg top is clear
      (not (on ?d ?to))        ; forbid no-op move (from != to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a disk onto another disk (must be smaller than the target disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)         ; size constraint: only smaller onto larger
      (not (on ?d ?to))        ; forbid no-op move
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)