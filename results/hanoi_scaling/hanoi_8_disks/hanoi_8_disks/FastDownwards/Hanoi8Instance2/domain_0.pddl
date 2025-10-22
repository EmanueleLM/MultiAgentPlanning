(define (domain hanoi)
  ; Tower of Hanoi domain for FastDownwards (classical STRIPS with typing)
  ; Peg agents: left, middle, right (manage peg-level placement)
  ; Disk agents: A..H (manage individual disk placement and obey size constraints)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ; on ?d ?p  -- disk ?d is directly on place ?p (place = disk or peg)
    (on ?d - disk ?p - place)
    ; clear ?p -- the place ?p (disk or peg) has nothing on top of it
    (clear ?p - place)
    ; smaller ?d1 ?d2 -- disk d1 is strictly smaller than disk d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; Move a top disk onto an empty peg (peg must be clear)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; the previous support becomes clear
      (not (clear ?to))   ; the peg is no longer clear
    )
  )

  ; Move a top disk onto another disk (target disk must be clear and larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; the previous support becomes clear
      (not (clear ?to))   ; the target disk is no longer clear
    )
  )
)