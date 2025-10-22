(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?a - disk ?b - disk)
    (root ?d - disk ?peg - peg)
  )

  ;; Moves from LEFT
  (:action left_move_to_middle_onto_peg
    :parameters (?d - disk ?from - place ?old - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear middle)
      (root ?d left)
      (root ?d ?old)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d middle)
      (clear ?from)
      (not (clear middle))
      (clear ?d)
      (not (root ?d ?old))
      (root ?d middle)
    )
  )

  (:action left_move_to_middle_onto_disk
    :parameters (?d - disk ?from - place ?t - disk ?new - peg ?old - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (root ?d left)
      (root ?t ?new)
      (root ?d ?old)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
      (clear ?d)
      (not (root ?d ?old))
      (root ?d ?new)
    )
  )

  (:action left_move_to_right_onto_peg
    :parameters (?d - disk ?from - place ?old - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear right)
      (root ?d left)
      (root ?d ?old)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d right)
      (clear ?from)
      (not (clear right))
      (clear ?d)
      (not (root ?d ?old))
      (root ?d right)
    )
  )

  (:action left_move_to_right_onto_disk
    :parameters (?d - disk ?from - place ?t - disk ?new - peg ?old - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (root ?d left)
      (root ?t ?new)
      (root ?d ?old)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
      (clear ?d)
      (not (root ?d ?old))
      (root ?d ?new)
    )
  )

  ;; Moves from MIDDLE
  (:action middle_move_to_left_onto_peg
    :parameters (?d - disk ?from - place ?old - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear left)
      (root ?d middle)
      (root ?d ?old)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d left)
      (clear ?from)
      (not (clear left))
      (clear ?d)
      (not (root ?d ?old))
      (root ?d left)
    )
  )

  (:action middle_move_to_left_onto_disk
    :parameters (?d - disk ?from - place ?t - disk ?new - peg ?old - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (root ?d middle)
      (root ?t ?new)
      (root ?d ?old)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
      (clear ?d)
      (not (root ?d ?old))
      (root ?d ?new)
    )
  )

  (:action middle_move_to_right_onto_peg
    :parameters (?d - disk ?from - place ?old - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear right)
      (root ?d middle)
      (root ?d ?old)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d right)
      (clear ?from)
      (not (clear right))
      (clear ?d)
      (not (root ?d ?old))
      (root ?d right)
    )
  )

  (:action middle_move_to_right_onto_disk
    :parameters (?d - disk ?from - place ?t - disk ?new - peg ?old - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (root ?d middle)
      (root ?t ?new)
      (root ?d ?old)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
      (clear ?d)
      (not (root ?d ?old))
      (root ?d ?new)
    )
  )

  ;; Moves from RIGHT
  (:action right_move_to_left_onto_peg
    :parameters (?d - disk ?from - place ?old - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear left)
      (root ?d right)
      (root ?d ?old)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d left)
      (clear ?from)
      (not (clear left))
      (clear ?d)
      (not (root ?d ?old))
      (root ?d left)
    )
  )

  (:action right_move_to_left_onto_disk
    :parameters (?d - disk ?from - place ?t - disk ?new - peg ?old - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (root ?d right)
      (root ?t ?new)
      (root ?d ?old)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
      (clear ?d)
      (not (root ?d ?old))
      (root ?d ?new)
    )
  )

  (:action right_move_to_middle_onto_peg
    :parameters (?d - disk ?from - place ?old - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear middle)
      (root ?d right)
      (root ?d ?old)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d middle)
      (clear ?from)
      (not (clear middle))
      (clear ?d)
      (not (root ?d ?old))
      (root ?d middle)
    )
  )

  (:action right_move_to_middle_onto_disk
    :parameters (?d - disk ?from - place ?t - disk ?new - peg ?old - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (root ?d right)
      (root ?t ?new)
      (root ?d ?old)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
      (clear ?d)
      (not (root ?d ?old))
      (root ?d ?new)
    )
  )
)