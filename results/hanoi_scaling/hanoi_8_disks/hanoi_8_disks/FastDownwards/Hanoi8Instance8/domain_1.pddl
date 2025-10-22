(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk ?d is immediately on place ?p (a place is either a disk or a peg)
    (on ?d - disk ?p - place)
    ;; nothing is on top of this place (i.e., it is clear)
    (clear ?p - place)
    ;; size ordering: ?a is strictly smaller than ?b
    (smaller ?a - disk ?b - disk)
  )

  ;; Move a top disk onto an empty peg (or an empty peg top).
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a top disk onto another disk (only allowed if moved disk is smaller).
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
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
      (not (clear ?to))
      (clear ?from)
    )
  )
)