(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block phase)

  (:predicates
    ;; agent identity markers (to attribute actions)
    (is-block-player ?a - agent)
    (is-temporal-auditor ?a - agent)
    (is-orchestrator ?a - agent)

    ;; agent hand state
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)

    ;; block world relations
    (ontable ?b - block)
    (on ?b - block ?x - block)
    (clear ?b - block)

    ;; phase sequencing and markers
    (current ?p - phase)
    (next ?p1 - phase ?p2 - phase)
    (is-phase1 ?p - phase)
    (is-phase2 ?p - phase)
  )

  ;; Pick up a block from the table (done only by the block player)
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

  ;; Unstack a block from on top of another block (done only by the block player)
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

  ;; Put down a held block onto the table (done only by the block player)
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

  ;; Stack yellow on red: allowed only in phase1 and only by the block player
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

  ;; Stack blue on yellow: allowed only in phase2 and only by the block player
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

  ;; Temporal auditor advances the phase when the required interim condition is true.
  ;; The action is restricted to the temporal auditor agent and enforces that the block player
  ;; is not holding anything (so the interim condition is stable with respect to manipulation).
  (:action ta-advance
    :parameters (?ta - agent ?from - phase ?to - phase)
    :precondition (and
      (is-temporal-auditor ?ta)
      (current ?from)
      (next ?from ?to)
      (on yellow red)
      (handempty ?ta)
      ;; require the block player not holding anything to avoid concurrent manipulation
      (handempty ?bp)
    )
    :effect (and
      (not (current ?from))
      (current ?to)
    )
  )
)