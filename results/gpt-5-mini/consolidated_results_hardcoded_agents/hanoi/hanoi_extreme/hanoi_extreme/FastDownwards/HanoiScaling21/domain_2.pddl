(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place stage disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)       ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)              ; place ?p has no disk directly on it (i.e., nothing on top)
    (smaller ?a - disk ?b - disk)   ; disk ?a is strictly smaller than disk ?b
    (next ?s - stage ?s2 - stage)   ; successor relation for explicit stage progression
    (current ?s - stage)            ; the unique current stage
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (current ?s))
      (current ?s2)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (current ?s))
      (current ?s2)
      (clear ?from)
      (not (clear ?to))
    )
  )
)