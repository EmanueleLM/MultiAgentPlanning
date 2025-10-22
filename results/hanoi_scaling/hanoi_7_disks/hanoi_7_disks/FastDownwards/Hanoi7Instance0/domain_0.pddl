(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on ?d - disk ?s - object)      ; disk ?d is directly on support ?s (disk or peg)
    (clear ?s - object)            ; support ?s has no disk on top
    (smaller ?x - disk ?y - disk)  ; ?x is smaller than ?y
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - object ?p - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (not (clear ?p))
      (clear ?from)
    )
  )

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
      (not (clear ?to))
      (clear ?from)
    )
  )
)