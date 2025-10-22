(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)    ; disk ?d is directly on place ?p (peg or another disk)
    (clear ?p - place)          ; place ?p has no disk directly on it (top)
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2
  )

  ; Move a top disk onto an empty peg (target is a peg)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)        ; ?d has nothing on top
                    (clear ?to)       ; target peg top is free
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)      ; after removing ?d, the former support is now clear
              (not (clear ?to))  ; target peg no longer clear (occupied by ?d)
            )
  )

  ; Move a top disk onto another disk (must be smaller than the target disk)
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)         ; ?d has nothing on top
                    (clear ?to)        ; target disk has nothing on top
                    (smaller ?d ?to)   ; cannot place larger on smaller
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)       ; former support becomes clear
              (not (clear ?to))   ; target disk now has a disk on top
            )
  )
)