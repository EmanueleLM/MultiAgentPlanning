; PDDL Problem: pddl_orchestrator
; This problem uses the pddl_orchestrator domain. The initial facts reflect audited corrections:
; - part1 is in loc_storage
; - part2 was corrected by the auditor's audit and is initially at loc_workstation
; The goal enforces final phase p5 and that both parts are corrected, agents at loc_sink,
; and the manipulator holds nothing (encoded as negative goal literals).
(define (problem pddl_orchestrator_problem)
  (:domain pddl_orchestrator)

  (:objects
    ; Agents
    manip1 - manipulator
    aud1   - auditor

    ; Parts
    part1 part2 - part

    ; Locations
    loc_storage loc_workstation loc_inspection loc_sink - location

    ; Phases
    p1 p2 p3 p4 p5 - phase
  )

  (:init
    ; Agent locations
    (at_agent manip1 loc_storage)
    (at_agent aud1 loc_inspection)

    ; Parts initial locations (audited correction: part2 at loc_workstation)
    (at_part part1 loc_storage)
    (at_part part2 loc_workstation)

    ; No part has been processed/inspected/corrected yet (absence modeled by no predicate).

    ; Phase ordering and initial phase
    (phase_successor p1 p2)
    (phase_successor p2 p3)
    (phase_successor p3 p4)
    (phase_successor p4 p5)

    (current_phase p1)

    ; Note: phase_ready predicates will be set by explicit check_* actions when prerequisites are met.
  )

  (:goal
    (and
      ; Final phase must be reached
      (current_phase p5)

      ; Both parts must be corrected
      (corrected part1)
      (corrected part2)

      ; Final agent locations (explicit terminal conditions)
      (at_agent manip1 loc_sink)
      (at_agent aud1 loc_sink)

      ; Ensure manipulator is holding no parts at termination (negative preconditions allowed)
      (not (holding manip1 part1))
      (not (holding manip1 part2))
    )
  )
)