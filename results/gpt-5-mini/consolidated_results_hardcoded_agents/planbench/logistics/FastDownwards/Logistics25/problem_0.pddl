(define (problem pddl_orchestrator_problem)
  (:domain pddl_orchestrator_domain)

  (:objects
    ;; agents
    agent_A agent_B - agent

    ;; packages
    package_0 package_1 package_2 - package

    ;; locations (explicit identity preserved)
    location_0_0 location_1_1 location_1_2 - location
  )

  (:init
    ;; Map adjacency (bidirectional edges explicitly listed)
    (adjacent location_0_0 location_1_1)
    (adjacent location_1_1 location_0_0)

    (adjacent location_1_1 location_1_2)
    (adjacent location_1_2 location_1_1)

    ;; Initial agent positions
    ;; Place agent_A at location_1_1 so it can service package_0 initially at location_1_1
    (at-agent agent_A location_1_1)
    ;; Place agent_B at location_0_0 so it can service package_1 initially at location_0_0
    (at-agent agent_B location_0_0)

    ;; Initial package positions (identities preserved)
    (at-package package_0 location_1_1)
    (at-package package_1 location_0_0)
    ;; package_2 already at its required goal location
    (at-package package_2 location_1_2)

    ;; Agents are initially free (not carrying anything)
    (free-agentA)
    (free-agentB)
  )

  ;; Global goal: exact final locations required by the specification
  (:goal
    (and
      (at-package package_0 location_0_0)
      (at-package package_1 location_1_1)
      (at-package package_2 location_1_2)
    )
  )
)