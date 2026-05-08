(define (problem manipulator_inspect_audit_problem)
  (:domain manipulator_inspect_audit)

  ; Comments / Modeling notes:
  ; - Three agent roles are modeled with disjoint action groups: manipulator_*, inspector_*, auditor_*.
  ; - The process is strictly ordered via explicit phase predicates:
  ;     assembly-done must be true before inspection may occur;
  ;     inspection-done and logged-by-inspector must be true before auditor certifies.
  ; - All preferences from the natural-language specification are enforced as hard constraints:
  ;     instrument must be calibrated to inspect; inspector must log before auditor action; robot battery
  ;     must be OK for manipulator actions. There are no penalty or "post-hoc" remediation actions.
  ; - No implicit bookkeeping is used: each required terminal fact appears in the goal (assembly, inspection,
  ;     certification, product location, and audit log).
  ; - FastDownward-compatible requirements only are declared in the domain header.

  (:objects
    r1 - robot
    pA pB - part
    ws inspect_stor storage - location
    instr1 - instrument
    insp1 - inspector
    aud1 - auditor
  )

  ; Initial state: manipulator at workstation with parts there; instrument at inspection station and calibrated;
  ; inspector at inspection station; battery OK. Nothing assembled, inspected, or certified yet.
  (:init
    (at r1 ws)
    (part-at pA ws)
    (part-at pB ws)
    (instrument-at instr1 inspect_stor)
    (instrument-calibrated instr1)
    (inspector-at insp1 inspect_stor)
    (auditor-at aud1 storage) ; auditor initially at storage (location chosen but not required to move)
    (battery-ok r1)
    ; explicitly state non-goal negative facts are not present by omission; actions use positive and negative preconditions
  )

  ; Goal: product pA attached to pB, inspected, certified, audit logged, and the assembled product at storage.
  ; Also require manipulator end-location fixed at storage (terminal condition).
  (:goal (and
    (attached pA pB)
    (part-at pA storage)
    (part-at pB storage)
    (inspected pA)
    (certified pA)
    (audit-logged pA)
    (logged-by-inspector pA insp1)
    (at r1 storage)
  ))