(define (domain hanoi7)
  (:requirements :strips :typing)
  (:types disk peg - place)

  (:constants left middle right - peg)

  (:predicates
    (on ?d - disk ?p - place)        ; immediate support: disk or peg
    (clear ?p - place)              ; nothing on top of this place (disk or peg)
    (smaller ?a - disk ?b - disk)   ; a is smaller than b
    (at ?d - disk ?p - peg)         ; disk's current peg (ultimate peg)
  )

  ;; Moves from left to middle
  (:action move-left-to-middle-onto-peg
    :parameters (?d - disk)
    :precondition (and
      (on ?d left)
      (clear ?d)
      (clear middle)
      (at ?d left)
    )
    :effect (and
      (not (on ?d left))
      (on ?d middle)
      (not (clear middle))
      (clear left)
      (not (at ?d left))
      (at ?d middle)
    )
  )

  (:action move-left-to-middle-onto-disk
    :parameters (?d - disk ?s - place ?t - disk)
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

  ;; Moves from left to right
  (:action move-left-to-right-onto-peg
    :parameters (?d - disk)
    :precondition (and
      (on ?d left)
      (clear ?d)
      (clear right)
      (at ?d left)
    )
    :effect (and
      (not (on ?d left))
      (on ?d right)
      (not (clear right))
      (clear left)
      (not (at ?d left))
      (at ?d right)
    )
  )

  (:action move-left-to-right-onto-disk
    :parameters (?d - disk ?s - place ?t - disk)
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

  ;; Moves from middle to left
  (:action move-middle-to-left-onto-peg
    :parameters (?d - disk)
    :precondition (and
      (on ?d middle)
      (clear ?d)
      (clear left)
      (at ?d middle)
    )
    :effect (and
      (not (on ?d middle))
      (on ?d left)
      (not (clear left))
      (clear middle)
      (not (at ?d middle))
      (at ?d left)
    )
  )

  (:action move-middle-to-left-onto-disk
    :parameters (?d - disk ?s - place ?t - disk)
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

  ;; Moves from middle to right
  (:action move-middle-to-right-onto-peg
    :parameters (?d - disk)
    :precondition (and
      (on ?d middle)
      (clear ?d)
      (clear right)
      (at ?d middle)
    )
    :effect (and
      (not (on ?d middle))
      (on ?d right)
      (not (clear right))
      (clear middle)
      (not (at ?d middle))
      (at ?d right)
    )
  )

  (:action move-middle-to-right-onto-disk
    :parameters (?d - disk ?s - place ?t - disk)
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

  ;; Moves from right to left
  (:action move-right-to-left-onto-peg
    :parameters (?d - disk)
    :precondition (and
      (on ?d right)
      (clear ?d)
      (clear left)
      (at ?d right)
    )
    :effect (and
      (not (on ?d right))
      (on ?d left)
      (not (clear left))
      (clear right)
      (not (at ?d right))
      (at ?d left)
    )
  )

  (:action move-right-to-left-onto-disk
    :parameters (?d - disk ?s - place ?t - disk)
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

  ;; Moves from right to middle
  (:action move-right-to-middle-onto-peg
    :parameters (?d - disk)
    :precondition (and
      (on ?d right)
      (clear ?d)
      (clear middle)
      (at ?d right)
    )
    :effect (and
      (not (on ?d right))
      (on ?d middle)
      (not (clear middle))
      (clear right)
      (not (at ?d right))
      (at ?d middle)
    )
  )

  (:action move-right-to-middle-onto-disk
    :parameters (?d - disk ?s - place ?t - disk)
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