(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects)  ; all necessary constants declared in domain

  (:init
    ;; phase ordering / contiguity links
    (next phase1 phase2)
    (next phase2 phase3)
    (next phase3 phase4)
    (next phase4 phase5)

    ;; start at intake phase1
    (phase-active phase1)

    ;; orchestrator has received the inputs (as stated)
    (has orchestrator analysis)
    (has orchestrator audit_report)
    (has orchestrator public_info)
    (has orchestrator private_info)

    ;; mark private_info as confidential initially; sealing is required later
    (confidential private_info)

    ;; a global-goal marker reflecting the provided global goal (informational)
    (global-goal paltry_task)

    ;; No reviewed, integrated, archived, sealed, or published facts are true initially.
    ;; Containment facts: integrated_report does not contain private_info initially (no fact),
    ;; and no action in the domain will add such a containment.
  )

  ;; Goal: final mandated terminal conditions (hard constraints)
  ;; - integrated_report must have been integrated
  ;; - integrated_report must be archived
  ;; - private_info must be sealed (kept confidential)
  ;; - integrated_report must be published
  (:goal
    (and
      (integrated integrated_report)
      (archived integrated_report)
      (sealed private_info)
      (published integrated_report)
    )
  )
)