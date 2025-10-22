(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg (bottom disk if stack)
    (on-disk ?d - disk ?below - disk) ; disk directly on top of another disk
    (at ?d - disk ?p - peg)           ; disk belongs to peg (somewhere in that peg's stack)
    (clear ?d - disk)                 ; nothing on top of this disk
    (empty ?p - peg)                  ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)   ; d1 is smaller than d2
  )

  ; ---------------------------
  ; Moves from left -> middle
  ; ---------------------------
  (:action move-left-peg-to-middle-empty
    :parameters (?d - disk)
    :precondition (and (on-peg ?d left) (clear ?d) (empty middle))
    :effect (and
      (not (on-peg ?d left))
      (on-peg ?d middle)
      (not (at ?d left))
      (at ?d middle)
      (not (empty middle))
      (empty left)
      (clear ?d)
    )
  )

  (:action move-left-peg-to-middle-onto
    :parameters (?d - disk ?top - disk)
    :precondition (and (on-peg ?d left) (clear ?d) (clear ?top) (at ?top middle) (smaller ?d ?top))
    :effect (and
      (not (on-peg ?d left))
      (on-disk ?d ?top)
      (not (at ?d left))
      (at ?d middle)
      (not (clear ?top))
      (clear ?d)
      (not (empty middle))
      (empty left)
    )
  )

  (:action move-left-disk-to-middle-empty
    :parameters (?d - disk ?below - disk)
    :precondition (and (on-disk ?d ?below) (clear ?d) (empty middle) (at ?d left))
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d middle)
      (not (at ?d left))
      (at ?d middle)
      (clear ?below)
      (not (empty middle))
      (clear ?d)
    )
  )

  (:action move-left-disk-to-middle-onto
    :parameters (?d - disk ?below - disk ?top - disk)
    :precondition (and (on-disk ?d ?below) (clear ?d) (clear ?top) (at ?d left) (at ?top middle) (smaller ?d ?top))
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?top)
      (not (clear ?top))
      (clear ?below)
      (not (at ?d left))
      (at ?d middle)
      (clear ?d)
    )
  )

  ; ---------------------------
  ; Moves from left -> right
  ; ---------------------------
  (:action move-left-peg-to-right-empty
    :parameters (?d - disk)
    :precondition (and (on-peg ?d left) (clear ?d) (empty right))
    :effect (and
      (not (on-peg ?d left))
      (on-peg ?d right)
      (not (at ?d left))
      (at ?d right)
      (not (empty right))
      (empty left)
      (clear ?d)
    )
  )

  (:action move-left-peg-to-right-onto
    :parameters (?d - disk ?top - disk)
    :precondition (and (on-peg ?d left) (clear ?d) (clear ?top) (at ?top right) (smaller ?d ?top))
    :effect (and
      (not (on-peg ?d left))
      (on-disk ?d ?top)
      (not (at ?d left))
      (at ?d right)
      (not (clear ?top))
      (clear ?d)
      (not (empty right))
      (empty left)
    )
  )

  (:action move-left-disk-to-right-empty
    :parameters (?d - disk ?below - disk)
    :precondition (and (on-disk ?d ?below) (clear ?d) (empty right) (at ?d left))
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d right)
      (not (at ?d left))
      (at ?d right)
      (clear ?below)
      (not (empty right))
      (clear ?d)
    )
  )

  (:action move-left-disk-to-right-onto
    :parameters (?d - disk ?below - disk ?top - disk)
    :precondition (and (on-disk ?d ?below) (clear ?d) (clear ?top) (at ?d left) (at ?top right) (smaller ?d ?top))
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?top)
      (not (clear ?top))
      (clear ?below)
      (not (at ?d left))
      (at ?d right)
      (clear ?d)
    )
  )

  ; ---------------------------
  ; Moves from middle -> left
  ; ---------------------------
  (:action move-middle-peg-to-left-empty
    :parameters (?d - disk)
    :precondition (and (on-peg ?d middle) (clear ?d) (empty left))
    :effect (and
      (not (on-peg ?d middle))
      (on-peg ?d left)
      (not (at ?d middle))
      (at ?d left)
      (not (empty left))
      (empty middle)
      (clear ?d)
    )
  )

  (:action move-middle-peg-to-left-onto
    :parameters (?d - disk ?top - disk)
    :precondition (and (on-peg ?d middle) (clear ?d) (clear ?top) (at ?top left) (smaller ?d ?top))
    :effect (and
      (not (on-peg ?d middle))
      (on-disk ?d ?top)
      (not (at ?d middle))
      (at ?d left)
      (not (clear ?top))
      (clear ?d)
      (not (empty left))
      (empty middle)
    )
  )

  (:action move-middle-disk-to-left-empty
    :parameters (?d - disk ?below - disk)
    :precondition (and (on-disk ?d ?below) (clear ?d) (empty left) (at ?d middle))
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d left)
      (not (at ?d middle))
      (at ?d left)
      (clear ?below)
      (not (empty left))
      (clear ?d)
    )
  )

  (:action move-middle-disk-to-left-onto
    :parameters (?d - disk ?below - disk ?top - disk)
    :precondition (and (on-disk ?d ?below) (clear ?d) (clear ?top) (at ?d middle) (at ?top left) (smaller ?d ?top))
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?top)
      (not (clear ?top))
      (clear ?below)
      (not (at ?d middle))
      (at ?d left)
      (clear ?d)
    )
  )

  ; ---------------------------
  ; Moves from middle -> right
  ; ---------------------------
  (:action move-middle-peg-to-right-empty
    :parameters (?d - disk)
    :precondition (and (on-peg ?d middle) (clear ?d) (empty right))
    :effect (and
      (not (on-peg ?d middle))
      (on-peg ?d right)
      (not (at ?d middle))
      (at ?d right)
      (not (empty right))
      (empty middle)
      (clear ?d)
    )
  )

  (:action move-middle-peg-to-right-onto
    :parameters (?d - disk ?top - disk)
    :precondition (and (on-peg ?d middle) (clear ?d) (clear ?top) (at ?top right) (smaller ?d ?top))
    :effect (and
      (not (on-peg ?d middle))
      (on-disk ?d ?top)
      (not (at ?d middle))
      (at ?d right)
      (not (clear ?top))
      (clear ?d)
      (not (empty right))
      (empty middle)
    )
  )

  (:action move-middle-disk-to-right-empty
    :parameters (?d - disk ?below - disk)
    :precondition (and (on-disk ?d ?below) (clear ?d) (empty right) (at ?d middle))
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d right)
      (not (at ?d middle))
      (at ?d right)
      (clear ?below)
      (not (empty right))
      (clear ?d)
    )
  )

  (:action move-middle-disk-to-right-onto
    :parameters (?d - disk ?below - disk ?top - disk)
    :precondition (and (on-disk ?d ?below) (clear ?d) (clear ?top) (at ?d middle) (at ?top right) (smaller ?d ?top))
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?top)
      (not (clear ?top))
      (clear ?below)
      (not (at ?d middle))
      (at ?d right)
      (clear ?d)
    )
  )

  ; ---------------------------
  ; Moves from right -> left
  ; ---------------------------
  (:action move-right-peg-to-left-empty
    :parameters (?d - disk)
    :precondition (and (on-peg ?d right) (clear ?d) (empty left))
    :effect (and
      (not (on-peg ?d right))
      (on-peg ?d left)
      (not (at ?d right))
      (at ?d left)
      (not (empty left))
      (empty right)
      (clear ?d)
    )
  )

  (:action move-right-peg-to-left-onto
    :parameters (?d - disk ?top - disk)
    :precondition (and (on-peg ?d right) (clear ?d) (clear ?top) (at ?top left) (smaller ?d ?top))
    :effect (and
      (not (on-peg ?d right))
      (on-disk ?d ?top)
      (not (at ?d right))
      (at ?d left)
      (not (clear ?top))
      (clear ?d)
      (not (empty left))
      (empty right)
    )
  )

  (:action move-right-disk-to-left-empty
    :parameters (?d - disk ?below - disk)
    :precondition (and (on-disk ?d ?below) (clear ?d) (empty left) (at ?d right))
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d left)
      (not (at ?d right))
      (at ?d left)
      (clear ?below)
      (not (empty left))
      (clear ?d)
    )
  )

  (:action move-right-disk-to-left-onto
    :parameters (?d - disk ?below - disk ?top - disk)
    :precondition (and (on-disk ?d ?below) (clear ?d) (clear ?top) (at ?d right) (at ?top left) (smaller ?d ?top))
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?top)
      (not (clear ?top))
      (clear ?below)
      (not (at ?d right))
      (at ?d left)
      (clear ?d)
    )
  )

  ; ---------------------------
  ; Moves from right -> middle
  ; ---------------------------
  (:action move-right-peg-to-middle-empty
    :parameters (?d - disk)
    :precondition (and (on-peg ?d right) (clear ?d) (empty middle))
    :effect (and
      (not (on-peg ?d right))
      (on-peg ?d middle)
      (not (at ?d right))
      (at ?d middle)
      (not (empty middle))
      (empty right)
      (clear ?d)
    )
  )

  (:action move-right-peg-to-middle-onto
    :parameters (?d - disk ?top - disk)
    :precondition (and (on-peg ?d right) (clear ?d) (clear ?top) (at ?top middle) (smaller ?d ?top))
    :effect (and
      (not (on-peg ?d right))
      (on-disk ?d ?top)
      (not (at ?d right))
      (at ?d middle)
      (not (clear ?top))
      (clear ?d)
      (not (empty middle))
      (empty right)
    )
  )

  (:action move-right-disk-to-middle-empty
    :parameters (?d - disk ?below - disk)
    :precondition (and (on-disk ?d ?below) (clear ?d) (empty middle) (at ?d right))
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d middle)
      (not (at ?d right))
      (at ?d middle)
      (clear ?below)
      (not (empty middle))
      (clear ?d)
    )
  )

  (:action move-right-disk-to-middle-onto
    :parameters (?d - disk ?below - disk ?top - disk)
    :precondition (and (on-disk ?d ?below) (clear ?d) (clear ?top) (at ?d right) (at ?top middle) (smaller ?d ?top))
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?top)
      (not (clear ?top))
      (clear ?below)
      (not (at ?d right))
      (at ?d middle)
      (clear ?d)
    )
  )
)