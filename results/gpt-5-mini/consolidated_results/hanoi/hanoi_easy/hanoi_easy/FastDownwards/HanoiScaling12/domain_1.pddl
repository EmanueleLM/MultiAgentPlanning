(define (domain hanoi4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; typing predicates (explicit)
    (disk ?d - disk)
    (peg ?p - peg)
    (step ?t - step)

    ;; structural state (global state; sequencing enforced by current-step and succ)
    (on-peg ?d - disk ?p - peg)        ; ?d directly on peg ?p
    (on-disk ?d - disk ?below - disk) ; ?d directly on another disk ?below
    (top ?d - disk ?p - peg)          ; ?d is the topmost disk on peg ?p
    (empty ?p - peg)                  ; peg has no disks

    ;; size relation: smaller ?x ?y means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ;; sequencing predicates for discrete stages
    (succ ?t - step ?t2 - step)       ; successor relation on steps
    (current-step ?t - step)          ; the step the system is currently at
  )

  ;; Each physical move must occur at the current step and advance the current-step to its successor.
  ;; This enforces contiguous progression of stages and prevents oscillation/backtracking of the
  ;; implicit time counter: actions require (current-step ?t) and (succ ?t ?t2) and their effects
  ;; remove (current-step ?t) and add (current-step ?t2).

  ;; Move a top disk that is directly on its peg to an empty peg.
  (:action move-onpeg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?t - step ?t2 - step)
    :precondition (and
      (current-step ?t)
      (succ ?t ?t2)

      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
    )
    :effect (and
      ;; advance the stage
      (not (current-step ?t))
      (current-step ?t2)

      ;; source: remove disk from its peg top
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      ;; source becomes empty (it was sole disk)
      (empty ?from)

      ;; destination: disk now directly on destination peg and is top there
      (on-peg ?d ?to)
      (top ?d ?to)
      ;; destination is no longer empty
      (not (empty ?to))
    )
  )

  ;; Move a top disk that is directly on its peg onto another disk (destination non-empty).
  (:action move-onpeg-to-ondisk
    :parameters (?d - disk ?from - peg ?to - peg ?dst - disk ?t - step ?t2 - step)
    :precondition (and
      (current-step ?t)
      (succ ?t ?t2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (top ?dst ?to)
      ;; size constraint: moved disk must be smaller than destination top
      (smaller ?d ?dst)
    )
    :effect (and
      ;; advance the stage
      (not (current-step ?t))
      (current-step ?t2)

      ;; remove disk from source peg and make source empty
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      ;; destination: disk now sits on top of dst; update top predicates
      (on-disk ?d ?dst)
      (top ?d ?to)
      (not (top ?dst ?to))
    )
  )

  ;; Move a top disk that is on another disk to an empty peg.
  (:action move-ondisk-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?t - step ?t2 - step)
    :precondition (and
      (current-step ?t)
      (succ ?t ?t2)

      (top ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
    )
    :effect (and
      ;; advance the stage
      (not (current-step ?t))
      (current-step ?t2)

      ;; remove moved disk's on-disk relation and its top status on source
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      ;; reveal the disk that was directly below as the new top of the source peg
      (top ?below ?from)

      ;; destination: moved disk becomes directly on the destination peg and top there
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; Move a top disk that is on another disk onto another disk.
  (:action move-ondisk-to-ondisk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?dst - disk ?t - step ?t2 - step)
    :precondition (and
      (current-step ?t)
      (succ ?t ?t2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (top ?dst ?to)
      (smaller ?d ?dst)
    )
    :effect (and
      ;; advance the stage
      (not (current-step ?t))
      (current-step ?t2)

      ;; remove moved disk from its support and update source top
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)

      ;; destination: moved disk now on dst and becomes its top; old top is no longer top
      (on-disk ?d ?dst)
      (top ?d ?to)
      (not (top ?dst ?to))
    )
  )
)