(define (problem schedule-integration)
  (:domain multi-agent-scheduling)
  (:objects
    ; agents
    orchestrator mary - agent
    ; locations
    hq nobhill marina - location
    ; discrete hourly time slots
    t00 t01 t02 t03 t04 t05 t06 t07 t08 t09 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 - time
  )

  (:init
    ; time successor relation (contiguity enforced)
    (next t00 t01) (next t01 t02) (next t02 t03) (next t03 t04)
    (next t04 t05) (next t05 t06) (next t06 t07) (next t07 t08)
    (next t08 t09) (next t09 t10) (next t10 t11) (next t11 t12)
    (next t12 t13) (next t13 t14) (next t14 t15) (next t15 t16)
    (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20)
    (next t20 t21) (next t21 t22) (next t22 t23)

    ; Initial positions and availability
    ; Orchestrator begins at HQ at 08:00 (t08). The plan must include an explicit arrival at Nob Hill at 09:00 later.
    (at orchestrator hq t08)

    ; Orchestrator free time slots (we provide free slots for the planning horizon used)
    (free orchestrator t08) (free orchestrator t09) (free orchestrator t10) (free orchestrator t11)
    (free orchestrator t12) (free orchestrator t13) (free orchestrator t14) (free orchestrator t15)
    (free orchestrator t16) (free orchestrator t17) (free orchestrator t18) (free orchestrator t19)
    (free orchestrator t20) (free orchestrator t21)

    ; Mary is available only between 20:00 and 22:00 (t20 and t21). Place Mary at Marina for those two slots.
    (at mary marina t20)
    (at mary marina t21)
    (free mary t20)
    (free mary t21)

    ; No other initial (at ...) facts are given; all other at facts must be produced by actions.
    ; Note: travel connectivity and asymmetric durations are encoded by separate move actions:
    ; - Nob Hill -> Marina takes 1 hour (orch-move-nobhill-to-marina)
    ; - Marina -> Nob Hill takes 2 hours (orch-move-marina-to-nobhill-2h)
    ; - HQ -> Nob Hill established as 1 hour (orch-move-hq-to-nobhill)
    ; These are explicit; no other implicit connectivity exists.
  )

  (:goal (and
    ; The orchestrator must have arrived at Nob Hill at 09:00 (this arrival action sets visited-nobhill-by09
    ; and the explicit presence at t09 is also required so arrival is fixed).
    (at orchestrator nobhill t09)
    (visited-nobhill-by09)
    ; Must have met Mary for at least 120 minutes between 20:00 and 22:00.
    (met-with-mary)
  ))