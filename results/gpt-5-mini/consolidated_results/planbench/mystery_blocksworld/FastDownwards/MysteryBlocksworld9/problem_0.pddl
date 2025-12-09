(define (problem craving-goal)
  (:domain craving-management)
  (:objects
    a b d - obj
    auditor1 operator1 - agent
  )

  (:init
    ; Capabilities: auditor1 can authorize/audit, operator1 can induce cravings.
    (can_authorize auditor1)
    (can_induce operator1)

    ; No identities, audits, authorizations, or cravings are present initially.
    ; Agents are present and ready to act by virtue of capability predicates above.
  )

  ; Goal: enforce final craving facts plus the auditor-mandated artifacts (audits, authorizations, identity verification).
  ; All natural-language preferences (audit before authorization before inducing craving, identity verification first)
  ; are encoded here as hard terminal conditions as required.
  (:goal (and
    ; required final craving relations
    (craves b d)
    (craves d a)

    ; auditor report constraints encoded as hard terminal conditions:
    ; both audited pairs must be completed
    (audited b d)
    (audited d a)

    ; both authorizations for the inducing agent must be present
    (authorized operator1 b d)
    (authorized operator1 d a)

    ; identities must have been verified for all objects involved
    (id_verified a)
    (id_verified b)
    (id_verified d)
  ))
)