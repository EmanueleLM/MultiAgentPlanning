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

    ;; clear: no block on top and not held (maintained by action effects)
    (clear ?b - block)

    ;; explicit ordered stages
    (current ?p - phase)
    (next ?p1 - phase ?p2 - phase)

    ;; mapping from a phase to the required supporting relation before advancing
    (requires-on ?p - phase ?b - block ?x - block)
  )

  ;; Block-player actions: single-hand, single-block moves only.

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
      ;; support becomes clear when its top is removed
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
      ;; placed block has nothing on top and is not held => clear
      (clear ?b)
      ;; ensure it's not on the table anymore
      (not (ontable ?b))
    )
  )

  ;; Temporal auditor enforces ordered stage progression.
  ;; It can advance from a phase 'from' to its successor 'to' only when:
  ;;  - the mapping (requires-on from b1 b2) exists in the problem,
  ;;  - the corresponding (on b1 b2) holds,
  ;;  - the block_player is not holding anything (no in-flight move).
  (:action ta-advance
    :parameters (?ta - agent ?from - phase ?to - phase ?bp - agent ?b1 - block ?b2 - block)
    :precondition (and
      (is-temporal-auditor ?ta)
      (is-block-player ?bp)
      (current ?from)
      (next ?from ?to)
      (requires-on ?from ?b1 ?b2)
      (on ?b1 ?b2)
      ;; ensure no move is currently in flight by the block_player
      (handempty ?bp)
    )
    :effect (and
      (not (current ?from))
      (current ?to)
    )
  )
)