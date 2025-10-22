(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Moves from LEFT
  (:action move-left-middle-empty
    :parameters (?d - disk)
    :precondition (and (on ?d left) (clear ?d) (clear middle))
    :effect (and
      (not (on ?d left))
      (on ?d middle)
      (clear left)
      (not (clear middle))
      (clear ?d)
    )
  )

  (:action move-left-middle-on
    :parameters (?d - disk ?t - disk)
    :precondition (and (on ?d left) (clear ?d) (on ?t middle) (clear ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d left))
      (on ?d ?t)
      (clear left)
      (not (clear ?t))
      (clear ?d)
    )
  )

  (:action move-left-right-empty
    :parameters (?d - disk)
    :precondition (and (on ?d left) (clear ?d) (clear right))
    :effect (and
      (not (on ?d left))
      (on ?d right)
      (clear left)
      (not (clear right))
      (clear ?d)
    )
  )

  (:action move-left-right-on
    :parameters (?d - disk ?t - disk)
    :precondition (and (on ?d left) (clear ?d) (on ?t right) (clear ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d left))
      (on ?d ?t)
      (clear left)
      (not (clear ?t))
      (clear ?d)
    )
  )

  ;; Moves from MIDDLE
  (:action move-middle-left-empty
    :parameters (?d - disk)
    :precondition (and (on ?d middle) (clear ?d) (clear left))
    :effect (and
      (not (on ?d middle))
      (on ?d left)
      (clear middle)
      (not (clear left))
      (clear ?d)
    )
  )

  (:action move-middle-left-on
    :parameters (?d - disk ?t - disk)
    :precondition (and (on ?d middle) (clear ?d) (on ?t left) (clear ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d middle))
      (on ?d ?t)
      (clear middle)
      (not (clear ?t))
      (clear ?d)
    )
  )

  (:action move-middle-right-empty
    :parameters (?d - disk)
    :precondition (and (on ?d middle) (clear ?d) (clear right))
    :effect (and
      (not (on ?d middle))
      (on ?d right)
      (clear middle)
      (not (clear right))
      (clear ?d)
    )
  )

  (:action move-middle-right-on
    :parameters (?d - disk ?t - disk)
    :precondition (and (on ?d middle) (clear ?d) (on ?t right) (clear ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d middle))
      (on ?d ?t)
      (clear middle)
      (not (clear ?t))
      (clear ?d)
    )
  )

  ;; Moves from RIGHT
  (:action move-right-left-empty
    :parameters (?d - disk)
    :precondition (and (on ?d right) (clear ?d) (clear left))
    :effect (and
      (not (on ?d right))
      (on ?d left)
      (clear right)
      (not (clear left))
      (clear ?d)
    )
  )

  (:action move-right-left-on
    :parameters (?d - disk ?t - disk)
    :precondition (and (on ?d right) (clear ?d) (on ?t left) (clear ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d right))
      (on ?d ?t)
      (clear right)
      (not (clear ?t))
      (clear ?d)
    )
  )

  (:action move-right-middle-empty
    :parameters (?d - disk)
    :precondition (and (on ?d right) (clear ?d) (clear middle))
    :effect (and
      (not (on ?d right))
      (on ?d middle)
      (clear right)
      (not (clear middle))
      (clear ?d)
    )
  )

  (:action move-right-middle-on
    :parameters (?d - disk ?t - disk)
    :precondition (and (on ?d right) (clear ?d) (on ?t middle) (clear ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d right))
      (on ?d ?t)
      (clear right)
      (not (clear ?t))
      (clear ?d)
    )
  )
)