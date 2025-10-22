(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:constants left middle right - peg)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?a - disk ?b - disk)
  )

  (:action move-left-to-middle-onto-peg
    :parameters (?d - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear middle)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d middle)
      (not (clear middle))
      (clear ?from)
    )
  )

  (:action move-left-to-middle-onto-disk
    :parameters (?d - disk ?t - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?t middle)
      (clear ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
    )
  )

  (:action move-left-to-right-onto-peg
    :parameters (?d - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear right)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d right)
      (not (clear right))
      (clear ?from)
    )
  )

  (:action move-left-to-right-onto-disk
    :parameters (?d - disk ?t - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?t right)
      (clear ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
    )
  )

  (:action move-middle-to-left-onto-peg
    :parameters (?d - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear left)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d left)
      (not (clear left))
      (clear ?from)
    )
  )

  (:action move-middle-to-left-onto-disk
    :parameters (?d - disk ?t - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?t left)
      (clear ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
    )
  )

  (:action move-middle-to-right-onto-peg
    :parameters (?d - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear right)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d right)
      (not (clear right))
      (clear ?from)
    )
  )

  (:action move-middle-to-right-onto-disk
    :parameters (?d - disk ?t - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?t right)
      (clear ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
    )
  )

  (:action move-right-to-left-onto-peg
    :parameters (?d - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear left)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d left)
      (not (clear left))
      (clear ?from)
    )
  )

  (:action move-right-to-left-onto-disk
    :parameters (?d - disk ?t - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?t left)
      (clear ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
    )
  )

  (:action move-right-to-middle-onto-peg
    :parameters (?d - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear middle)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d middle)
      (not (clear middle))
      (clear ?from)
    )
  )

  (:action move-right-to-middle-onto-disk
    :parameters (?d - disk ?t - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?t middle)
      (clear ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
    )
  )
)