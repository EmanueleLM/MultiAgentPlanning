(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block blockplayer temporalauditor phase)

  (:predicates
    ;; multi-agent bookkeeping
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)

    ;; block world state
    (ontable ?b - block)
    (on ?b - block ?x - block)
    (clear ?b - block)

    ;; explicit phase sequencing (auditor-enforced)
    (current ?p - phase)
    (next ?p1 - phase ?p2 - phase)
  )

  ;; Block player actions (prefix bp- to attribute to block_player)
  (:action bp-pick-up
    :parameters (?bp - blockplayer ?b - block)
    :precondition (and
      (handempty ?bp)
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (handempty ?bp))
      (holding ?bp ?b)
      ;; holding a block preserves its clearness for subsequent stacking
      (clear ?b)
    )
  )

  (:action bp-put-down
    :parameters (?bp - blockplayer ?b - block)
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

  ;; Specific stacking actions required by the specification.
  ;; These actions are intentionally specific so the allowed order
  ;; of achieving the goal (yellow on red before blue on yellow)
  ;; is enforced via phases.

  (:action bp-stack-yellow-on-red
    :parameters (?bp - blockplayer)
    :precondition (and
      (holding ?bp yellow)
      (clear red)
      (current phase1)        ; only allowed during phase1
    )
    :effect (and
      (not (holding ?bp yellow))
      (not (clear red))
      (on yellow red)
      (handempty ?bp)
      (clear yellow)
      (not (ontable yellow))
    )
  )

  (:action bp-stack-blue-on-yellow
    :parameters (?bp - blockplayer)
    :precondition (and
      (holding ?bp blue)
      (clear yellow)
      (current phase2)        ; only allowed during phase2 (after auditor advances)
    )
    :effect (and
      (not (holding ?bp blue))
      (not (clear yellow))
      (on blue yellow)
      (handempty ?bp)
      (clear blue)
      (not (ontable blue))
    )
  )

  ;; Unstack allowed only in phase1. This prevents undoing the critical
  ;; yellow-on-red relation once the auditor advances to phase2.
  (:action bp-unstack
    :parameters (?bp - blockplayer ?b - block ?x - block)
    :precondition (and
      (on ?b ?x)
      (clear ?b)
      (handempty ?bp)
      (current phase1)        ; only allowed in phase1
    )
    :effect (and
      (holding ?bp ?b)
      (not (on ?b ?x))
      (clear ?x)
      (not (handempty ?bp))
      (clear ?b)
    )
  )

  ;; Temporal auditor actions (prefix ta- to attribute to temporal_auditor)
  ;; Auditor enforces the ordering: yellow must be on red before advancing.
  (:action ta-advance
    :parameters (?ta - temporalauditor ?from - phase ?to - phase ?bp - blockplayer)
    :precondition (and
      (current ?from)
      (next ?from ?to)
      ;; hard constraint: only advance when yellow is on red and the block player
      ;; is not holding anything (ensures the yellow-on-red relation is stable).
      (on yellow red)
      (handempty ?bp)
    )
    :effect (and
      (not (current ?from))
      (current ?to)
    )
  )
)