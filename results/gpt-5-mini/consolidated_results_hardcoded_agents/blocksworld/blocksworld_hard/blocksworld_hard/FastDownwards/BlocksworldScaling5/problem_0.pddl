(define (problem assembly-job-1)
  (:domain assembly-sequence)
  (:objects
    workerA workerB - agent
    home_a home_b storage_base storage_component assembly_stand - location
    base component - part
    phase1 phase2 phase3 phase4 phase_done - phase
  )

  (:init
    ;; initial agent locations
    (at workerA home_a)
    (at workerB home_b)

    ;; initial part locations
    (part-at base storage_base)
    (part-at component storage_component)

    ;; phase ordering (successor links). These enforce contiguity.
    (phase-next phase1 phase2)
    (phase-next phase2 phase3)
    (phase-next phase3 phase4)
    (phase-next phase4 phase_done)

    ;; start in phase1
    (current-phase phase1)
  )

  ;; Goal: device must be assembled and tested, and both workers must be back at their home locations.
  ;; This fixes mandated terminal conditions (completed tasks and final locations).
  (:goal (and
    assembled
    tested
    (at workerA home_a)
    (at workerB home_b)
  ))