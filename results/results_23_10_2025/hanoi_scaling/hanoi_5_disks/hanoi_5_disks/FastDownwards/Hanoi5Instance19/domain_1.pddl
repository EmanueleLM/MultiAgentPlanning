(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; A disk is immediately on top of an object (another disk or a peg)
    (on ?d - disk ?s - object)
    ;; No disk is on top of this object (disk or peg)
    (clear ?x - object)
    ;; Size ordering: ?a is smaller than ?b
    (smaller ?a - disk ?b - disk)
  )

  ;; Move a clear disk from any support (disk or peg) onto a peg
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
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a clear disk from any support (disk or peg) onto a disk that is larger
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
      (clear ?from)
      (not (clear ?to))
    )
  )
)