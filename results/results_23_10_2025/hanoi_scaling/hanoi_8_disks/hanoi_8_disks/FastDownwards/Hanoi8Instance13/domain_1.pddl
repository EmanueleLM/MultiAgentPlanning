(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place
          place)

  (:predicates
    ;; disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)
    ;; nothing is on top of this place (peg or disk)
    (clear ?p - place)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto a peg (destination is a peg)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)        ; disk ?d sits on ?from (peg or disk)
      (clear ?d)           ; ?d is the top disk of its stack
      (clear ?to)          ; destination peg is clear on top
      (not (on ?d ?to))    ; disallow no-op (already there)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ; the place we removed ?d from becomes clear on top
      (not (clear ?to))    ; destination peg is no longer clear on top
    )
  )

  ;; Move a top disk onto another disk (destination is a disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)     ; can only place smaller disk onto strictly larger disk
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)