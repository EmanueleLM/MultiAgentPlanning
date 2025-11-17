(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    ;; agents
    alpha beta - agent

    ;; parts: two parts for scenario A, one part for scenario B
    a_p1 a_p2 b_p1 - part

    ;; stations (alpha workbench and beta inspection bench)
    s_alpha_wb s_beta_ib - station

    ;; phases for scenario A
    A_phase1 A_phase2 A_phase3 - phase

    ;; phases for scenario B
    B_phase1 B_phase2 B_phase3 - phase
  )

  (:init
    ;; Agents and capabilities
    (agent alpha)
    (agent beta)
    (alpha-capable alpha)
    (beta-capable beta)

    ;; Stations and initial agent locations
    (station s_alpha_wb)
    (station s_beta_ib)
    (at alpha s_alpha_wb)
    (at beta s_beta_ib)

    ;; Parts and their initial locations (all start at alpha workbench)
    (part a_p1)
    (part a_p2)
    (part b_p1)
    (part-at a_p1 s_alpha_wb)
    (part-at a_p2 s_alpha_wb)
    (part-at b_p1 s_alpha_wb)

    ;; Phases defined
    (phase A_phase1)
    (phase A_phase2)
    (phase A_phase3)
    (phase B_phase1)
    (phase B_phase2)
    (phase B_phase3)

    ;; Phase ordering for scenario A: place -> assemble -> inspect
    (phase-next A_phase1 A_phase2)
    (phase-next A_phase2 A_phase3)

    ;; Phase ordering for scenario B: place -> assemble -> inspect
    (phase-next B_phase1 B_phase2)
    (phase-next B_phase2 B_phase3)

    ;; Map parts to phases (a part participates in all three phases of its scenario)
    (part-phase a_p1 A_phase1)
    (part-phase a_p1 A_phase2)
    (part-phase a_p1 A_phase3)

    (part-phase a_p2 A_phase1)
    (part-phase a_p2 A_phase2)
    (part-phase a_p2 A_phase3)

    (part-phase b_p1 B_phase1)
    (part-phase b_p1 B_phase2)
    (part-phase b_p1 B_phase3)

    ;; Initially the first phase of each scenario is active; later phases will only
    ;; become active via explicit completion actions to enforce ordering and contiguity.
    (phase-active A_phase1)
    (phase-active B_phase1)
  )

  (:goal
    (and
      ;; All parts must be assembled and inspected (terminal conditions required)
      (assembled a_p1)
      (assembled a_p2)
      (assembled b_p1)

      (inspected a_p1)
      (inspected a_p2)
      (inspected b_p1)

      ;; Final phases must be completed for both scenarios
      (phase-complete A_phase3)
      (phase-complete B_phase3)

      ;; Enforce final agent locations as mandated terminal conditions
      (at alpha s_alpha_wb)
      (at beta s_beta_ib)
    )
  )
)