(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block phase)

  (:predicates
    ;; agent roles
    (is-block-player ?a - agent)
    (is-temporal-auditor ?a - agent)
    (is-orchestrator ?a - agent)

    ;; single-hand state for agents
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)

    ;; block placement and support relations
    (ontable ?b - block)
    (on ?b - block ?x - block)

    ;; clear: no block on top and not currently held (maintained by effects)
    (clear ?b - block)

    ;; discrete stage/phase control (explicit ordered stages)
    (current ?p - phase)
    (next ?p1 - phase ?p2 - phase)
  )

  ;; Block-player primitive actions (single-hand, single-block)
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
      ;; support becomes clear when top removed
      (clear ?x)
      ;; held block is not clear while held
      (not (clear ?b))
    )
  )

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
      ;; when put down on table nothing is on top, so it's clear
      (clear ?b)
    )
  )

  (:action bp-stack
    :parameters (?bp - agent ?b - block ?x - block ?ph - phase)
    :precondition (and
      (is-block-player ?bp)
      (holding ?bp ?b)
      (clear ?x)
      (current ?ph)
    )
    :effect (and
      (on ?b ?x)
      (not (holding ?bp ?b))
      (handempty ?bp)
      ;; support becomes not clear
      (not (clear ?x))
      ;; block placed has nothing on top and is not held => clear
      (clear ?b)
      ;; ensure it's not on the table anymore
      (not (ontable ?b))
    )
  )

  ;; Temporal auditor advances stage only when required subgoal(s) achieved
  ;; This enforces the ordered staging: phase progression is a hard constraint.
  (:action ta-advance
    :parameters (?ta - agent ?from - phase ?to - phase ?bp - agent)
    :precondition (and
      (is-temporal-auditor ?ta)
      (is-block-player ?bp)
      (current ?from)
      (next ?from ?to)
      ;; require that the subgoal achieved in the earlier phase holds before advancing.
      ;; This makes the phase ordering a hard requirement (no bookkeeping tokens).
      (on yellow red)
      ;; ensure block_player's hand is empty before advancing (no in-flight moves)
      (handempty ?bp)
    )
    :effect (and
      (not (current ?from))
      (current ?to)
    )
  )
)