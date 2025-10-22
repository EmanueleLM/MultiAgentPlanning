(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:constants left middle right - peg)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?x - disk ?y - disk)
    (at ?d - disk ?p - peg)
  )

  (:action move-left-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (at ?d left) (clear ?d) (clear ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?d left))
      (at ?d ?to)
    )
  )

  (:action move-left-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?topeg - peg)
    :precondition (and (on ?d ?from) (at ?d left) (clear ?d) (clear ?to) (smaller ?d ?to) (at ?to ?topeg))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?d left))
      (at ?d ?topeg)
    )
  )

  (:action move-middle-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (at ?d middle) (clear ?d) (clear ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?d middle))
      (at ?d ?to)
    )
  )

  (:action move-middle-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?topeg - peg)
    :precondition (and (on ?d ?from) (at ?d middle) (clear ?d) (clear ?to) (smaller ?d ?to) (at ?to ?topeg))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?d middle))
      (at ?d ?topeg)
    )
  )

  (:action move-right-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (at ?d right) (clear ?d) (clear ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?d right))
      (at ?d ?to)
    )
  )

  (:action move-right-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?topeg - peg)
    :precondition (and (on ?d ?from) (at ?d right) (clear ?d) (clear ?to) (smaller ?d ?to) (at ?to ?topeg))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?d right))
      (at ?d ?topeg)
    )
  )
)