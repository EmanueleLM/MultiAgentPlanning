(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)    ; disk ?d is directly on place ?p (a disk or a peg)
    (clear ?p - place)          ; nothing is directly on place ?p
    (smaller ?a - disk ?b - disk) ; ?a is smaller than ?b
  )

  ; ---------------------------
  ; Move actions for each ordered peg pair.
  ; Two actions per ordered pair:
  ;  - onto-peg : move a clear disk to an empty destination peg
  ;  - onto-disk: move a clear disk to be on top of a (clear) disk on destination peg (size enforced)
  ; Each action takes ?from as a place so it can move a disk that is directly on a peg or on another disk.
  ; ---------------------------

  ; LEFT -> MIDDLE
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

  ; LEFT -> RIGHT
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

  ; MIDDLE -> LEFT
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

  ; MIDDLE -> RIGHT
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

  ; RIGHT -> LEFT
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

  ; RIGHT -> MIDDLE
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