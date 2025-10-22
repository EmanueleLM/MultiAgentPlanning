(define (domain hanoi8)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk is directly on the peg (bottom-most on that peg)
    (on-disk ?d - disk ?below - disk) ; disk is directly on another disk
    (top-of-peg ?d - disk ?p - peg)   ; disk is the current top disk on the peg
    (empty ?p - peg)                  ; peg has no disks
    (smaller-than ?a - disk ?b - disk) ; size ordering: ?a is strictly smaller than ?b
  )

  ; ============================
  ; Move actions for each directed peg pair.
  ; Four variants per ordered pair:
  ;  - moving a disk that was directly on the source peg (on-peg) to an empty destination
  ;  - moving a disk that was directly on the source peg to a non-empty destination (with explicit dest top)
  ;  - moving a disk that was on another disk (on-disk) to an empty destination
  ;  - moving a disk that was on another disk to a non-empty destination (with explicit dest top)
  ; These are STRIPS actions (no conditional effects, no quantifiers).
  ; ============================

  ;; =================
  ;; Moves: left -> middle
  ;; =================
  (:action move-left-middle-peg-bottom-to-empty
    :parameters (?d - disk)
    :precondition (and
      (top-of-peg ?d left)
      (on-peg ?d left)
      (empty middle)
    )
    :effect (and
      (not (top-of-peg ?d left))
      (not (on-peg ?d left))
      (not (empty middle))
      (on-peg ?d middle)
      (top-of-peg ?d middle)
      (empty left)
    )
  )

  (:action move-left-middle-peg-bottom-to-nonempty
    :parameters (?d - disk ?dtop - disk)
    :precondition (and
      (top-of-peg ?d left)
      (on-peg ?d left)
      (top-of-peg ?dtop middle)
      (smaller-than ?d ?dtop)
    )
    :effect (and
      (not (top-of-peg ?d left))
      (not (on-peg ?d left))
      (not (top-of-peg ?dtop middle))
      (on-disk ?d ?dtop)
      (top-of-peg ?d middle)
      (empty left)
    )
  )

  (:action move-left-middle-on-disk-to-empty
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top-of-peg ?d left)
      (on-disk ?d ?below)
      (empty middle)
    )
    :effect (and
      (not (top-of-peg ?d left))
      (not (on-disk ?d ?below))
      (top-of-peg ?below left)
      (not (empty middle))
      (on-peg ?d middle)
      (top-of-peg ?d middle)
    )
  )

  (:action move-left-middle-on-disk-to-nonempty
    :parameters (?d - disk ?below - disk ?dtop - disk)
    :precondition (and
      (top-of-peg ?d left)
      (on-disk ?d ?below)
      (top-of-peg ?dtop middle)
      (smaller-than ?d ?dtop)
    )
    :effect (and
      (not (top-of-peg ?d left))
      (not (on-disk ?d ?below))
      (top-of-peg ?below left)
      (not (top-of-peg ?dtop middle))
      (on-disk ?d ?dtop)
      (top-of-peg ?d middle)
    )
  )

  ;; =================
  ;; Moves: left -> right
  ;; =================
  (:action move-left-right-peg-bottom-to-empty
    :parameters (?d - disk)
    :precondition (and
      (top-of-peg ?d left)
      (on-peg ?d left)
      (empty right)
    )
    :effect (and
      (not (top-of-peg ?d left))
      (not (on-peg ?d left))
      (not (empty right))
      (on-peg ?d right)
      (top-of-peg ?d right)
      (empty left)
    )
  )

  (:action move-left-right-peg-bottom-to-nonempty
    :parameters (?d - disk ?dtop - disk)
    :precondition (and
      (top-of-peg ?d left)
      (on-peg ?d left)
      (top-of-peg ?dtop right)
      (smaller-than ?d ?dtop)
    )
    :effect (and
      (not (top-of-peg ?d left))
      (not (on-peg ?d left))
      (not (top-of-peg ?dtop right))
      (on-disk ?d ?dtop)
      (top-of-peg ?d right)
      (empty left)
    )
  )

  (:action move-left-right-on-disk-to-empty
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top-of-peg ?d left)
      (on-disk ?d ?below)
      (empty right)
    )
    :effect (and
      (not (top-of-peg ?d left))
      (not (on-disk ?d ?below))
      (top-of-peg ?below left)
      (not (empty right))
      (on-peg ?d right)
      (top-of-peg ?d right)
    )
  )

  (:action move-left-right-on-disk-to-nonempty
    :parameters (?d - disk ?below - disk ?dtop - disk)
    :precondition (and
      (top-of-peg ?d left)
      (on-disk ?d ?below)
      (top-of-peg ?dtop right)
      (smaller-than ?d ?dtop)
    )
    :effect (and
      (not (top-of-peg ?d left))
      (not (on-disk ?d ?below))
      (top-of-peg ?below left)
      (not (top-of-peg ?dtop right))
      (on-disk ?d ?dtop)
      (top-of-peg ?d right)
    )
  )

  ;; =================
  ;; Moves: middle -> left
  ;; =================
  (:action move-middle-left-peg-bottom-to-empty
    :parameters (?d - disk)
    :precondition (and
      (top-of-peg ?d middle)
      (on-peg ?d middle)
      (empty left)
    )
    :effect (and
      (not (top-of-peg ?d middle))
      (not (on-peg ?d middle))
      (not (empty left))
      (on-peg ?d left)
      (top-of-peg ?d left)
      (empty middle)
    )
  )

  (:action move-middle-left-peg-bottom-to-nonempty
    :parameters (?d - disk ?dtop - disk)
    :precondition (and
      (top-of-peg ?d middle)
      (on-peg ?d middle)
      (top-of-peg ?dtop left)
      (smaller-than ?d ?dtop)
    )
    :effect (and
      (not (top-of-peg ?d middle))
      (not (on-peg ?d middle))
      (not (top-of-peg ?dtop left))
      (on-disk ?d ?dtop)
      (top-of-peg ?d left)
      (empty middle)
    )
  )

  (:action move-middle-left-on-disk-to-empty
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top-of-peg ?d middle)
      (on-disk ?d ?below)
      (empty left)
    )
    :effect (and
      (not (top-of-peg ?d middle))
      (not (on-disk ?d ?below))
      (top-of-peg ?below middle)
      (not (empty left))
      (on-peg ?d left)
      (top-of-peg ?d left)
    )
  )

  (:action move-middle-left-on-disk-to-nonempty
    :parameters (?d - disk ?below - disk ?dtop - disk)
    :precondition (and
      (top-of-peg ?d middle)
      (on-disk ?d ?below)
      (top-of-peg ?dtop left)
      (smaller-than ?d ?dtop)
    )
    :effect (and
      (not (top-of-peg ?d middle))
      (not (on-disk ?d ?below))
      (top-of-peg ?below middle)
      (not (top-of-peg ?dtop left))
      (on-disk ?d ?dtop)
      (top-of-peg ?d left)
    )
  )

  ;; =================
  ;; Moves: middle -> right
  ;; =================
  (:action move-middle-right-peg-bottom-to-empty
    :parameters (?d - disk)
    :precondition (and
      (top-of-peg ?d middle)
      (on-peg ?d middle)
      (empty right)
    )
    :effect (and
      (not (top-of-peg ?d middle))
      (not (on-peg ?d middle))
      (not (empty right))
      (on-peg ?d right)
      (top-of-peg ?d right)
      (empty middle)
    )
  )

  (:action move-middle-right-peg-bottom-to-nonempty
    :parameters (?d - disk ?dtop - disk)
    :precondition (and
      (top-of-peg ?d middle)
      (on-peg ?d middle)
      (top-of-peg ?dtop right)
      (smaller-than ?d ?dtop)
    )
    :effect (and
      (not (top-of-peg ?d middle))
      (not (on-peg ?d middle))
      (not (top-of-peg ?dtop right))
      (on-disk ?d ?dtop)
      (top-of-peg ?d right)
      (empty middle)
    )
  )

  (:action move-middle-right-on-disk-to-empty
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top-of-peg ?d middle)
      (on-disk ?d ?below)
      (empty right)
    )
    :effect (and
      (not (top-of-peg ?d middle))
      (not (on-disk ?d ?below))
      (top-of-peg ?below middle)
      (not (empty right))
      (on-peg ?d right)
      (top-of-peg ?d right)
    )
  )

  (:action move-middle-right-on-disk-to-nonempty
    :parameters (?d - disk ?below - disk ?dtop - disk)
    :precondition (and
      (top-of-peg ?d middle)
      (on-disk ?d ?below)
      (top-of-peg ?dtop right)
      (smaller-than ?d ?dtop)
    )
    :effect (and
      (not (top-of-peg ?d middle))
      (not (on-disk ?d ?below))
      (top-of-peg ?below middle)
      (not (top-of-peg ?dtop right))
      (on-disk ?d ?dtop)
      (top-of-peg ?d right)
    )
  )

  ;; =================
  ;; Moves: right -> left
  ;; =================
  (:action move-right-left-peg-bottom-to-empty
    :parameters (?d - disk)
    :precondition (and
      (top-of-peg ?d right)
      (on-peg ?d right)
      (empty left)
    )
    :effect (and
      (not (top-of-peg ?d right))
      (not (on-peg ?d right))
      (not (empty left))
      (on-peg ?d left)
      (top-of-peg ?d left)
      (empty right)
    )
  )

  (:action move-right-left-peg-bottom-to-nonempty
    :parameters (?d - disk ?dtop - disk)
    :precondition (and
      (top-of-peg ?d right)
      (on-peg ?d right)
      (top-of-peg ?dtop left)
      (smaller-than ?d ?dtop)
    )
    :effect (and
      (not (top-of-peg ?d right))
      (not (on-peg ?d right))
      (not (top-of-peg ?dtop left))
      (on-disk ?d ?dtop)
      (top-of-peg ?d left)
      (empty right)
    )
  )

  (:action move-right-left-on-disk-to-empty
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top-of-peg ?d right)
      (on-disk ?d ?below)
      (empty left)
    )
    :effect (and
      (not (top-of-peg ?d right))
      (not (on-disk ?d ?below))
      (top-of-peg ?below right)
      (not (empty left))
      (on-peg ?d left)
      (top-of-peg ?d left)
    )
  )

  (:action move-right-left-on-disk-to-nonempty
    :parameters (?d - disk ?below - disk ?dtop - disk)
    :precondition (and
      (top-of-peg ?d right)
      (on-disk ?d ?below)
      (top-of-peg ?dtop left)
      (smaller-than ?d ?dtop)
    )
    :effect (and
      (not (top-of-peg ?d right))
      (not (on-disk ?d ?below))
      (top-of-peg ?below right)
      (not (top-of-peg ?dtop left))
      (on-disk ?d ?dtop)
      (top-of-peg ?d left)
    )
  )

  ;; =================
  ;; Moves: right -> middle
  ;; =================
  (:action move-right-middle-peg-bottom-to-empty
    :parameters (?d - disk)
    :precondition (and
      (top-of-peg ?d right)
      (on-peg ?d right)
      (empty middle)
    )
    :effect (and
      (not (top-of-peg ?d right))
      (not (on-peg ?d right))
      (not (empty middle))
      (on-peg ?d middle)
      (top-of-peg ?d middle)
      (empty right)
    )
  )

  (:action move-right-middle-peg-bottom-to-nonempty
    :parameters (?d - disk ?dtop - disk)
    :precondition (and
      (top-of-peg ?d right)
      (on-peg ?d right)
      (top-of-peg ?dtop middle)
      (smaller-than ?d ?dtop)
    )
    :effect (and
      (not (top-of-peg ?d right))
      (not (on-peg ?d right))
      (not (top-of-peg ?dtop middle))
      (on-disk ?d ?dtop)
      (top-of-peg ?d middle)
      (empty right)
    )
  )

  (:action move-right-middle-on-disk-to-empty
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top-of-peg ?d right)
      (on-disk ?d ?below)
      (empty middle)
    )
    :effect (and
      (not (top-of-peg ?d right))
      (not (on-disk ?d ?below))
      (top-of-peg ?below right)
      (not (empty middle))
      (on-peg ?d middle)
      (top-of-peg ?d middle)
    )
  )

  (:action move-right-middle-on-disk-to-nonempty
    :parameters (?d - disk ?below - disk ?dtop - disk)
    :precondition (and
      (top-of-peg ?d right)
      (on-disk ?d ?below)
      (top-of-peg ?dtop middle)
      (smaller-than ?d ?dtop)
    )
    :effect (and
      (not (top-of-peg ?d right))
      (not (on-disk ?d ?below))
      (top-of-peg ?below right)
      (not (top-of-peg ?dtop middle))
      (on-disk ?d ?dtop)
      (top-of-peg ?d middle)
    )
  )

)