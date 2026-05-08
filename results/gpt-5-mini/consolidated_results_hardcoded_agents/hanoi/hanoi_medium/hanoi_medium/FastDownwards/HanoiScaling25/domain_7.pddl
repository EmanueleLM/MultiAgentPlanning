(define (domain tower-of-hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on ?upper - disk ?lower - disk)       ; direct support: upper is directly on lower (lower may be a base sentinel)
    (top ?p - peg ?d - disk)               ; current top disk of a peg (base sentinel if peg empty)
    (smaller ?x - disk ?y - disk)          ; strict size ordering: x is smaller than y
    (is-base ?d - disk)                    ; marker: this disk object is a base sentinel for a peg
    (successor ?s - stage ?s2 - stage)     ; discrete stage successor relation
    (stage-active ?s - stage)              ; which stage is currently active (exactly one active at any time)
    (different ?p1 - peg ?p2 - peg)        ; explicit inequality relation between pegs (used instead of =)
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
      ;; disk to move must be top of source peg and supported by ?below
      (top ?from ?d)
      (on ?d ?below)

      ;; destination peg current top is ?destTop (could be a base sentinel)
      (top ?to ?destTop)

      ;; do not move base sentinels
      (not (is-base ?d))

      ;; disallow placing the moved disk onto a strictly smaller disk
      (not (smaller ?destTop ?d))

      ;; enforce stage progression and that pegs are distinct
      (stage-active ?s)
      (successor ?s ?s2)
      (different ?from ?to)
    )
    :effect (and
      ;; source peg: moved disk ceases to be top; its former support becomes top
      (not (top ?from ?d))
      (top ?from ?below)

      ;; destination peg: previous top ceases to be top; moved disk becomes top
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