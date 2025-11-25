(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block phase)

  (:predicates
    (is-block-player ?a - agent)
    (is-temporal-auditor ?a - agent)
    (is-orchestrator ?a - agent)

    (handempty ?a - agent)
    (holding ?a - agent ?b - block)

    (ontable ?b - block)
    (on ?b - block ?x - block)
    (clear ?b - block)

    (current ?p - phase)
    (next ?p1 - phase ?p2 - phase)
    (is-phase1 ?p - phase)
    (is-phase2 ?p - phase)
  )

  ;; Pick up a block from the table (performed only by the block player)
  (:action bp-pick-up
    :parameters (?bp - agent ?b - block)
    :precondition (and
      (is-block-player ?bp)
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

  ;; Unstack a clear block ?b from on top of ?x (performed only by the block player)
  (:action bp-unstack
    :parameters (?bp - agent ?b - block ?x - block)
    :precondition (and
      (is-block-player ?bp)
      (handempty ?bp)
      (on ?b ?x)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?x))
      (holding ?bp ?b)
      (not (handempty ?bp))
      (clear ?x)
      (not (clear ?b))
    )
  )

  ;; Put down a held block onto the table (performed only by the block player)
  (:action bp-put-down
    :parameters (?bp - agent ?b - block)
    :precondition (and
      (is-block-player ?bp)
      (holding ?bp ?b)
    )
    :effect (and
      (ontable ?b)
      (handempty ?bp)
      (not (holding ?bp ?b))
      (clear ?b)
    )
  )

  ;; Stack the block 'yellow' on top of 'red' (allowed only in phase1; performed only by block player)
  (:action bp-stack-yellow-on-red
    :parameters (?bp - agent ?ph - phase)
    :precondition (and
      (is-block-player ?bp)
      (holding ?bp yellow)
      (clear red)
      (current ?ph)
      (is-phase1 ?ph)
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

  ;; Stack the block 'blue' on top of 'yellow' (allowed only in phase2; performed only by block player)
  (:action bp-stack-blue-on-yellow
    :parameters (?bp - agent ?ph - phase)
    :precondition (and
      (is-block-player ?bp)
      (holding ?bp blue)
      (clear yellow)
      (current ?ph)
      (is-phase2 ?ph)
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

  ;; Temporal auditor advances the global phase from ?from to ?to when the interim condition (on yellow red)
  ;; holds and both the auditor and the block player have empty hands. This enforces stage ordering structurally.
  (:action ta-advance
    :parameters (?ta - agent ?from - phase ?to - phase ?bp - agent)
    :precondition (and
      (is-temporal-auditor ?ta)
      (is-block-player ?bp)
      (current ?from)
      (next ?from ?to)
      (on yellow red)
      (handempty ?ta)
      (handempty ?bp)
    )
    :effect (and
      (not (current ?from))
      (current ?to)
    )
  )
)