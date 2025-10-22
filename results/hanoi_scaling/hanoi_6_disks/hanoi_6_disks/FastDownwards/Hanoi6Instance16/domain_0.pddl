(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk peg)
  (:constants
     left middle right - peg
     A B C D E F - disk
  )
  (:predicates
     (on ?d - disk ?x - (either disk peg))
     (clear ?x - (either disk peg))
     (smaller ?d1 - disk ?d2 - disk) ; static relation: ?d1 is smaller than ?d2
  )

  ;; Move a disk onto another disk (target must be a disk and larger than the moving disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ; the place we removed from becomes clear
      (not (clear ?to))    ; the disk we placed on is no longer clear
    )
  )

  ;; Move a disk onto a peg (peg must be clear)
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