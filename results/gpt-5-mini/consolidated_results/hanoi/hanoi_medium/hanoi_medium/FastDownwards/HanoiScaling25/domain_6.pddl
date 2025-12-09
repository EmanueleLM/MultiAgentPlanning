(define (domain tower-of-hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on ?upper - disk ?lower - disk)       ; direct support: upper is directly on lower (lower may be a base sentinel)
    (top ?p - peg ?d - disk)               ; current top disk (or base sentinel) of a peg
    (smaller ?x - disk ?y - disk)          ; strict size ordering: x is smaller than y
    (is-base ?d - disk)                    ; marker: this disk object is a base sentinel for a peg
    (successor ?s - stage ?s2 - stage)     ; discrete stage successor relation
    (stage-active ?s - stage)              ; which stage is currently active (exactly one active at any time)
  )

  ;; Move the top disk ?d from peg ?from to peg ?to, advancing the active stage from ?s to its successor ?s2.
  (:action move
    :parameters (?d - disk
                 ?below - disk
                 ?from - peg
                 ?destTop - disk
                 ?to - peg
                 ?s - stage
                 ?s2 - stage)
    :precondition (and
      ;; the disk to move must be the top of the source peg and supported by ?below
      (top ?from ?d)
      (on ?d ?below)

      ;; destination peg current top is ?destTop (could be a base sentinel)
      (top ?to ?destTop)

      ;; do not move base sentinels
      (not (is-base ?d))

      ;; disallow placing the moved disk onto a strictly smaller disk:
      ;; fail if destination top is strictly smaller than the moved disk
      (not (smaller ?destTop ?d))

      ;; prevent trivial move onto the same peg
      (not (= ?from ?to))

      ;; enforce single active stage and contiguous progression
      (stage-active ?s)
      (successor ?s ?s2)
    )
    :effect (and
      ;; source peg: the moved disk ceases to be top; its former support becomes top
      (not (top ?from ?d))
      (top ?from ?below)

      ;; destination peg: previous top is no longer top; moved disk becomes top
      (not (top ?to ?destTop))
      (top ?to ?d)

      ;; update direct support relation for the moved disk
      (not (on ?d ?below))
      (on ?d ?destTop)

      ;; advance the active stage (enforces contiguous stage progression)
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )
)