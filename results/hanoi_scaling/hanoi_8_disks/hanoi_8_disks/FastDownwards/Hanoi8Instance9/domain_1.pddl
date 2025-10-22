(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place disk peg)
  ;; disk and peg are intended to be usable as places (stack elements or pegs)

  (:predicates
    ;; disk ?d is directly on top of place ?p (place can be a disk or a peg)
    (on ?d - disk ?p - place)
    ;; nothing is on top of place ?p (place can be a disk or a peg)
    (clear ?p - place)
    ;; ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a topmost disk onto an empty peg
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
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a topmost disk onto a larger disk (destination must be a disk)
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?target - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (smaller ?d ?target)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (not (clear ?target))
      (clear ?from)
    )
  )
)