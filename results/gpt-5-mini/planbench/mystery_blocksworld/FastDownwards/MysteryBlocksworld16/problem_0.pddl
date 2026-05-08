(define (problem delivery_instance_1)
  (:domain multi_agent_phased_delivery)
  (:objects
    ;; agents
    auditor_agent loader_agent transporter_agent orchestrator_agent - agent

    ;; package(s)
    pkg1 - package

    ;; locations
    locA locB locC - loc

    ;; phases
    phase1 phase2 phase3 - phase
  )

  (:init
    ;; role assignments
    (is-auditor auditor_agent)
    (is-loader loader_agent)
    (is-transporter transporter_agent)
    (is-orchestrator orchestrator_agent)

    ;; initial locations: all agents and package start at locA (origin)
    (at-agent auditor_agent locA)
    (at-agent loader_agent locA)
    (at-agent transporter_agent locA)
    (at-package pkg1 locA)

    ;; initial phase is phase1 (inspection)
    (current-phase phase1)

    ;; enforce phase succession (contiguity)
    (phase-succ phase1 phase2)
    (phase-succ phase2 phase3)
  )

  (:goal (and
    ;; terminal conditions mandated by the reconciled specification
    (at-package pkg1 locC)    ;; package delivered to destination locC
    (inspected pkg1)          ;; inspection completed
    (unloaded pkg1)           ;; package unloaded at destination
    (current-phase phase3)    ;; process reached final phase
    (at-agent transporter_agent locC) ;; transporter at destination
  ))