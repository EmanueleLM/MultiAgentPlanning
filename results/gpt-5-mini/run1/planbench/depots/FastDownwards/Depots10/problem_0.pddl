(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    loader1 - loader
    carrier1 - carrier
    inspector1 - inspector

    box1 box2 - object

    locA locB locC - location

    phase1 phase2 phase3 - phase
  )

  (:init
    ;; agent initial locations
    (at loader1 locA)
    (at carrier1 locA)
    (at inspector1 locC)

    ;; objects initial locations (at warehouse locA)
    (obj-at box1 locA)
    (obj-at box2 locA)

    ;; connectivity (bidirectional explicitized)
    (connected locA locB)
    (connected locB locA)
    (connected locB locC)
    (connected locC locB)

    ;; goal location: deliveries must be made to locC
    (goal-location locC)

    ;; phase sequencing and initial current phase
    (phase-next phase1 phase2)
    (phase-next phase2 phase3)
    (phase-current phase1)

    ;; no phases initially complete
    ;; (phase-complete ...) absent means not complete
  )

  (:goal
    (and
      ;; All boxes delivered to the designated goal location
      (delivered box1)
      (delivered box2)
      (obj-at box1 locC)
      (obj-at box2 locC)

      ;; All phase completions required as hard constraints:
      (phase-complete phase1)
      (phase-complete phase2)
      (phase-complete phase3)

      ;; Final mandated agent terminal locations:
      (at carrier1 locC)
      (at inspector1 locC)
      (at loader1 locA)
    )
  )
)