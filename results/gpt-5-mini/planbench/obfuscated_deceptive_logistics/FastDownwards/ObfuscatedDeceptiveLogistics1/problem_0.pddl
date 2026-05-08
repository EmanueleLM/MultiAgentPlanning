; ============================================================
; Problem: multiagent-assembly-instance
; Comment / Auditor corrections applied:
; - Explicit phases (phase1, phase2) and successor relation were added to enforce ordering.
; - Phase activation is modeled as a hard constraint: agentA_activate_next_phase requires the assembly to be completed (assembled ?p) before deactivating phase1 and activating phase2. No post-hoc penalties or quota tokens are used.
; - All preferences were encoded as hard constraints (e.g., inspections cannot occur before activation of phase2).
; - Types and all objects are declared explicitly. No placeholder tokens or implicit resources were added.
; - Actions retain agent-origin prefixes to keep origins distinct.
; ============================================================

(define (problem multiagent-assembly-instance)
  (:domain multiagent-assembly)

  (:objects
    ; agents
    agentA agentB - agent

    ; stations
    base storage assembly_station_1 inspection_station_1 - station

    ; parts
    widget - part

    ; phases
    phase1 phase2 - phase
  )

  (:init
    ; initial agent locations
    (at agentA base)
    (at agentB base)

    ; part location
    (part_at widget storage)

    ; station role declarations
    (assembly_station assembly_station_1)
    (inspection_station inspection_station_1)

    ; initial phase and ordering
    (phase_active phase1)
    (next phase1 phase2)
  )

  ; Goal: the part must be inspected and both agents must end at base.
  (:goal
    (and
      (inspected widget)
      (at agentA base)
      (at agentB base)
      ; ensure phase2 has been activated as part of the process
      (phase_active phase2)
    )
  )
)