(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    ;; a disk is directly on some place (either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; a place (peg or disk) has no disk directly on top of it
    (clear ?p - place)
    ;; static relation: first disk is strictly smaller than the second place (disk or peg)
    (smaller ?d - disk ?p - place)
  )

  ;; Single move action: move a clear disk from one place to a different clear place,
  ;; only allowed when the moving disk is smaller than the destination place.
  (:action move
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination is no longer clear (now has ?d on top)
      (not (clear ?to))
      ;; the origin becomes clear (the moved disk was the top item there)
      (clear ?from)
    )
  )
)