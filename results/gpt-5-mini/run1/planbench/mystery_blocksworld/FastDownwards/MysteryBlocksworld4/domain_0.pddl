(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object agent)

  ;; Domain-level named constants so the domain actions can refer to the concrete objects/agents.
  (:constants
    a b c d - object
    alpha beta - agent
  )

  (:predicates
    ;; object X craves object Y
    (craves ?x - object ?y - object)
    ;; agent AG is authorized to declare that object X craves object Y
    (authorized ?ag - agent ?x - object ?y - object)
    ;; a declaration recording that X craves Y has been recorded
    (recorded ?x - object ?y - object)
    ;; auditor-level approval of recorded declarations
    (audited)
  )

  ;; Action belonging to Agent Alpha: declares that object a craves object b.
  ;; Enforces that a does not already crave any other object (hard constraint).
  (:action alpha-declare-crave-a-b
    :parameters ()
    :precondition (and
      (authorized alpha a b)
      ;; Ensure 'a' does not already crave any other object (explicit negatives for all objects).
      (not (craves a a))
      (not (craves a b))            ;; allow re-declaration? We keep it as negative to require a fresh declaration
      (not (craves a c))
      (not (craves a d))
    )
    :effect (and
      (craves a b)
      (recorded a b)
    )
  )

  ;; Action belonging to Agent Beta: declares that object d craves object c.
  ;; Enforces that d does not already crave any other object (hard constraint).
  (:action beta-declare-crave-d-c
    :parameters ()
    :precondition (and
      (authorized beta d c)
      ;; Ensure 'd' does not already crave any other object (explicit negatives for all objects).
      (not (craves d a))
      (not (craves d b))
      (not (craves d c))            ;; require fresh declaration
      (not (craves d d))
    )
    :effect (and
      (craves d c)
      (recorded d c)
    )
  )

  ;; Auditor action: approves the recorded declarations.
  ;; This action enforces the auditor's report requirement that recorded declarations exist
  ;; before global approval; approval is optional relative to the user's stated goal,
  ;; but is included to reflect the auditor's presence and constraints.
  (:action auditor-approve-records
    :parameters ()
    :precondition (and
      (recorded a b)
      (recorded d c)
    )
    :effect (and
      (audited)
    )
  )
)