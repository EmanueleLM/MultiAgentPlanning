(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support)

  (:predicates
    (on ?d - disk ?s - support)     ; disk ?d is directly on support ?s (support = peg or disk)
    (clear ?s - support)           ; nothing is on top of support ?s
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is smaller than ?d2 (static relation)
  )

  ; Move a disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg)
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

  ; Move a disk onto another disk (must be smaller)
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk)
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