(define (domain hanoi)
  ; Tower of Hanoi domain for Fast Downward (classical STRIPS with typing and negative preconditions)
  ; Agents (conceptual): left_peg, middle_peg, right_peg, orchestrator
  ; Disks: A (smallest) ... H (largest)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ; on ?d ?p  -- disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)
    ; clear ?p -- the place ?p (disk or peg) has nothing on top of it
    (clear ?p - place)
    ; smaller ?d1 ?d2 -- disk d1 is strictly smaller than disk d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg (peg must be clear).
  ;; Parameter ?to is restricted to type peg to distinguish from moving onto a disk.
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
      (clear ?from)       ; the support becomes clear after removing top disk
      (not (clear ?to))   ; the destination peg is no longer clear
      (not (clear ?d))    ; moved disk now has something (itself) not considered clear
    )
  )

  ;; Move a top disk onto another disk (target disk must be clear and larger).
  ;; Parameter ?to is a disk (and thus also a place).
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
      (clear ?from)
      (not (clear ?to))
      (not (clear ?d))
    )
  )
)