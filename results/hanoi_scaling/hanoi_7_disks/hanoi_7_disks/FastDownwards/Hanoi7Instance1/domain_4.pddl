(define (domain hanoi7)
  (:requirements :strips :typing)
  (:types disk peg - place)

  (:constants left middle right - peg)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?a - disk ?b - disk)
  )

  (:action move-left-to-middle-onto-peg
    :parameters (?d - disk)
    :precondition (and
      (on ?d left)
      (clear ?d)
      (clear middle)
    )
    :effect (and
      (not (on ?d left))
      (on ?d middle)
      (not (clear middle))
      (clear left)
    )
  )

  (:action move-left-to-middle-onto-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (on ?d left)
      (on ?t middle)
      (clear ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d left))
      (on ?d ?t)
      (not (clear ?t))
      (clear left)
    )
  )

  (:action move-left-to-right-onto-peg
    :parameters (?d - disk)
    :precondition (and
      (on ?d left)
      (clear ?d)
      (clear right)
    )
    :effect (and
      (not (on ?d left))
      (on ?d right)
      (not (clear right))
      (clear left)
    )
  )

  (:action move-left-to-right-onto-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (on ?d left)
      (on ?t right)
      (clear ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d left))
      (on ?d ?t)
      (not (clear ?t))
      (clear left)
    )
  )

  (:action move-middle-to-left-onto-peg
    :parameters (?d - disk)
    :precondition (and
      (on ?d middle)
      (clear ?d)
      (clear left)
    )
    :effect (and
      (not (on ?d middle))
      (on ?d left)
      (not (clear left))
      (clear middle)
    )
  )

  (:action move-middle-to-left-onto-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (on ?d middle)
      (on ?t left)
      (clear ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d middle))
      (on ?d ?t)
      (not (clear ?t))
      (clear middle)
    )
  )

  (:action move-middle-to-right-onto-peg
    :parameters (?d - disk)
    :precondition (and
      (on ?d middle)
      (clear ?d)
      (clear right)
    )
    :effect (and
      (not (on ?d middle))
      (on ?d right)
      (not (clear right))
      (clear middle)
    )
  )

  (:action move-middle-to-right-onto-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (on ?d middle)
      (on ?t right)
      (clear ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d middle))
      (on ?d ?t)
      (not (clear ?t))
      (clear middle)
    )
  )

  (:action move-right-to-left-onto-peg
    :parameters (?d - disk)
    :precondition (and
      (on ?d right)
      (clear ?d)
      (clear left)
    )
    :effect (and
      (not (on ?d right))
      (on ?d left)
      (not (clear left))
      (clear right)
    )
  )

  (:action move-right-to-left-onto-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (on ?d right)
      (on ?t left)
      (clear ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d right))
      (on ?d ?t)
      (not (clear ?t))
      (clear right)
    )
  )

  (:action move-right-to-middle-onto-peg
    :parameters (?d - disk)
    :precondition (and
      (on ?d right)
      (clear ?d)
      (clear middle)
    )
    :effect (and
      (not (on ?d right))
      (on ?d middle)
      (not (clear middle))
      (clear right)
    )
  )

  (:action move-right-to-middle-onto-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (on ?d right)
      (on ?t middle)
      (clear ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d right))
      (on ?d ?t)
      (not (clear ?t))
      (clear right)
    )
  )
)