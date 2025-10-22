(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place)
  (:predicates
    (on ?d - disk ?p - place)        ; disk d is directly on place p (disk or peg)
    (clear ?p - place)              ; nothing is on place p (place can be disk or peg)
    (smaller ?a - disk ?b - disk)   ; disk a is smaller than disk b
  )

  ; ---------------------------
  ; Helper note: pegs are constants (left middle right). "place" is a supertype: disk or peg.
  ; Actions are split to avoid disjunctions:
  ; - destination can be a peg (empty peg) or a disk (top disk on a peg).
  ; - the moving disk may or may not have a disk immediately on top of it; for correctness we include
  ;   separate variants that handle the disk that was immediately above the moving disk when it exists.
  ; Each peg-pair (six ordered pairs) has four actions:
  ;   * onto-peg with-disk-above
  ;   * onto-peg no-disk-above
  ;   * onto-disk with-disk-above
  ;   * onto-disk no-disk-above
  ; ---------------------------

  ; ---------------------------
  ; LEFT -> MIDDLE
  ; ---------------------------
  (:action move-left-to-middle-onto-peg-with-upper
    :parameters (?d - disk ?upper - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?upper ?d)           ; there is a disk ?upper on top of ?d (will become directly on ?from after moving ?d)
      (clear ?d)
      (clear middle)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d middle)
      (not (clear middle))

      (not (on ?upper ?d))
      (on ?upper ?from)
      (clear ?upper)

      (clear ?d)
    )
  )

  (:action move-left-to-middle-onto-peg-no-upper
    :parameters (?d - disk ?from - place ?ub - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear middle)
      (not (on ?ub ?d))        ; there is no disk on ?d
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d middle)
      (not (clear middle))
      (clear ?d)
      (clear ?from)            ; the place ?from becomes clear because ?d was the only disk directly on that place
    )
  )

  (:action move-left-to-middle-onto-disk-with-upper
    :parameters (?d - disk ?t - disk ?upper - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?t middle)           ; target top disk on peg middle
      (clear ?t)
      (clear ?d)
      (on ?upper ?d)           ; a disk was on ?d and will become on ?from
      (smaller ?d ?t)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))

      (not (on ?upper ?d))
      (on ?upper ?from)
      (clear ?upper)

      (clear ?d)
    )
  )

  (:action move-left-to-middle-onto-disk-no-upper
    :parameters (?d - disk ?t - disk ?from - place ?ub - disk)
    :precondition (and
      (on ?d ?from)
      (on ?t middle)
      (clear ?t)
      (clear ?d)
      (not (on ?ub ?d))
      (smaller ?d ?t)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?d)
      (clear ?from)
    )
  )

  ; ---------------------------
  ; LEFT -> RIGHT
  ; ---------------------------
  (:action move-left-to-right-onto-peg-with-upper
    :parameters (?d - disk ?upper - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?upper ?d)
      (clear ?d)
      (clear right)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d right)
      (not (clear right))

      (not (on ?upper ?d))
      (on ?upper ?from)
      (clear ?upper)

      (clear ?d)
    )
  )

  (:action move-left-to-right-onto-peg-no-upper
    :parameters (?d - disk ?from - place ?ub - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear right)
      (not (on ?ub ?d))
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d right)
      (not (clear right))
      (clear ?d)
      (clear ?from)
    )
  )

  (:action move-left-to-right-onto-disk-with-upper
    :parameters (?d - disk ?t - disk ?upper - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?t right)
      (clear ?t)
      (clear ?d)
      (on ?upper ?d)
      (smaller ?d ?t)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))

      (not (on ?upper ?d))
      (on ?upper ?from)
      (clear ?upper)

      (clear ?d)
    )
  )

  (:action move-left-to-right-onto-disk-no-upper
    :parameters (?d - disk ?t - disk ?from - place ?ub - disk)
    :precondition (and
      (on ?d ?from)
      (on ?t right)
      (clear ?t)
      (clear ?d)
      (not (on ?ub ?d))
      (smaller ?d ?t)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?d)
      (clear ?from)
    )
  )

  ; ---------------------------
  ; MIDDLE -> LEFT
  ; ---------------------------
  (:action move-middle-to-left-onto-peg-with-upper
    :parameters (?d - disk ?upper - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?upper ?d)
      (clear ?d)
      (clear left)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d left)
      (not (clear left))

      (not (on ?upper ?d))
      (on ?upper ?from)
      (clear ?upper)

      (clear ?d)
    )
  )

  (:action move-middle-to-left-onto-peg-no-upper
    :parameters (?d - disk ?from - place ?ub - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear left)
      (not (on ?ub ?d))
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d left)
      (not (clear left))
      (clear ?d)
      (clear ?from)
    )
  )

  (:action move-middle-to-left-onto-disk-with-upper
    :parameters (?d - disk ?t - disk ?upper - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?t left)
      (clear ?t)
      (clear ?d)
      (on ?upper ?d)
      (smaller ?d ?t)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))

      (not (on ?upper ?d))
      (on ?upper ?from)
      (clear ?upper)

      (clear ?d)
    )
  )

  (:action move-middle-to-left-onto-disk-no-upper
    :parameters (?d - disk ?t - disk ?from - place ?ub - disk)
    :precondition (and
      (on ?d ?from)
      (on ?t left)
      (clear ?t)
      (clear ?d)
      (not (on ?ub ?d))
      (smaller ?d ?t)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?d)
      (clear ?from)
    )
  )

  ; ---------------------------
  ; MIDDLE -> RIGHT
  ; ---------------------------
  (:action move-middle-to-right-onto-peg-with-upper
    :parameters (?d - disk ?upper - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?upper ?d)
      (clear ?d)
      (clear right)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d right)
      (not (clear right))

      (not (on ?upper ?d))
      (on ?upper ?from)
      (clear ?upper)

      (clear ?d)
    )
  )

  (:action move-middle-to-right-onto-peg-no-upper
    :parameters (?d - disk ?from - place ?ub - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear right)
      (not (on ?ub ?d))
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d right)
      (not (clear right))
      (clear ?d)
      (clear ?from)
    )
  )

  (:action move-middle-to-right-onto-disk-with-upper
    :parameters (?d - disk ?t - disk ?upper - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?t right)
      (clear ?t)
      (clear ?d)
      (on ?upper ?d)
      (smaller ?d ?t)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))

      (not (on ?upper ?d))
      (on ?upper ?from)
      (clear ?upper)

      (clear ?d)
    )
  )

  (:action move-middle-to-right-onto-disk-no-upper
    :parameters (?d - disk ?t - disk ?from - place ?ub - disk)
    :precondition (and
      (on ?d ?from)
      (on ?t right)
      (clear ?t)
      (clear ?d)
      (not (on ?ub ?d))
      (smaller ?d ?t)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?d)
      (clear ?from)
    )
  )

  ; ---------------------------
  ; RIGHT -> LEFT
  ; ---------------------------
  (:action move-right-to-left-onto-peg-with-upper
    :parameters (?d - disk ?upper - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?upper ?d)
      (clear ?d)
      (clear left)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d left)
      (not (clear left))

      (not (on ?upper ?d))
      (on ?upper ?from)
      (clear ?upper)

      (clear ?d)
    )
  )

  (:action move-right-to-left-onto-peg-no-upper
    :parameters (?d - disk ?from - place ?ub - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear left)
      (not (on ?ub ?d))
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d left)
      (not (clear left))
      (clear ?d)
      (clear ?from)
    )
  )

  (:action move-right-to-left-onto-disk-with-upper
    :parameters (?d - disk ?t - disk ?upper - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?t left)
      (clear ?t)
      (clear ?d)
      (on ?upper ?d)
      (smaller ?d ?t)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))

      (not (on ?upper ?d))
      (on ?upper ?from)
      (clear ?upper)

      (clear ?d)
    )
  )

  (:action move-right-to-left-onto-disk-no-upper
    :parameters (?d - disk ?t - disk ?from - place ?ub - disk)
    :precondition (and
      (on ?d ?from)
      (on ?t left)
      (clear ?t)
      (clear ?d)
      (not (on ?ub ?d))
      (smaller ?d ?t)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?d)
      (clear ?from)
    )
  )

  ; ---------------------------
  ; RIGHT -> MIDDLE
  ; ---------------------------
  (:action move-right-to-middle-onto-peg-with-upper
    :parameters (?d - disk ?upper - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?upper ?d)
      (clear ?d)
      (clear middle)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d middle)
      (not (clear middle))

      (not (on ?upper ?d))
      (on ?upper ?from)
      (clear ?upper)

      (clear ?d)
    )
  )

  (:action move-right-to-middle-onto-peg-no-upper
    :parameters (?d - disk ?from - place ?ub - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear middle)
      (not (on ?ub ?d))
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d middle)
      (not (clear middle))
      (clear ?d)
      (clear ?from)
    )
  )

  (:action move-right-to-middle-onto-disk-with-upper
    :parameters (?d - disk ?t - disk ?upper - disk ?from - place)
    :precondition (and
      (on ?d ?from)
      (on ?t middle)
      (clear ?t)
      (clear ?d)
      (on ?upper ?d)
      (smaller ?d ?t)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))

      (not (on ?upper ?d))
      (on ?upper ?from)
      (clear ?upper)

      (clear ?d)
    )
  )

  (:action move-right-to-middle-onto-disk-no-upper
    :parameters (?d - disk ?t - disk ?from - place ?ub - disk)
    :precondition (and
      (on ?d ?from)
      (on ?t middle)
      (clear ?t)
      (clear ?d)
      (not (on ?ub ?d))
      (smaller ?d ?t)
      )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?d)
      (clear ?from)
    )
  )

)