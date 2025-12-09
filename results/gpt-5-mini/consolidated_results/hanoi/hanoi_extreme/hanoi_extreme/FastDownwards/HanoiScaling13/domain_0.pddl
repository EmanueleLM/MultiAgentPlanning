(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk peg - support)

  (:predicates
    (on ?d - disk ?s - support)        ; disk ?d is directly on support ?s (disk or peg)
    (clear ?s - support)              ; support ?s has nothing directly on top of it
    (smaller ?d1 - disk ?d2 - disk)   ; disk ?d1 is strictly smaller than disk ?d2
  )

  ;; Move a top disk onto an empty peg.
  (:action move-disk-to-peg
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

  ;; Move a top disk onto another top disk that is larger.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - support ?dst - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (clear ?from)
      (not (clear ?dst))
    )
  )
)