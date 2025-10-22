(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk peg - support)
  (:predicates
    (on ?d - disk ?s - support)    ; disk ?d is directly on support ?s (disk or peg)
    (clear ?s - support)          ; nothing is directly on support ?s
    (smaller ?small - disk ?large - disk) ; static size ordering
  )

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
)