(define (domain hanoi-multiagent)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ; disk on a place (place = peg or disk)
    (on ?d - disk ?p - place)
    ; a place (peg or disk) has nothing on it
    (clear ?p - place)
    ; disk size ordering: (smaller X Y) means X is strictly smaller than Y
    (smaller ?x - disk ?y - disk)
  )

  ; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to)) ; prevent no-op move onto the same place
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; the supporter becomes clear after removing its top disk
      (not (clear ?to))   ; the destination is no longer clear
    )
  )

  ; Move a top disk onto another disk (only allowed if smaller)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)    ; enforce no larger-on-smaller
      (not (on ?d ?to))   ; prevent no-op
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)