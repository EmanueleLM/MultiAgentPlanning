(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block phase)

  (:predicates
    ;; agent hand state
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)

    ;; block world relations
    (ontable ?b - block)
    (on ?b - block ?x - block)
    (clear ?b - block)

    ;; explicit phase sequencing
    (current ?p - phase)
    (next ?p1 - phase ?p2 - phase)
  )

  ;; Pick up a block from the table (requires hand empty and the block clear)
  (:action bp-pick-up
    :parameters (?bp - agent ?b - block)
    :precondition (and
      (handempty ?bp)
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (handempty ?bp))
      (holding ?bp ?b)
      (not (clear ?b))
    )
  )

  ;; Unstack a block from another block (phase1 only).
  ;; Requires the block to be on the support, clear, and the hand empty.
  (:action bp-unstack
    :parameters (?bp - agent ?b - block ?x - block)
    :precondition (and
      (handempty ?bp)
      (on ?b ?x)
      (clear ?b)
      (current phase1)
    )
    :effect (and
      (not (on ?b ?x))
      (holding ?bp ?b)
      (not (handempty ?bp))
      (clear ?x)
      (not (clear ?b))
    )
  )

  ;; Put down a held block onto the table.
  (:action bp-put-down
    :parameters (?bp - agent ?b - block)
    :precondition (and
      (holding ?bp ?b)
    )
    :effect (and
      (ontable ?b)
      (handempty ?bp)
      (not (holding ?bp ?b))
      (clear ?b)
    )
  )

  ;; Stack yellow on red: only allowed in phase1 (to permit establishing yellow-on-red before phase advance)
  (:action bp-stack-yellow-on-red
    :parameters (?bp - agent)
    :precondition (and
      (holding ?bp yellow)
      (clear red)
      (current phase1)
    )
    :effect (and
      (on yellow red)
      (not (holding ?bp yellow))
      (handempty ?bp)
      (not (clear red))
      (clear yellow)
      (not (ontable yellow))
    )
  )

  ;; Stack blue on yellow: only allowed in phase2 (enforces that yellow-on-red must be achieved and phase advanced first)
  (:action bp-stack-blue-on-yellow
    :parameters (?bp - agent)
    :precondition (and
      (holding ?bp blue)
      (clear yellow)
      (current phase2)
    )
    :effect (and
      (on blue yellow)
      (not (holding ?bp blue))
      (handempty ?bp)
      (not (clear yellow))
      (clear blue)
      (not (ontable blue))
    )
  )

  ;; Temporal auditor advances phase when the required interim condition is stable.
  ;; Hard preconditions enforce that yellow is on red and the block player is not holding anything.
  (:action ta-advance
    :parameters (?ta - agent ?from - phase ?to - phase ?bp - agent)
    :precondition (and
      (current ?from)
      (next ?from ?to)
      (on yellow red)
      (handempty ?bp)
    )
    :effect (and
      (not (current ?from))
      (current ?to)
    )
  )
)