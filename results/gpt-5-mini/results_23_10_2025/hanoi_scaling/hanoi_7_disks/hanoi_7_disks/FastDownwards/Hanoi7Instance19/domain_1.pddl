(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk ?d is directly on top of object ?x (either another disk or a peg)
    (on ?d - disk ?x - object)
    ;; ?x (disk or peg) has nothing on top of it
    (clear ?x - object)
    ;; size ordering: ?d1 strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a disk that is currently on some object ?from onto the top of some disk ?to.
  ;; This enforces that ?d is the top disk at its location, ?to is the top disk at its location,
  ;; and that ?d is smaller than ?to (prevents larger-on-smaller).
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
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a disk that is currently on some object ?from onto an empty peg ?p.
  ;; This allows placing on an empty peg (peg must be clear).
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?p - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (not (clear ?p))
      (clear ?from)
    )
  )
)