(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)         ; disk ?d is directly on object ?x (peg or disk)
    (clear ?x - object)               ; nothing is on top of object ?x
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is smaller than ?d2
  )

  ;; Move a clear disk from any support (peg or disk) onto an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after moving, the previous support becomes clear (nothing on top of it)
      (clear ?from)
      ;; the destination peg is no longer clear (now has ?d on top)
      (not (clear ?to))
      ;; the moved disk remains clear (it is topmost)
      (clear ?d)
    )
  )

  ;; Move a clear disk from any support (peg or disk) onto a clear disk, allowed only if mover is smaller.
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; previous support becomes clear
      (clear ?from)
      ;; destination disk is no longer clear (now has ?d on top)
      (not (clear ?to))
      ;; moved disk remains clear (topmost)
      (clear ?d)
    )
  )
)