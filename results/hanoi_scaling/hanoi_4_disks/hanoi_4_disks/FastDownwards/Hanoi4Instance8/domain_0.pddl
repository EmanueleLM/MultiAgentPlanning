(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; a disk is on either a peg or another disk
    (on ?d - disk ?x - (either disk peg))
    ;; something (peg or disk) is clear (no disk on top)
    (clear ?x - (either disk peg))
    ;; size ordering: first disk is strictly smaller than second disk
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto a peg
  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
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
      (clear ?d)
    )
  )

  ;; Move a top disk onto another disk (only allowed if moving disk is smaller)
  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
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
      (clear ?d)
    )
  )
)