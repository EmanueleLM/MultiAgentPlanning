(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk d is directly on place p (peg or disk)
    (clear ?p - place)              ; nothing is directly on place p
    (smaller ?d1 - disk ?d2 - disk) ; d1 is strictly smaller than d2
  )

  ;; Move a top disk onto an empty peg (peg must be empty/clear).
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)        ; ?d must be the top disk where it is
      (clear ?to)       ; target peg must be empty (no direct disk on it)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to)) ; peg now has a disk directly on it
      (clear ?from)     ; the place that ?d was on is now clear
    )
  )

  ;; Move a top disk onto another disk (destination disk must be clear and larger).
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)         ; only top disk can be moved
      (clear ?to)        ; must place on top of a disk that is currently top
      (smaller ?d ?to)   ; cannot place a larger disk onto a smaller one
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))  ; destination disk no longer clear
      (clear ?from)      ; place that ?d was on becomes clear
    )
  )
)