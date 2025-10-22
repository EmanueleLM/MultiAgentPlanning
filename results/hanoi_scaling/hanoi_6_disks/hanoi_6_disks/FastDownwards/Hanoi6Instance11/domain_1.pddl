(define (domain hanoi6)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ; disk is directly on a place (place = peg or disk)
    (on ?d - disk ?p - place)
    ; nothing on top of place (peg or disk)
    (clear ?p - place)
    ; size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)
  )

  ; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Move a top disk onto another disk (only allowed if ?d is smaller than ?to)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)