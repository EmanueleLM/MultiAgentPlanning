(define (domain hanoi-five)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - (either peg disk))     ; disk d is directly on place p (peg or disk)
    (clear ?x - (either peg disk))            ; no disk is directly on x (x is a top object / empty peg)
    (smaller ?d1 - disk ?d2 - disk)           ; d1 is strictly smaller than d2
    (allow-place ?d - disk ?p - (either peg disk)) ; static predicate: d may be placed on p (peg or larger disk)
  )

  ; Single move action for moving a top disk from its current supporting object (?from)
  ; to a clear destination (?to). The allow-place relation enforces size ordering or peg destination.
  (:action move
    :parameters (?d - disk ?from - (either peg disk) ?to - (either peg disk))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allow-place ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)           ; the object that was under ?d becomes clear after removing ?d
      (not (clear ?to))       ; destination becomes occupied (no longer clear)
    )
  )
)