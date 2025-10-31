(define (domain hanoi7)
  (:requirements :strips :negative-preconditions)
  (:constants left middle right)
  (:predicates
    (on ?d ?p)
    (clear ?p)
    (smaller ?a ?b)
    (at ?d ?p)
  )

  (:action move-left-to-middle-onto-peg
    :parameters (?d ?s)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear middle)
      (at ?d left)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d middle)
      (not (clear middle))
      (clear ?s)
      (not (at ?d left))
      (at ?d middle)
    )
  )

  (:action move-left-to-middle-onto-disk
    :parameters (?d ?s ?t)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (at ?d left)
      (at ?t middle)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?s)
      (not (at ?d left))
      (at ?d middle)
    )
  )

  (:action move-left-to-right-onto-peg
    :parameters (?d ?s)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear right)
      (at ?d left)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d right)
      (not (clear right))
      (clear ?s)
      (not (at ?d left))
      (at ?d right)
    )
  )

  (:action move-left-to-right-onto-disk
    :parameters (?d ?s ?t)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (at ?d left)
      (at ?t right)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?s)
      (not (at ?d left))
      (at ?d right)
    )
  )

  (:action move-middle-to-left-onto-peg
    :parameters (?d ?s)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear left)
      (at ?d middle)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d left)
      (not (clear left))
      (clear ?s)
      (not (at ?d middle))
      (at ?d left)
    )
  )

  (:action move-middle-to-left-onto-disk
    :parameters (?d ?s ?t)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (at ?d middle)
      (at ?t left)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?s)
      (not (at ?d middle))
      (at ?d left)
    )
  )

  (:action move-middle-to-right-onto-peg
    :parameters (?d ?s)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear right)
      (at ?d middle)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d right)
      (not (clear right))
      (clear ?s)
      (not (at ?d middle))
      (at ?d right)
    )
  )

  (:action move-middle-to-right-onto-disk
    :parameters (?d ?s ?t)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (at ?d middle)
      (at ?t right)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?s)
      (not (at ?d middle))
      (at ?d right)
    )
  )

  (:action move-right-to-left-onto-peg
    :parameters (?d ?s)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear left)
      (at ?d right)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d left)
      (not (clear left))
      (clear ?s)
      (not (at ?d right))
      (at ?d left)
    )
  )

  (:action move-right-to-left-onto-disk
    :parameters (?d ?s ?t)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (at ?d right)
      (at ?t left)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?s)
      (not (at ?d right))
      (at ?d left)
    )
  )

  (:action move-right-to-middle-onto-peg
    :parameters (?d ?s)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear middle)
      (at ?d right)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d middle)
      (not (clear middle))
      (clear ?s)
      (not (at ?d right))
      (at ?d middle)
    )
  )

  (:action move-right-to-middle-onto-disk
    :parameters (?d ?s ?t)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (at ?d right)
      (at ?t middle)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?s)
      (not (at ?d right))
      (at ?d middle)
    )
  )
)