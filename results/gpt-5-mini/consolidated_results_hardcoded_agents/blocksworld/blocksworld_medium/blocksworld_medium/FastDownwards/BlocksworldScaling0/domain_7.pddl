(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block phase)

  (:predicates
    ;; agent roles
    (is-block-player ?a - agent)
    (is-temporal-auditor ?a - agent)
    (is-orchestrator ?a - agent)

    ;; single-hand state
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)

    ;; block placement relations
    (ontable ?b - block)
    (on ?b - block ?x - block)

    ;; clear: maintained by action effects (no block on top and not held)
    (clear ?b - block)

    ;; explicit ordered stages
    (current ?p - phase)
    (next ?p1 - phase ?p2 - phase)

    ;; static mapping: which (b on x) stackings are allowed in which phase
    ;; and which stacking each phase requires to be achieved before advancing.
    (requires-on ?p - phase ?b - block ?x - block)
  )

  ;; Block-player actions: single-hand, single-block moves only.
  ;; Preconditions ensure the hand constraints and block clearness.
  ;; Effects update placement and clearness; no derived predicates are used.

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
      ;; support becomes clear when its immediate top is removed
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
      ;; a block on the table with nothing on top is clear
      (clear ?b)
    )
  )

  ;; Stacking is constrained by the current phase and by a static mapping
  ;; (requires-on ?ph ?b ?x) defined in the problem. A stack that would
  ;; produce (on ?b ?x) is allowed only when that mapping exists for the
  ;; current phase. This enforces that only phase-authorized stacks may
  ;; be executed while that phase is current.
  (:action bp-stack
    :parameters (?bp - agent ?b - block ?x - block ?ph - phase)
    :precondition (and
      (is-block-player ?bp)
      (holding ?bp ?b)
      (clear ?x)
      (current ?ph)
      (requires-on ?ph ?b ?x)
    )
    :effect (and
      (on ?b ?x)
      (not (holding ?bp ?b))
      (handempty ?bp)
      ;; support becomes not clear
      (not (clear ?x))
      ;; placed block has nothing on top and is not held => clear
      (clear ?b)
      ;; ensure it's not on the table anymore
      (not (ontable ?b))
    )
  )

  ;; Temporal auditor advances the current phase to its successor only when
  ;; the required stacking for the current phase has been achieved and the
  ;; block_player is not in the middle of a move (hand must be empty).
  (:action ta-advance
    :parameters (?ta - agent ?from - phase ?to - phase ?bp - agent ?b - block ?x - block)
    :precondition (and
      (is-temporal-auditor ?ta)
      (is-block-player ?bp)
      (current ?from)
      (next ?from ?to)
      (requires-on ?from ?b ?x)
      (on ?b ?x)
      ;; ensure no move is currently in flight by the block_player
      (handempty ?bp)
    )
    :effect (and
      (not (current ?from))
      (current ?to)
    )
  )
)