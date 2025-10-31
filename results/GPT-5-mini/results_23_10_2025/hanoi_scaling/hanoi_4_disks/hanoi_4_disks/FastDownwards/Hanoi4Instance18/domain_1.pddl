(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk ?d is directly on place ?p (a peg or another disk)
    (on ?d - disk ?p - place)
    ;; ?p (peg or disk) has nothing on top of it
    (clear ?p - place)
    ;; ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty place (peg or disk-place that is empty)
  (:action move-to-place
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a top disk onto another top disk (must be smaller than that disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?t - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
    )
  )
)