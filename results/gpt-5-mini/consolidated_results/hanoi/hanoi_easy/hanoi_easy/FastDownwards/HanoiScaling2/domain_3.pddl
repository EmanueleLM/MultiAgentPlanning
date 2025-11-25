(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    ;; types
    (disk ?o - obj)
    (peg ?o - obj)

    ;; disk ?d is directly on ?x (where ?x is either a peg or another disk)
    (on ?d - obj ?x - obj)

    ;; nothing is directly on ?x (applies to pegs and disks)
    (clear ?x - obj)

    ;; size ordering: ?d1 is strictly smaller than ?d2 (only asserted for disk objects)
    (smaller ?d1 - obj ?d2 - obj)
  )

  ;; Move a top disk from a place (?from) (peg or disk) to an empty peg (?to)
  (:action move-to-peg
    :parameters (?d - obj ?from - obj ?to - obj)
    :precondition (and
      (disk ?d)
      (peg ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      ;; remove old support and place on new peg
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear/top facts
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Move a top disk from a place (?from) onto another disk (?target) only if ?d is smaller than ?target
  (:action move-to-disk
    :parameters (?d - obj ?from - obj ?target - obj)
    :precondition (and
      (disk ?d)
      (disk ?target)
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (smaller ?d ?target)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)

      ;; update clear/top facts
      (not (clear ?target))
      (clear ?from)
      (clear ?d)
    )
  )
)