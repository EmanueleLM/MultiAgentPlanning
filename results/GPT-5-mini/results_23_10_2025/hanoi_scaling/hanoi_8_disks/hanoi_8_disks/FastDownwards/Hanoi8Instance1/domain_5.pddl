(define (domain tower-of-hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:constants left middle right - peg)
  (:predicates
    (on-disk ?d - disk ?below - disk)   ; ?d is directly on top of ?below
    (on-peg ?d - disk ?p - peg)         ; ?d is directly on peg ?p (bottom disk)
    (top ?d - disk ?p - peg)            ; ?d is the top disk of peg ?p
    (empty ?p - peg)                    ; peg ?p is empty
    (smaller ?d1 - disk ?d2 - disk)     ; disk ?d1 is smaller than disk ?d2
  )

  ;; Moves from left to middle
  (:action move-left-to-middle-empty-from-peg
    :parameters (?d - disk)
    :precondition (and
      (top ?d left)
      (on-peg ?d left)
      (empty middle)
    )
    :effect (and
      (not (top ?d left))
      (not (on-peg ?d left))
      (on-peg ?d middle)
      (top ?d middle)
      (not (empty middle))
      (empty left)
    )
  )

  (:action move-left-to-middle-empty-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top ?d left)
      (on-disk ?d ?below)
      (empty middle)
    )
    :effect (and
      (not (top ?d left))
      (not (on-disk ?d ?below))
      (on-peg ?d middle)
      (top ?d middle)
      (not (empty middle))
      (top ?below left)
    )
  )

  (:action move-left-to-middle-onto-disk-from-peg
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (top ?d left)
      (on-peg ?d left)
      (top ?t middle)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d left))
      (not (on-peg ?d left))
      (on-disk ?d ?t)
      (not (top ?t middle))
      (top ?d middle)
      (empty left)
    )
  )

  (:action move-left-to-middle-onto-disk-from-disk
    :parameters (?d - disk ?t - disk ?below - disk)
    :precondition (and
      (top ?d left)
      (on-disk ?d ?below)
      (top ?t middle)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d left))
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)
      (not (top ?t middle))
      (top ?d middle)
      (top ?below left)
    )
  )

  ;; Moves from left to right
  (:action move-left-to-right-empty-from-peg
    :parameters (?d - disk)
    :precondition (and
      (top ?d left)
      (on-peg ?d left)
      (empty right)
    )
    :effect (and
      (not (top ?d left))
      (not (on-peg ?d left))
      (on-peg ?d right)
      (top ?d right)
      (not (empty right))
      (empty left)
    )
  )

  (:action move-left-to-right-empty-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top ?d left)
      (on-disk ?d ?below)
      (empty right)
    )
    :effect (and
      (not (top ?d left))
      (not (on-disk ?d ?below))
      (on-peg ?d right)
      (top ?d right)
      (not (empty right))
      (top ?below left)
    )
  )

  (:action move-left-to-right-onto-disk-from-peg
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (top ?d left)
      (on-peg ?d left)
      (top ?t right)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d left))
      (not (on-peg ?d left))
      (on-disk ?d ?t)
      (not (top ?t right))
      (top ?d right)
      (empty left)
    )
  )

  (:action move-left-to-right-onto-disk-from-disk
    :parameters (?d - disk ?t - disk ?below - disk)
    :precondition (and
      (top ?d left)
      (on-disk ?d ?below)
      (top ?t right)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d left))
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)
      (not (top ?t right))
      (top ?d right)
      (top ?below left)
    )
  )

  ;; Moves from middle to left
  (:action move-middle-to-left-empty-from-peg
    :parameters (?d - disk)
    :precondition (and
      (top ?d middle)
      (on-peg ?d middle)
      (empty left)
    )
    :effect (and
      (not (top ?d middle))
      (not (on-peg ?d middle))
      (on-peg ?d left)
      (top ?d left)
      (not (empty left))
      (empty middle)
    )
  )

  (:action move-middle-to-left-empty-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top ?d middle)
      (on-disk ?d ?below)
      (empty left)
    )
    :effect (and
      (not (top ?d middle))
      (not (on-disk ?d ?below))
      (on-peg ?d left)
      (top ?d left)
      (not (empty left))
      (top ?below middle)
    )
  )

  (:action move-middle-to-left-onto-disk-from-peg
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (top ?d middle)
      (on-peg ?d middle)
      (top ?t left)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d middle))
      (not (on-peg ?d middle))
      (on-disk ?d ?t)
      (not (top ?t left))
      (top ?d left)
      (empty middle)
    )
  )

  (:action move-middle-to-left-onto-disk-from-disk
    :parameters (?d - disk ?t - disk ?below - disk)
    :precondition (and
      (top ?d middle)
      (on-disk ?d ?below)
      (top ?t left)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d middle))
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)
      (not (top ?t left))
      (top ?d left)
      (top ?below middle)
    )
  )

  ;; Moves from middle to right
  (:action move-middle-to-right-empty-from-peg
    :parameters (?d - disk)
    :precondition (and
      (top ?d middle)
      (on-peg ?d middle)
      (empty right)
    )
    :effect (and
      (not (top ?d middle))
      (not (on-peg ?d middle))
      (on-peg ?d right)
      (top ?d right)
      (not (empty right))
      (empty middle)
    )
  )

  (:action move-middle-to-right-empty-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top ?d middle)
      (on-disk ?d ?below)
      (empty right)
    )
    :effect (and
      (not (top ?d middle))
      (not (on-disk ?d ?below))
      (on-peg ?d right)
      (top ?d right)
      (not (empty right))
      (top ?below middle)
    )
  )

  (:action move-middle-to-right-onto-disk-from-peg
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (top ?d middle)
      (on-peg ?d middle)
      (top ?t right)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d middle))
      (not (on-peg ?d middle))
      (on-disk ?d ?t)
      (not (top ?t right))
      (top ?d right)
      (empty middle)
    )
  )

  (:action move-middle-to-right-onto-disk-from-disk
    :parameters (?d - disk ?t - disk ?below - disk)
    :precondition (and
      (top ?d middle)
      (on-disk ?d ?below)
      (top ?t right)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d middle))
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)
      (not (top ?t right))
      (top ?d right)
      (top ?below middle)
    )
  )

  ;; Moves from right to left
  (:action move-right-to-left-empty-from-peg
    :parameters (?d - disk)
    :precondition (and
      (top ?d right)
      (on-peg ?d right)
      (empty left)
    )
    :effect (and
      (not (top ?d right))
      (not (on-peg ?d right))
      (on-peg ?d left)
      (top ?d left)
      (not (empty left))
      (empty right)
    )
  )

  (:action move-right-to-left-empty-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top ?d right)
      (on-disk ?d ?below)
      (empty left)
    )
    :effect (and
      (not (top ?d right))
      (not (on-disk ?d ?below))
      (on-peg ?d left)
      (top ?d left)
      (not (empty left))
      (top ?below right)
    )
  )

  (:action move-right-to-left-onto-disk-from-peg
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (top ?d right)
      (on-peg ?d right)
      (top ?t left)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d right))
      (not (on-peg ?d right))
      (on-disk ?d ?t)
      (not (top ?t left))
      (top ?d left)
      (empty right)
    )
  )

  (:action move-right-to-left-onto-disk-from-disk
    :parameters (?d - disk ?t - disk ?below - disk)
    :precondition (and
      (top ?d right)
      (on-disk ?d ?below)
      (top ?t left)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d right))
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)
      (not (top ?t left))
      (top ?d left)
      (top ?below right)
    )
  )

  ;; Moves from right to middle
  (:action move-right-to-middle-empty-from-peg
    :parameters (?d - disk)
    :precondition (and
      (top ?d right)
      (on-peg ?d right)
      (empty middle)
    )
    :effect (and
      (not (top ?d right))
      (not (on-peg ?d right))
      (on-peg ?d middle)
      (top ?d middle)
      (not (empty middle))
      (empty right)
    )
  )

  (:action move-right-to-middle-empty-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top ?d right)
      (on-disk ?d ?below)
      (empty middle)
    )
    :effect (and
      (not (top ?d right))
      (not (on-disk ?d ?below))
      (on-peg ?d middle)
      (top ?d middle)
      (not (empty middle))
      (top ?below right)
    )
  )

  (:action move-right-to-middle-onto-disk-from-peg
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (top ?d right)
      (on-peg ?d right)
      (top ?t middle)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d right))
      (not (on-peg ?d right))
      (on-disk ?d ?t)
      (not (top ?t middle))
      (top ?d middle)
      (empty right)
    )
  )

  (:action move-right-to-middle-onto-disk-from-disk
    :parameters (?d - disk ?t - disk ?below - disk)
    :precondition (and
      (top ?d right)
      (on-disk ?d ?below)
      (top ?t middle)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d right))
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)
      (not (top ?t middle))
      (top ?d middle)
      (top ?below right)
    )
  )
)