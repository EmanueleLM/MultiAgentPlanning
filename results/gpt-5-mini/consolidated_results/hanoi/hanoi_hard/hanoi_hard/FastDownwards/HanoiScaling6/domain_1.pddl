(define (domain hanoi-multiagent-revised)
  ;; Tower of Hanoi — sequential, staged encoding for strict temporal/causal consistency
  ;; Actions are atomic mover moves (pickup+place) tied to explicit stage progression.
  ;; Actions originate from the mover agent (prefix mover_). No bookkeeping two-step actions,
  ;; no tokens, and no oscillating back-and-forth allowed: each action consumes the current
  ;; stage and produces its unique successor stage. The required 63 moves for 6 disks are
  ;; enforced by requiring final stage to be stage63 in the problem file.
  (:requirements :strips :typing :negative-preconditions)

  (:types
    disk peg - object
    stage
  )

  (:predicates
    ;; disk directly on an object (disk or peg)
    (on ?d - disk ?x - object)

    ;; top-clear: there is no disk immediately on top of object ?x (disk or peg)
    (clear ?x - object)

    ;; static size ordering (smaller ?a ?b) : ?a strictly smaller than ?b
    (smaller ?a - disk ?b - disk)

    ;; current stage marker (exactly one stage true at a time in the initial/problem encoding)
    (cur-stage ?s - stage)

    ;; successor relation between stages: (next s s2) means s2 is the immediate successor of s
    (next ?s - stage ?s2 - stage)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Atomic mover actions (single-step pickup+place) that advance the stage
  ;; Each action requires (cur-stage ?s) and a matching (next ?s ?s2), and its
  ;; effect advances the current stage to ?s2. This enforces one move per stage,
  ;; contiguous stage progression, and prevents oscillation (no action decreases stage).
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Move a top disk ?d from support ?from onto an empty peg ?to.
  ;; Origin: mover (single atomic action).
  (:action mover_move_to_peg
    :parameters (?d - disk ?from - object ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (cur-stage ?s)
      (next ?s ?s2)
      (on ?d ?from)        ;; disk is directly on its support
      (clear ?d)           ;; disk is top-most on its support
      (clear ?to)          ;; destination peg has no top disk (peg is empty)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear/top facts:
      (not (clear ?to))    ;; peg is no longer empty on top after placement
      (clear ?from)        ;; former support becomes top-clear
      (clear ?d)           ;; moved disk is top-most on destination

      ;; advance the stage marker
      (not (cur-stage ?s))
      (cur-stage ?s2)
    )
  )

  ;; Move a top disk ?d from support ?from onto top of a larger disk ?t.
  ;; Requires size ordering (smaller ?d ?t). Atomic and staged as above.
  (:action mover_move_onto_disk
    :parameters (?d - disk ?from - object ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (cur-stage ?s)
      (next ?s ?s2)
      (on ?d ?from)       ;; disk is directly on its support
      (clear ?d)          ;; disk is top-most on its support
      (clear ?t)          ;; target disk is top-most on its support (so we place on it)
      (smaller ?d ?t)     ;; cannot place larger on smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)

      ;; update clear/top facts:
      (not (clear ?t))    ;; target disk now has a disk on top
      (clear ?from)       ;; former support becomes top-clear
      (clear ?d)          ;; moved disk is now top-most

      ;; advance the stage marker
      (not (cur-stage ?s))
      (cur-stage ?s2)
    )
  )

)