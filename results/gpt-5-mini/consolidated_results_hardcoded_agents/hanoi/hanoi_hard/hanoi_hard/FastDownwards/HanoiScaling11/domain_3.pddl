(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ; Structural state (mutable)
    (on-peg ?d - disk ?p - peg)        ; disk directly supported by peg
    (on-disk ?d - disk ?below - disk) ; disk directly supported by another disk
    (top ?p - peg ?d - disk)          ; ?d is the top disk on peg ?p
    (empty ?p - peg)                  ; peg has no disks

    ; Static / auxiliary (immutable during planning)
    (smaller ?x - disk ?y - disk)     ; ?x is strictly smaller than ?y (static)

    ; Explicit ordered stages to enforce single-action-per-stage progression
    (succ ?s - step ?s2 - step)       ; successor relation between stages
    (current ?s - step)               ; the current active stage
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  ;; This action consumes the current stage and advances to its successor,
  ;; ensuring exactly one move per stage and enforcing ordering of stages.
  (:action move-peg-to-empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?pfrom ?d)
      (empty ?pto)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; update support of moved disk
      (not (on-peg ?d ?pfrom))
      (on-peg ?d ?pto)

      ; update top-of-peg facts
      (not (top ?pfrom ?d))
      (top ?pto ?d)

      ; source peg becomes empty (disk was directly on the peg)
      (empty ?pfrom)
      (not (empty ?pto))

      ; advance stage (single-action-per-stage enforcement)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg to sit on top of another top disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?dto - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?pfrom ?d)
      (top ?pto ?dto)
      (smaller ?d ?dto)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; update support of moved disk
      (not (on-peg ?d ?pfrom))
      (on-disk ?d ?dto)

      ; update top-of-peg facts
      (not (top ?pto ?dto))
      (top ?pto ?d)

      ; source peg becomes empty (disk was directly on the peg)
      (empty ?pfrom)

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?dbelow - disk ?pfrom - peg ?pto - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?dbelow)
      (top ?pfrom ?d)
      (empty ?pto)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; update support of moved disk
      (not (on-disk ?d ?dbelow))
      (on-peg ?d ?pto)

      ; update top-of-peg facts: the disk immediately below becomes the new top on the same peg
      (not (top ?pfrom ?d))
      (top ?pfrom ?dbelow)

      ; destination peg updates
      (top ?pto ?d)
      (not (empty ?pto))

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk to sit on top of another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?dbelow - disk ?pfrom - peg ?pto - peg ?dto - disk ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?dbelow)
      (top ?pfrom ?d)
      (top ?pto ?dto)
      (smaller ?d ?dto)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; update support of moved disk
      (not (on-disk ?d ?dbelow))
      (on-disk ?d ?dto)

      ; update top-of-peg facts: the moved disk becomes new top on destination peg
      (not (top ?pto ?dto))
      (top ?pto ?d)

      ; update source peg top to the disk immediately below
      (not (top ?pfrom ?d))
      (top ?pfrom ?dbelow)

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)