(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:constants
     left middle right - peg
     A B C D E F - disk
  )
  (:predicates
     ;; A disk or a peg can have something on it: (on ?d ?x) means disk ?d is
     ;; directly on top of ?x, where ?x is either a disk or a peg.
     (on ?d - disk ?x - (either disk peg))

     ;; A disk or a peg is clear (nothing on top of it)
     (clear ?x - (either disk peg))

     ;; Static ordering relation: ?d1 is strictly smaller than ?d2
     (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a disk onto another disk (target must be a disk and larger than the moving disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (on ?d ?from)        ; ?d is the top disk on ?from
      (clear ?d)           ; nothing on top of ?d (it is movable)
      (clear ?to)          ; target disk has nothing on it (we place on top)
      (smaller ?d ?to)     ; moving disk is smaller than the target disk
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; After removing ?d, the place it was on becomes clear
      (clear ?from)
      ;; The disk we placed on is no longer clear
      (not (clear ?to))
      ;; The moved disk remains clear (topmost) -- it was already clear before move,
      ;; so no need to add it, but leaving it implicit is consistent with STRIPS semantics.
    )
  )

  ;; Move a disk onto an empty peg (peg must be clear/empty)
  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?peg - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
    )
  )
)