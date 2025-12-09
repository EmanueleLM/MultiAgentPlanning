(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk ?d is directly on peg ?p (the bottom connection for a stack)
    (on-disk ?d - disk ?below - disk) ; disk ?d is directly on top of disk ?below
    (top ?p - peg ?d - disk)          ; disk ?d is the top disk of peg ?p
    (empty ?p - peg)                  ; peg ?p is empty (no disks)
    (smaller ?x - disk ?y - disk)     ; disk ?x is smaller than disk ?y
    (succ ?s - step ?s2 - step)       ; temporal successor relation between stages
    (current ?s - step)               ; current stage marker
  )

  ; Move a disk that is the sole (bottom) disk on its source peg onto an empty target peg.
  (:action move-bottom-to-empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?pfrom ?d)
      (not (empty ?pfrom))    ; source peg must currently be non-empty
      (empty ?pto)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; source updates
      (not (on-peg ?d ?pfrom))
      (not (top ?pfrom ?d))
      (empty ?pfrom)

      ; target updates
      (on-peg ?d ?pto)
      (top ?pto ?d)
      (not (empty ?pto))

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Move a disk that is the sole (bottom) disk on its source peg onto another disk (target top).
  (:action move-bottom-to-disk
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?dto - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?pfrom ?d)
      (not (empty ?pfrom))
      (top ?pto ?dto)
      (smaller ?d ?dto)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; source becomes empty
      (not (on-peg ?d ?pfrom))
      (not (top ?pfrom ?d))
      (empty ?pfrom)

      ; target stack grows
      (on-disk ?d ?dto)
      (not (top ?pto ?dto))
      (top ?pto ?d)

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Move a disk that is on top of another disk onto an empty target peg.
  (:action move-on-disk-to-empty
    :parameters (?d - disk ?dbelow - disk ?pfrom - peg ?pto - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?dbelow)
      (top ?pfrom ?d)
      (not (empty ?pfrom))    ; source peg must currently be non-empty
      (empty ?pto)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; remove link between moved disk and the disk below
      (not (on-disk ?d ?dbelow))

      ; source peg: update top to the disk below
      (not (top ?pfrom ?d))
      (top ?pfrom ?dbelow)

      ; target peg: moved disk becomes bottom/top on empty peg
      (on-peg ?d ?pto)
      (top ?pto ?d)
      (not (empty ?pto))

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Move a disk that is on top of another disk onto another disk (target top).
  (:action move-on-disk-to-disk
    :parameters (?d - disk ?dbelow - disk ?pfrom - peg ?pto - peg ?dto - disk ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?dbelow)
      (top ?pfrom ?d)
      (top ?pto ?dto)
      (smaller ?d ?dto)
      (not (empty ?pfrom))
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; update source (unlink moved disk from the disk below and update peg top)
      (not (on-disk ?d ?dbelow))
      (not (top ?pfrom ?d))
      (top ?pfrom ?dbelow)

      ; update target (moved disk becomes directly on target top disk)
      (on-disk ?d ?dto)
      (not (top ?pto ?dto))
      (top ?pto ?d)

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)