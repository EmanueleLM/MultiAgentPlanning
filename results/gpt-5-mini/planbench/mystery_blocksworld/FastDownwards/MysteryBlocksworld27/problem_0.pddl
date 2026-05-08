(define (problem sequential-assembly-problem)
  (:domain sequential-assembly)

  ; Objects
  (:objects
    agentA agentB agentC auditor deployer - agent
    site1 - location
    phase1 phase2 phase3 phase4 phase5 - phase
  )

  ; Initial state
  (:init
    ; Agents start co-located at the site
    (at agentA site1)
    (at agentB site1)
    (at agentC site1)
    (at auditor site1)
    (at deployer site1)

    ; Phase ordering (explicit immediate successors)
    (phase-next phase1 phase2)
    (phase-next phase2 phase3)
    (phase-next phase3 phase4)
    (phase-next phase4 phase5)

    ; The workflow starts at phase1 (preparation)
    (current-phase phase1)

    ; Nothing has yet been performed at the site
    ; (prepared site1) false
    ; (assembled site1) false
    ; (tested site1) false
    ; (approved site1) false
    ; (deployed site1) false

    ; Note: provenance facts absent initially; actions will add them.
  )

  ; Goal: All mandated terminal conditions must hold. Enforces full sequence.
  (:goal
    (and
      (prepared site1)
      (assembled site1)
      (tested site1)
      (approved site1)
      (deployed site1)
      (current-phase phase5)
    )
  )
)