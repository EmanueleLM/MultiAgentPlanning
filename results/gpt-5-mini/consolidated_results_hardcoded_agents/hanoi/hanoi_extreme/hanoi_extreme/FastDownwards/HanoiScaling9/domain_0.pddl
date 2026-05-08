(define (domain tower-of-hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg - place)

  (:predicates
    (agent ?a - agent)
    (on ?d - disk ?p - place)          ; disk ?d is immediately on place ?p (disk or peg)
    (clear ?p - place)                ; nothing is on top of place ?p (no disk immediately on ?p)
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is strictly smaller than ?d2
  )

  ;; Move a disk onto a peg (destination is a peg). Only the top disk (clear) may be moved.
  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (agent ?ag)
      (on ?d ?from)
      (clear ?d)       ; ?d has nothing on it (top disk)
      (clear ?to)      ; destination peg is clear (empty)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a disk onto another disk (destination is a disk). Must preserve size ordering: moved disk must be smaller.
  (:action move-to-disk
    :parameters (?ag - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (agent ?ag)
      (on ?d ?from)
      (clear ?d)         ; ?d must be the top disk of its source
      (clear ?to)        ; destination disk must be clear (no disk on it)
      (smaller ?d ?to)   ; cannot place larger disk onto smaller one
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)