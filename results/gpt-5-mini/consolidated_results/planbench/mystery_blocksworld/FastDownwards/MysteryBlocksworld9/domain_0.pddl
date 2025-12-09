(define (domain craving-management)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent obj)

  (:predicates
    ; object identity and audit state
    (id_verified ?o - obj)
    (audited ?src - obj ?tgt - obj)

    ; authorization granted to a particular agent for a particular source->target craving
    (authorized ?agt - agent ?src - obj ?tgt - obj)

    ; the actual craving relation required by the final goal
    (craves ?src - obj ?tgt - obj)

    ; capability markers for agents (which agents may perform which roles)
    (can_authorize ?agt - agent)
    (can_induce ?agt - agent)
  )

  ; Verify an object's identity. No other preconditions — explicit identity verification is required before audit.
  (:action verify-identity
    :parameters (?actor - agent ?o - obj)
    :precondition (and)
    :effect (and (id_verified ?o))
  )

  ; Perform an audit over a source/target pair. Requires both objects' identities verified and that the auditor is authorized to perform audits.
  ; Audits are persistent and required before authorization or inducing cravings.
  (:action perform-audit
    :parameters (?auditor - agent ?src - obj ?tgt - obj)
    :precondition (and (can_authorize ?auditor) (id_verified ?src) (id_verified ?tgt))
    :effect (and (audited ?src ?tgt))
  )

  ; Grant explicit authorization to an inducing agent for a specific source->target craving.
  ; Authorization requires that the auditor is allowed to authorize and that an audit for that pair has completed.
  (:action grant-authorization
    :parameters (?auditor - agent ?op - agent ?src - obj ?tgt - obj)
    :precondition (and (can_authorize ?auditor) (audited ?src ?tgt) (id_verified ?src) (id_verified ?tgt))
    :effect (and (authorized ?op ?src ?tgt))
  )

  ; Induce (create) a craving relation from source to target. This is only possible if an audit has completed
  ; for that pair and the inducing agent has been explicitly authorized for that pair.
  (:action induce-craving
    :parameters (?op - agent ?src - obj ?tgt - obj)
    :precondition (and (can_induce ?op) (authorized ?op ?src ?tgt) (audited ?src ?tgt))
    :effect (and (craves ?src ?tgt))
  )
)