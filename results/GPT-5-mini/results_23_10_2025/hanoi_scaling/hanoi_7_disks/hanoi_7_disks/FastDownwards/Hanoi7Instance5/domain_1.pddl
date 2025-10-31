(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk ?d is directly on object ?x (object = disk or peg)
    (on ?d - disk ?x - object)
    ;; nothing is directly on ?x (x can be peg or disk)
    (clear ?x - object)
    ;; ordering: ?a is smaller than ?b
    (smaller ?a - disk ?b - disk)
  )

  ;; Move a disk onto an empty peg (peg is empty / clear)
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)   ;; ?d is on ?from
      (clear ?d)      ;; ?d has nothing on it (top disk)
      (clear ?to)     ;; destination peg has nothing on it (empty or top cleared)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a disk onto another (larger) disk
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)     ;; ?d is on ?from
      (clear ?d)        ;; ?d is top disk
      (clear ?to)       ;; target disk ?to has nothing on it
      (smaller ?d ?to)  ;; cannot place larger on smaller: ?d must be smaller than ?to
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)