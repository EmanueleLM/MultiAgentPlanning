(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (top ?p - peg ?d - disk)             ; disk ?d is the top disk on peg ?p
    (empty ?p - peg)                    ; peg ?p is empty
    (above ?d - disk ?s - place)        ; disk ?d is immediately supported by place ?s (disk or peg)
    (smaller ?a - disk ?b - disk)       ; disk ?a is smaller than disk ?b (static)
  )

  ;; Move actions for each ordered pair of pegs.
  ;; Four variants for each ordered pair:
  ;;  - source has a disk below the moving disk (below is disk) & destination empty
  ;;  - source has a disk below the moving disk (below is disk) & destination has a top disk
  ;;  - source has no disk below the moving disk (moving disk directly supported by source peg) & destination empty
  ;;  - source has no disk below the moving disk & destination has a top disk
  ;; Each action updates top/empty and above relations accordingly and enforces the size constraint.

  ;; ---------- left -> middle ----------
  (:action move-left-to-middle-src-has-below-dest-empty
    :parameters (?d - disk ?b - disk)
    :precondition (and (top left ?d) (above ?d ?b) (empty middle))
    :effect (and
      (not (top left ?d))
      (top left ?b)
      (not (empty middle))
      (top middle ?d)
      (not (above ?d ?b))
      (above ?d middle)
    )
  )

  (:action move-left-to-middle-src-has-below-dest-hastop
    :parameters (?d - disk ?b - disk ?td - disk)
    :precondition (and (top left ?d) (above ?d ?b) (top middle ?td) (smaller ?d ?td))
    :effect (and
      (not (top left ?d))
      (top left ?b)
      (not (top middle ?td))
      (top middle ?d)
      (not (above ?d ?b))
      (above ?d ?td)
    )
  )

  (:action move-left-to-middle-src-nobelow-dest-empty
    :parameters (?d - disk)
    :precondition (and (top left ?d) (above ?d left) (empty middle))
    :effect (and
      (not (top left ?d))
      (empty left)
      (not (empty middle))
      (top middle ?d)
      (not (above ?d left))
      (above ?d middle)
    )
  )

  (:action move-left-to-middle-src-nobelow-dest-hastop
    :parameters (?d - disk ?td - disk)
    :precondition (and (top left ?d) (above ?d left) (top middle ?td) (smaller ?d ?td))
    :effect (and
      (not (top left ?d))
      (empty left)
      (not (top middle ?td))
      (top middle ?d)
      (not (above ?d left))
      (above ?d ?td)
    )
  )

  ;; ---------- left -> right ----------
  (:action move-left-to-right-src-has-below-dest-empty
    :parameters (?d - disk ?b - disk)
    :precondition (and (top left ?d) (above ?d ?b) (empty right))
    :effect (and
      (not (top left ?d))
      (top left ?b)
      (not (empty right))
      (top right ?d)
      (not (above ?d ?b))
      (above ?d right)
    )
  )

  (:action move-left-to-right-src-has-below-dest-hastop
    :parameters (?d - disk ?b - disk ?td - disk)
    :precondition (and (top left ?d) (above ?d ?b) (top right ?td) (smaller ?d ?td))
    :effect (and
      (not (top left ?d))
      (top left ?b)
      (not (top right ?td))
      (top right ?d)
      (not (above ?d ?b))
      (above ?d ?td)
    )
  )

  (:action move-left-to-right-src-nobelow-dest-empty
    :parameters (?d - disk)
    :precondition (and (top left ?d) (above ?d left) (empty right))
    :effect (and
      (not (top left ?d))
      (empty left)
      (not (empty right))
      (top right ?d)
      (not (above ?d left))
      (above ?d right)
    )
  )

  (:action move-left-to-right-src-nobelow-dest-hastop
    :parameters (?d - disk ?td - disk)
    :precondition (and (top left ?d) (above ?d left) (top right ?td) (smaller ?d ?td))
    :effect (and
      (not (top left ?d))
      (empty left)
      (not (top right ?td))
      (top right ?d)
      (not (above ?d left))
      (above ?d ?td)
    )
  )

  ;; ---------- middle -> left ----------
  (:action move-middle-to-left-src-has-below-dest-empty
    :parameters (?d - disk ?b - disk)
    :precondition (and (top middle ?d) (above ?d ?b) (empty left))
    :effect (and
      (not (top middle ?d))
      (top middle ?b)
      (not (empty left))
      (top left ?d)
      (not (above ?d ?b))
      (above ?d left)
    )
  )

  (:action move-middle-to-left-src-has-below-dest-hastop
    :parameters (?d - disk ?b - disk ?td - disk)
    :precondition (and (top middle ?d) (above ?d ?b) (top left ?td) (smaller ?d ?td))
    :effect (and
      (not (top middle ?d))
      (top middle ?b)
      (not (top left ?td))
      (top left ?d)
      (not (above ?d ?b))
      (above ?d ?td)
    )
  )

  (:action move-middle-to-left-src-nobelow-dest-empty
    :parameters (?d - disk)
    :precondition (and (top middle ?d) (above ?d middle) (empty left))
    :effect (and
      (not (top middle ?d))
      (empty middle)
      (not (empty left))
      (top left ?d)
      (not (above ?d middle))
      (above ?d left)
    )
  )

  (:action move-middle-to-left-src-nobelow-dest-hastop
    :parameters (?d - disk ?td - disk)
    :precondition (and (top middle ?d) (above ?d middle) (top left ?td) (smaller ?d ?td))
    :effect (and
      (not (top middle ?d))
      (empty middle)
      (not (top left ?td))
      (top left ?d)
      (not (above ?d middle))
      (above ?d ?td)
    )
  )

  ;; ---------- middle -> right ----------
  (:action move-middle-to-right-src-has-below-dest-empty
    :parameters (?d - disk ?b - disk)
    :precondition (and (top middle ?d) (above ?d ?b) (empty right))
    :effect (and
      (not (top middle ?d))
      (top middle ?b)
      (not (empty right))
      (top right ?d)
      (not (above ?d ?b))
      (above ?d right)
    )
  )

  (:action move-middle-to-right-src-has-below-dest-hastop
    :parameters (?d - disk ?b - disk ?td - disk)
    :precondition (and (top middle ?d) (above ?d ?b) (top right ?td) (smaller ?d ?td))
    :effect (and
      (not (top middle ?d))
      (top middle ?b)
      (not (top right ?td))
      (top right ?d)
      (not (above ?d ?b))
      (above ?d ?td)
    )
  )

  (:action move-middle-to-right-src-nobelow-dest-empty
    :parameters (?d - disk)
    :precondition (and (top middle ?d) (above ?d middle) (empty right))
    :effect (and
      (not (top middle ?d))
      (empty middle)
      (not (empty right))
      (top right ?d)
      (not (above ?d middle))
      (above ?d right)
    )
  )

  (:action move-middle-to-right-src-nobelow-dest-hastop
    :parameters (?d - disk ?td - disk)
    :precondition (and (top middle ?d) (above ?d middle) (top right ?td) (smaller ?d ?td))
    :effect (and
      (not (top middle ?d))
      (empty middle)
      (not (top right ?td))
      (top right ?d)
      (not (above ?d middle))
      (above ?d ?td)
    )
  )

  ;; ---------- right -> left ----------
  (:action move-right-to-left-src-has-below-dest-empty
    :parameters (?d - disk ?b - disk)
    :precondition (and (top right ?d) (above ?d ?b) (empty left))
    :effect (and
      (not (top right ?d))
      (top right ?b)
      (not (empty left))
      (top left ?d)
      (not (above ?d ?b))
      (above ?d left)
    )
  )

  (:action move-right-to-left-src-has-below-dest-hastop
    :parameters (?d - disk ?b - disk ?td - disk)
    :precondition (and (top right ?d) (above ?d ?b) (top left ?td) (smaller ?d ?td))
    :effect (and
      (not (top right ?d))
      (top right ?b)
      (not (top left ?td))
      (top left ?d)
      (not (above ?d ?b))
      (above ?d ?td)
    )
  )

  (:action move-right-to-left-src-nobelow-dest-empty
    :parameters (?d - disk)
    :precondition (and (top right ?d) (above ?d right) (empty left))
    :effect (and
      (not (top right ?d))
      (empty right)
      (not (empty left))
      (top left ?d)
      (not (above ?d right))
      (above ?d left)
    )
  )

  (:action move-right-to-left-src-nobelow-dest-hastop
    :parameters (?d - disk ?td - disk)
    :precondition (and (top right ?d) (above ?d right) (top left ?td) (smaller ?d ?td))
    :effect (and
      (not (top right ?d))
      (empty right)
      (not (top left ?td))
      (top left ?d)
      (not (above ?d right))
      (above ?d ?td)
    )
  )

  ;; ---------- right -> middle ----------
  (:action move-right-to-middle-src-has-below-dest-empty
    :parameters (?d - disk ?b - disk)
    :precondition (and (top right ?d) (above ?d ?b) (empty middle))
    :effect (and
      (not (top right ?d))
      (top right ?b)
      (not (empty middle))
      (top middle ?d)
      (not (above ?d ?b))
      (above ?d middle)
    )
  )

  (:action move-right-to-middle-src-has-below-dest-hastop
    :parameters (?d - disk ?b - disk ?td - disk)
    :precondition (and (top right ?d) (above ?d ?b) (top middle ?td) (smaller ?d ?td))
    :effect (and
      (not (top right ?d))
      (top right ?b)
      (not (top middle ?td))
      (top middle ?d)
      (not (above ?d ?b))
      (above ?d ?td)
    )
  )

  (:action move-right-to-middle-src-nobelow-dest-empty
    :parameters (?d - disk)
    :precondition (and (top right ?d) (above ?d right) (empty middle))
    :effect (and
      (not (top right ?d))
      (empty right)
      (not (empty middle))
      (top middle ?d)
      (not (above ?d right))
      (above ?d middle)
    )
  )

  (:action move-right-to-middle-src-nobelow-dest-hastop
    :parameters (?d - disk ?td - disk)
    :precondition (and (top right ?d) (above ?d right) (top middle ?td) (smaller ?d ?td))
    :effect (and
      (not (top right ?d))
      (empty right)
      (not (top middle ?td))
      (top middle ?d)
      (not (above ?d right))
      (above ?d ?td)
    )
  )

)