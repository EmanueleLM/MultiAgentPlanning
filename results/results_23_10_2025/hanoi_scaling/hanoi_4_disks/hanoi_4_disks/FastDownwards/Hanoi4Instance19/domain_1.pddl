(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk is directly on an object (either a peg or another disk)
    (on ?d - disk ?x - object)
    ;; object (peg or disk) has nothing on it (is top/empty)
    (clear ?x - object)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)    ;; ?d must be the top disk of its stack
      (clear ?to)   ;; destination peg must be empty (no top disk)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a top disk onto another top disk that is strictly larger
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)         ;; ?d must be the top disk of its stack
      (clear ?to)        ;; destination disk must be the top of its stack
      (smaller ?d ?to)   ;; size constraint: cannot place larger on smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)