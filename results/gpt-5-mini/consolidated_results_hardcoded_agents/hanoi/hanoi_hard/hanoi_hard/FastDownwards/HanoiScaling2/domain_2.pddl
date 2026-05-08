(define (domain hanoi-6disk-steps)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ; Location/stacking
    (on-peg ?d - disk ?p - peg)          ; disk ?d is directly on peg ?p (bottom or only disk)
    (on-disk ?d - disk ?support - disk)  ; disk ?d is directly on top of disk ?support

    ; Topness / emptiness
    (clear-disk ?d - disk)               ; no disk on top of ?d
    (clear-peg ?p - peg)                 ; peg ?p has no disks

    ; Static size ordering (always true facts in problem)
    (smaller ?a - disk ?b - disk)

    ; Discrete step progression control
    (next ?s - step ?s2 - step)          ; successor relation between steps
    (current ?s - step)                  ; which step is currently active (exactly one true)
  )

  ; Move a top disk from a peg to an empty peg, advancing the current step.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      ; advance step
      (not (current ?s))
      (current ?s2)

      ; update location of moved disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ; peg occupancy updates
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  ; Move a top disk from a peg onto a larger disk, advancing the current step.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (clear-peg ?from)
      (not (clear-disk ?to))
    )
  )

  ; Move a top disk from on top of a disk onto an empty peg, advancing the current step.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  ; Move a top disk from on top of a disk onto a larger disk, advancing the current step.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )
)