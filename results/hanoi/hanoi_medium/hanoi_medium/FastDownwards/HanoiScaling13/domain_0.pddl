(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ; disk on a place (place = disk or peg)
    (on ?d - disk ?p - place)
    ; place (disk or peg) has no disk directly on it
    (clear ?p - place)
    ; size ordering: smaller ?x ?y means disk ?x is strictly smaller than disk ?y
    (smaller ?x - disk ?y - disk)
  )

  ; Move a clear disk from any place onto an empty peg.
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
      (not (clear ?to))
      (clear ?from)
      ; ?d remains clear because nothing is placed onto it by this action
    )
  )

  ; Move a clear disk from any place onto a clear disk larger than it.
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
      (not (clear ?to))
      (clear ?from)
    )
  )
)