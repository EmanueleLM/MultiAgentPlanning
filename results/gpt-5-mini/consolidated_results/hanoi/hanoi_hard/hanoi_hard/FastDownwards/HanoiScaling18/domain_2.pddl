(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk X is directly on place Y (Y may be a peg or another disk)
    (on ?d - disk ?p - object)
    ;; nothing is directly on place Y (peg or disk)
    (clear ?p - object)
    ;; size ordering: ?d1 is strictly larger than ?d2
    (larger ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk from any place (peg or disk) onto an empty peg.
  ;; Preconditions ensure ?d is the top disk (clear ?d), it is directly on ?from,
  ;; and the destination peg is empty (clear ?to).
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
      (clear ?d)
    )
  )

  ;; Move a top disk from any place (peg or disk) onto another disk.
  ;; Additional precondition enforces that the destination disk is strictly larger.
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )
)