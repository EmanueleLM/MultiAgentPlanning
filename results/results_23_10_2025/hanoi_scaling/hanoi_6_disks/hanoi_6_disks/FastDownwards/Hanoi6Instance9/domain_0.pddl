(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place)
  ;; disks and pegs are both places (pegs are places; disks are also places when other disks are stacked on them)
  ;; In PDDL typing, declare disk and peg as subtypes of place via separate usage in parameters.
  (:predicates
    (on ?d - disk ?p - place)          ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)                ; place ?p has no disk on top of it
    (smaller ?d1 - disk ?d2 - disk)   ; disk ?d1 is strictly smaller than disk ?d2
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)        ; disk being moved must be top of its stack
      (clear ?to)       ; target peg must be empty (placing on peg surface)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)     ; the place we removed from becomes clear
      (not (clear ?to)) ; peg is no longer clear
      (clear ?d)        ; moved disk is now top at destination (clear)
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the destination disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)           ; disk being moved must be top
      (clear ?to)          ; destination disk must be top (nothing on it)
      (smaller ?d ?to)     ; cannot place larger disk on smaller disk
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ; the place we removed from becomes clear
      (not (clear ?to))    ; destination disk is no longer clear
      (clear ?d)           ; moved disk is now top at destination (clear)
    )
  )
)