(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk)
  (:predicates
    ;; disk is directly on (either a disk or a peg)
    (on ?d - disk ?x - (either disk peg))
    ;; nothing is on top of this object (disk or peg)
    (clear ?x - (either disk peg))
    ;; static size relation: (smaller x y) means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a disk onto an empty peg (peg must be clear)
  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
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
      (clear ?d)
    )
  )

  ;; Move a disk onto another disk (target disk must be top and larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
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
      (clear ?d)
    )
  )
)