(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)    ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - place)          ; nothing is directly on place ?p (so it is a top)
    (smaller ?d1 - disk ?d2 - disk) ; disk ?d1 is smaller than disk ?d2
  )

  ; Move a top disk onto another disk (destination disk must be clear and larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?dest - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?dest)
      (smaller ?d ?dest)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dest)
      (clear ?from)
      (not (clear ?dest))
    )
  )

  ; Move a top disk onto an empty peg (peg must be clear / empty)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?peg - peg)
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