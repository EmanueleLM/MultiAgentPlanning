(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:constants left middle right - peg)

  (:predicates
    (on ?d - disk ?x - object)        ; disk directly on another disk or on a peg
    (clear ?x - object)              ; nothing on top of this disk or this peg (peg clear => empty)
    (at ?d - disk ?p - peg)          ; disk currently belongs to peg p (which peg holds the stack containing d)
    (smaller ?d1 - disk ?d2 - disk)  ; d1 is smaller than d2
  )

  ; ---------------------------
  ; Moves initiated by left peg controller (left_peg)
  ; ---------------------------
  (:action left-move-to-middle-onto-peg
    :parameters (?d - disk ?from - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear middle)
      (at ?d left)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d middle)
      (not (clear middle))
      (clear ?from)
      (not (at ?d left))
      (at ?d middle)
      (clear ?d)
    )
  )

  (:action left-move-to-middle-onto-disk
    :parameters (?d - disk ?from - object ?top - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?top)
      (smaller ?d ?top)
      (at ?d left)
      (at ?top middle)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?top)
      (not (clear ?top))
      (clear ?from)
      (not (at ?d left))
      (at ?d middle)
      (clear ?d)
    )
  )

  (:action left-move-to-right-onto-peg
    :parameters (?d - disk ?from - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear right)
      (at ?d left)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d right)
      (not (clear right))
      (clear ?from)
      (not (at ?d left))
      (at ?d right)
      (clear ?d)
    )
  )

  (:action left-move-to-right-onto-disk
    :parameters (?d - disk ?from - object ?top - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?top)
      (smaller ?d ?top)
      (at ?d left)
      (at ?top right)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?top)
      (not (clear ?top))
      (clear ?from)
      (not (at ?d left))
      (at ?d right)
      (clear ?d)
    )
  )

  ; ---------------------------
  ; Moves initiated by middle peg controller (middle_peg)
  ; ---------------------------
  (:action middle-move-to-left-onto-peg
    :parameters (?d - disk ?from - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear left)
      (at ?d middle)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d left)
      (not (clear left))
      (clear ?from)
      (not (at ?d middle))
      (at ?d left)
      (clear ?d)
    )
  )

  (:action middle-move-to-left-onto-disk
    :parameters (?d - disk ?from - object ?top - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?top)
      (smaller ?d ?top)
      (at ?d middle)
      (at ?top left)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?top)
      (not (clear ?top))
      (clear ?from)
      (not (at ?d middle))
      (at ?d left)
      (clear ?d)
    )
  )

  (:action middle-move-to-right-onto-peg
    :parameters (?d - disk ?from - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear right)
      (at ?d middle)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d right)
      (not (clear right))
      (clear ?from)
      (not (at ?d middle))
      (at ?d right)
      (clear ?d)
    )
  )

  (:action middle-move-to-right-onto-disk
    :parameters (?d - disk ?from - object ?top - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?top)
      (smaller ?d ?top)
      (at ?d middle)
      (at ?top right)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?top)
      (not (clear ?top))
      (clear ?from)
      (not (at ?d middle))
      (at ?d right)
      (clear ?d)
    )
  )

  ; ---------------------------
  ; Moves initiated by right peg controller (right_peg)
  ; ---------------------------
  (:action right-move-to-left-onto-peg
    :parameters (?d - disk ?from - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear left)
      (at ?d right)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d left)
      (not (clear left))
      (clear ?from)
      (not (at ?d right))
      (at ?d left)
      (clear ?d)
    )
  )

  (:action right-move-to-left-onto-disk
    :parameters (?d - disk ?from - object ?top - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?top)
      (smaller ?d ?top)
      (at ?d right)
      (at ?top left)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?top)
      (not (clear ?top))
      (clear ?from)
      (not (at ?d right))
      (at ?d left)
      (clear ?d)
    )
  )

  (:action right-move-to-middle-onto-peg
    :parameters (?d - disk ?from - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear middle)
      (at ?d right)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d middle)
      (not (clear middle))
      (clear ?from)
      (not (at ?d right))
      (at ?d middle)
      (clear ?d)
    )
  )

  (:action right-move-to-middle-onto-disk
    :parameters (?d - disk ?from - object ?top - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?top)
      (smaller ?d ?top)
      (at ?d right)
      (at ?top middle)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?top)
      (not (clear ?top))
      (clear ?from)
      (not (at ?d right))
      (at ?d middle)
      (clear ?d)
    )
  )
)