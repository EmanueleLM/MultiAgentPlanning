(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types support disk peg)
  (:predicates
    (on ?d - disk ?s - support)           ; disk ?d is directly on support ?s (disk or peg)
    (clear ?s - support)                 ; support ?s has no disk on top
    (smaller ?d1 - disk ?d2 - disk)      ; ?d1 is strictly smaller than ?d2
  )

  ; Move a disk onto a peg (peg must be clear, disk must be top of its stack)
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
      (not (clear ?to))
      (clear ?from)
    )
  )

  ; Move a disk onto another disk (destination disk must be clear and larger than moving disk)
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
      (not (clear ?to))
      (clear ?from)
    )
  )
)