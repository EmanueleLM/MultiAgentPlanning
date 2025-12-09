(define (domain tower-of-hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; direct support: upper is directly on lower (lower can be a disk or a base sentinel)
    (on ?upper - disk ?lower - disk)

    ;; current top element of a peg (always exactly one per peg in well-formed states)
    (top ?p - peg ?d - disk)

    ;; strict size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ;; base sentinels to represent an empty peg bottom
    (is-base ?d - disk)

    ;; discrete, ordered stages (time steps)
    (successor ?s - stage ?s2 - stage)
    (stage-active ?s - stage)
  )

  ;; single, atomic move action that advances the active stage to its successor.
  ;; Move the top disk from ?from to ?to.
  ;; Parameters:
  ;;   ?d        - disk being moved (must be top of ?from)
  ;;   ?below    - disk (or base sentinel) directly below ?d on ?from
  ;;   ?from     - peg from which ?d is removed
  ;;   ?destTop  - disk (or base sentinel) that is currently top of ?to (destination)
  ;;   ?to       - destination peg
  ;;   ?s ?s2    - current active stage and its successor (enforces one action per stage)
  (:action move
    :parameters (?d - disk ?below - disk ?from - peg ?destTop - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      ;; must be the top disk on the source peg
      (top ?from ?d)
      ;; we must know what directly supports it (always exists: disk or base sentinel)
      (on ?d ?below)

      ;; we must know the current top on the destination peg
      (top ?to ?destTop)

      ;; do not move a base sentinel
      (not (is-base ?d))

      ;; cannot place a larger disk onto a smaller one:
      ;; disallow the case "destTop is smaller than d"
      ;; (if destTop is a base sentinel, no (smaller destTop d) facts exist, so move is allowed)
      (not (smaller ?destTop ?d))

      ;; enforce single-move-at-a-time via active stage and its successor
      (stage-active ?s)
      (successor ?s ?s2)
    )
    :effect (and
      ;; update source peg top: remove moved disk as top, make its support the new top
      (not (top ?from ?d))
      (top ?from ?below)

      ;; update destination peg top: remove old top, make moved disk the new top
      (not (top ?to ?destTop))
      (top ?to ?d)

      ;; update direct support relations
      (not (on ?d ?below))
      (on ?d ?destTop)

      ;; advance the active stage (enforces contiguous stage progression)
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )
)