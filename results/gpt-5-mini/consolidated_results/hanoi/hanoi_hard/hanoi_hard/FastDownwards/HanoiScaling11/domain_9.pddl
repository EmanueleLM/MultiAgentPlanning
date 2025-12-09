(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk ?d is directly on peg ?p (bottom connection)
    (on-disk ?d - disk ?below - disk) ; disk ?d is directly on top of disk ?below
    (top ?p - peg ?d - disk)          ; disk ?d is the top disk of peg ?p
    (empty ?p - peg)                  ; peg ?p is empty (no disks)
    (smaller ?x - disk ?y - disk)     ; disk ?x is smaller than disk ?y
    (succ ?s - step ?s2 - step)       ; temporal successor relation between stages
    (current ?s - step)               ; current stage marker
  )

  ; Move a disk that is the sole (bottom) disk on its source peg onto an empty target peg.
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
      ; remove disk from source peg
      (not (on-peg ?d ?pfrom))
      (not (top ?pfrom ?d))
      (empty ?pfrom)

      ; place disk on target peg
      (on-peg ?d ?pto)
      (top ?pto ?d)
      (not (empty ?pto))

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Move a disk that is the sole (bottom) disk on its source peg onto the top disk of a non-empty target peg.
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
      ; remove disk from source peg (becomes empty)
      (not (on-peg ?d ?pfrom))
      (not (top ?pfrom ?d))
      (empty ?pfrom)

      ; place disk on target disk
      (on-disk ?d ?dto)
      (not (top ?pto ?dto))
      (top ?pto ?d)

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Move a disk that is on top of another disk onto an empty target peg.
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
      ; unlink moved disk from the disk below
      (not (on-disk ?d ?dbelow))

      ; update source peg top to the disk below
      (not (top ?pfrom ?d))
      (top ?pfrom ?dbelow)

      ; place moved disk as sole (bottom/top) on empty target peg
      (on-peg ?d ?pto)
      (top ?pto ?d)
      (not (empty ?pto))

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Move a disk that is on top of another disk onto another disk (target top).
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
      ; unlink moved disk from the disk below and update source top
      (not (on-disk ?d ?dbelow))
      (not (top ?pfrom ?d))
      (top ?pfrom ?dbelow)

      ; link moved disk onto target top disk and update target top
      (on-disk ?d ?dto)
      (not (top ?pto ?dto))
      (top ?pto ?d)

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)