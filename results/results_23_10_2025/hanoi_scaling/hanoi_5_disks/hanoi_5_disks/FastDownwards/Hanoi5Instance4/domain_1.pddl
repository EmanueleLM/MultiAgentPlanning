(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk ?d is directly on object ?s (a peg or another disk)
    (on ?d - disk ?s - object)
    ;; nothing is on top of object ?x (peg or disk)
    (clear ?x - object)
    ;; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a clear disk from any support (peg or disk) onto an empty peg.
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
      ;; the previous support now has nothing directly on it
      (clear ?from)
      ;; the destination peg is no longer clear
      (not (clear ?to))
      ;; the moved disk is topmost and therefore clear
      (clear ?d)
    )
  )

  ;; Move a clear disk from any support (peg or disk) onto a clear disk,
  ;; only allowed if the moved disk is smaller than the destination disk.
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
      ;; the previous support now has nothing directly on it
      (clear ?from)
      ;; the destination disk is no longer clear (has ?d on top)
      (not (clear ?to))
      ;; the moved disk is topmost and therefore clear
      (clear ?d)
    )
  )
)