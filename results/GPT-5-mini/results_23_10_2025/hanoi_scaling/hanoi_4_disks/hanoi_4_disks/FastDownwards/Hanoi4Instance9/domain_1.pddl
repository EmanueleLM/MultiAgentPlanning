(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk ?d is immediately on object ?x (peg or disk)
    (on ?d - disk ?x - object)
    ;; nothing on top of object ?x (peg or disk)
    (clear ?x - object)
    ;; ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg
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
      ;; source object becomes clear (nothing on it now)
      (clear ?from)
      ;; destination peg is no longer clear (disk placed on it)
      (not (clear ?to))
    )
  )

  ;; Move a top disk onto another disk (only if the moving disk is smaller)
  (:action move-to-disk
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
      ;; source object becomes clear
      (clear ?from)
      ;; destination disk is no longer clear (has ?d on top)
      (not (clear ?to))
    )
  )
)