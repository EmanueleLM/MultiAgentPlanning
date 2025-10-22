(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; a disk is directly on some object (either a peg or another disk)
    (on ?d - disk ?x - object)
    ;; nothing is on top of this object (object = peg or disk)
    (clear ?x - object)
    ;; ordering relation: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a clear disk onto a clear peg (peg may be empty)
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
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a clear disk onto a clear disk (must be smaller than the destination disk)
  (:action move-onto-disk
    :parameters (?d - disk ?from - object ?t - disk ?loc - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (on ?t ?loc)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
    )
  )
)