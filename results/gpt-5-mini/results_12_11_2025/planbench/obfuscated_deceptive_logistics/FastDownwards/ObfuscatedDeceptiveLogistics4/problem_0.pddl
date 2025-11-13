(define (problem orchestration-problem)
  (:domain orchestration-domain)
  (:objects
    describer1 manipulator1 auditor1 - agent

    item1 item2 - item

    storage final - location

    phase1 phase2 phase3 phase4 - phase
  )

  (:init
    ;; Phase ordering and role of each phase
    (next phase1 phase2)
    (next phase2 phase3)
    (next phase3 phase4)

    (is-describe-phase phase1)
    (is-move-phase phase2)
    (is-audit-phase phase3)
    (is-repair-phase phase4)

    ;; Start at phase1 (describe phase)
    (current-phase phase1)

    ;; Roles assignment
    (role-describer describer1)
    (role-manipulator manipulator1)
    (role-auditor auditor1)

    ;; Locations: both items start in storage; final is marked final location
    (at item1 storage)
    (at item2 storage)
    (is-final-location final)

    ;; Auditor has reported that item1 needs repair; this must be repaired before finishing.
    (needs-repair item1)

    ;; Nothing is described, audited, or repaired initially (these facts are absent)
  )

  (:goal (and
           ;; Both items must be described
           (described item1)
           (described item2)

           ;; Both items must end up at the final location
           (at item1 final)
           (at item2 final)

           ;; Both items must be audited
           (audited item1)
           (audited item2)

           ;; Item1 was reported needing repair; it must be repaired
           (repaired item1)

           ;; Final required terminal condition is that the current phase is the repair phase
           ;; which enforces the sequence: describe -> move -> audit -> repair
           (current-phase phase4)
         ))
)