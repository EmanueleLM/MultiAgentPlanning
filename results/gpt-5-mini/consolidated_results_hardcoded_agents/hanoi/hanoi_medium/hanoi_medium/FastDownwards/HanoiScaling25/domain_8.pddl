(define (domain tower-of-hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on ?upper - disk ?lower - disk)       ; immediate support: upper is directly on lower (lower may be a base sentinel)
    (top ?p - peg ?d - disk)               ; current top disk of a peg (base sentinel if peg empty)
    (smaller ?x - disk ?y - disk)          ; strict size ordering: x is smaller than y
    (is-base ?d - disk)                    ; marker: this disk object is a base sentinel for a peg
    (successor ?s - stage ?s2 - stage)     ; discrete stage successor relation
    (stage-active ?s - stage)              ; which stage is currently active (exactly one active at any time)
    (different ?p1 - peg ?p2 - peg)        ; explicit inequality relation between pegs
  )

  (:action move
    :parameters (?d - disk
                 ?below - disk
                 ?from - peg
                 ?destTop - disk
                 ?to - peg
                 ?s - stage
                 ?s2 - stage)
    :precondition (and
      ;; disk to move must be the top of the source peg and directly supported by ?below
      (top ?from ?d)
      (on ?d ?below)

      ;; destination peg current top is ?destTop (may be a base sentinel)
      (top ?to ?destTop)

      ;; cannot move a base sentinel
      (not (is-base ?d))

      ;; cannot place this disk onto a strictly smaller disk
      (not (smaller ?destTop ?d))

      ;; enforce sequential stage progression and distinct pegs
      (stage-active ?s)
      (successor ?s ?s2)
      (different ?from ?to)
    )
    :effect (and
      ;; update source peg top: moved disk ceases to be top; its supporting disk becomes top
      (not (top ?from ?d))
      (top ?from ?below)

      ;; update destination peg top: previous top ceases to be top; moved disk becomes top
      (not (top ?to ?destTop))
      (top ?to ?d)

      ;; update direct support relation for the moved disk
      (not (on ?d ?below))
      (on ?d ?destTop)

      ;; advance the active stage (enforces contiguous progression: each move advances exactly one stage)
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )
)