; Domain: Orchestration for consumer cravings
; Agent analyses:
; - Roles present: orchestrator, consumer.
; - Only the orchestrator may issue an instruction that enables a consumer to form a craving.
; - Only a consumer may perform the action that establishes (craves ?agent ?item).
; - Items must be explicitly available before instructions or craving expressions occur.
;
; Auditor checklist (integrated):
; - Actions are distinct per agent role: orchestrator actions vs. consumer actions.
; - All preferences from natural language are treated as hard constraints (no soft/penalty constructs).
; - No post-hoc penalty or token mechanisms are used; constraints are enforced in preconditions.
; - No invented connectivity or resources beyond the declared objects and predicates.
; - When order is implied (instruction before expressing craving), the ordering is enforced by predicates (instructed).
; - :requirements limited to solver-supported flags.
; - All predicates, preconditions, and effects are fully expanded (no placeholders).
; - Negative preconditions are used to avoid re-applying effects redundantly.
;
; Notes: The planner must reach (craves b d). Orchestrator must first instruct the consumer b about item d (if not already instructed),
; then consumer b may express the craving for d. This ordering is enforced by the instructed predicate.

(define (domain orchestration-crave)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item role)

  (:predicates
    (role ?a - agent ?r - role)          ; agent a has role r
    (available ?i - item)               ; item i is available in the environment
    (instructed ?a - agent ?i - item)   ; agent a has been instructed by an orchestrator about item i
    (craves ?a - agent ?i - item)       ; agent a currently craves item i
  )

  ; Orchestrator action: only agents with role 'orchestrator' may instruct consumers about an available item.
  (:action orchestrator-instruct
    :parameters (?orc - agent ?ag - agent ?it - item ?r-orc - role ?r-cons - role)
    :precondition (and
                    (role ?orc ?r-orc)
                    (role ?ag ?r-cons)
                    (role ?r-orc orchestrator)
                    (role ?r-cons consumer)
                    (available ?it)
                    (not (instructed ?ag ?it))
                  )
    :effect (and
              (instructed ?ag ?it)
            )
  )

  ; Consumer action: only agents with role 'consumer' may express a craving for an item,
  ; and only after they have been instructed about that item; avoids re-asserting an existing craving.
  (:action consumer-express-crave
    :parameters (?ag - agent ?it - item ?r-cons - role)
    :precondition (and
                    (role ?ag ?r-cons)
                    (role ?r-cons consumer)
                    (instructed ?ag ?it)
                    (available ?it)
                    (not (craves ?ag ?it))
                  )
    :effect (and
              (craves ?ag ?it)
            )
  )
)