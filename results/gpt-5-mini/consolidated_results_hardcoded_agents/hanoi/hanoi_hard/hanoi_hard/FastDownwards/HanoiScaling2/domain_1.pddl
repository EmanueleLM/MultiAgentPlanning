(define (domain hanoi-6disk-steps)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ; Location/stacking (current world facts, advanced by actions)
    (on-peg ?d - disk ?p - peg)        ; disk ?d is directly on peg ?p (i.e., bottom of a stack or only disk)
    (on-disk ?d - disk ?support - disk) ; disk ?d is directly on top of disk ?support

    ; Clearness at the current world state
    (clear-disk ?d - disk)             ; no disk on top of ?d
    (clear-peg ?p - peg)               ; no disk on peg ?p

    ; Static size ordering (always true)
    (smaller ?a - disk ?b - disk)

    ; Discrete step progression control
    (next ?s - step ?s2 - step)        ; successor relation between steps
    (current ?s - step)                ; which step is currently active (unique during plan)
  )

  ; Move a top disk from a peg to another peg, advancing the current step.
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

      ; update clearness of pegs
      (clear-peg ?from)
      (not (clear-peg ?to)

      )
    )
  )

  ; Move a top disk from a peg onto a disk, advancing the current step.
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

  ; Move a top disk from on top of a disk onto a peg, advancing the current step.
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

  ; Move a top disk from on top of a disk onto another disk, advancing the current step.
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