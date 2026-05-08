(define (domain hanoi4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; structural state
    (on-peg ?d - disk ?p - peg)        ; ?d directly on peg ?p (i.e., bottom-most disk on that peg)
    (on-disk ?d - disk ?below - disk) ; ?d directly on top of ?below
    (top ?d - disk ?p - peg)          ; ?d is the topmost disk on peg ?p
    (empty ?p - peg)                  ; peg has no disks

    ;; size relation: smaller ?x ?y means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ;; stage control to enforce sequential moves and ordered stages
    (current ?s - stage)              ; which stage is current
    (succ ?s - stage ?s2 - stage)     ; successor relation over stages

    ;; auxiliary distinctness predicate for pegs to forbid no-op moves
    (diff ?p1 - peg ?p2 - peg)
  )

  ;; Move a top disk that is directly on its peg to an empty peg.
  ;; Advances the stage by one. Preconditions ensure the disk is top and directly on the source peg,
  ;; and the destination peg is empty.
  (:action move-onpeg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; source: remove disk from its peg (it was directly on the peg), source becomes empty
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      ;; destination: disk now directly on destination peg and is top there
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; Move a top disk that is directly on its peg onto another disk (destination non-empty).
  ;; The destination disk must be the top disk on the destination peg and larger than the moving disk.
  (:action move-onpeg-to-ondisk
    :parameters (?d - disk ?from - peg ?to - peg ?dst - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (top ?dst ?to)
      (smaller ?d ?dst)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; source: remove disk from its peg (it was directly on the peg), source becomes empty
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      ;; destination: disk now sits directly on dst; update top predicates
      (on-disk ?d ?dst)
      (top ?d ?to)
      (not (top ?dst ?to))
    )
  )

  ;; Move a top disk that is on another disk to an empty peg.
  ;; Reveals the disk that was directly below as the new top of the source peg.
  (:action move-ondisk-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

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
  ;; Reveals the disk that was directly below as the new top of the source peg.
  (:action move-ondisk-to-ondisk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?dst - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (top ?dst ?to)
      (smaller ?d ?dst)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

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