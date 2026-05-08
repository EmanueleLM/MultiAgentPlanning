(define (domain tower-of-hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; direct support: (on ?upper ?lower) - ?upper is directly on ?lower (lower may be a disk used as a base sentinel)
    (on ?upper - disk ?lower - disk)

    ;; current top element of a peg
    (top ?p - peg ?d - disk)

    ;; strict size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ;; base sentinel marker (one per peg)
    (is-base ?d - disk)

    ;; discrete ordered stages (time steps)
    (successor ?s - stage ?s2 - stage)
    (stage-active ?s - stage)
  )

  ;; Atomic move: move top disk ?d from peg ?from to peg ?to,
  ;; advancing the active stage from ?s to its successor ?s2.
  (:action move
    :parameters (?d - disk
                 ?below - disk
                 ?from - peg
                 ?destTop - disk
                 ?to - peg
                 ?s - stage
                 ?s2 - stage)
    :precondition (and
      ;; the disk to move must be the top of the source peg
      (top ?from ?d)
      ;; we know what directly supports it on the source (disk or base sentinel)
      (on ?d ?below)

      ;; we know the current top on the destination peg
      (top ?to ?destTop)

      ;; cannot move a base sentinel
      (not (is-base ?d))

      ;; cannot place a larger disk onto a smaller one
      (not (smaller ?destTop ?d))

      ;; prevent no-op moves onto the same peg
      (not (top ?to ?d))

      ;; enforce single-move-at-a-time via active stage and its successor
      (stage-active ?s)
      (successor ?s ?s2)
    )
    :effect (and
      ;; update source peg top: removed disk's former support becomes the new top
      (not (top ?from ?d))
      (top ?from ?below)

      ;; update destination peg top: moved disk becomes the new top
      (not (top ?to ?destTop))
      (top ?to ?d)

      ;; update the direct support relation for the moved disk
      (not (on ?d ?below))
      (on ?d ?destTop)

      ;; advance the active stage (enforces contiguous stage progression)
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )
)