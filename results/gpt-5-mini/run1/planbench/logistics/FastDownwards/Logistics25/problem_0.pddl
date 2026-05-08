(define (problem pddl_orchestrator-problem)
  (:domain pddl_orchestrator)

  (:objects
    ;; agents
    agent_0 agent_1 agent_2 - agent

    ;; packages
    package_0 package_1 package_2 - package

    ;; locations (include all named in the goal and some connecting locations)
    location_0_0 location_0_1
    location_1_1 location_1_2 location_1_0 location_1_3 - location
  )

  (:init
    ;; Initial agent locations
    (at-agent agent_0 location_0_1)
    (at-agent agent_1 location_1_0)
    (at-agent agent_2 location_1_3)

    ;; Agents start free (not carrying any package)
    (free agent_0)
    (free agent_1)
    (free agent_2)

    ;; Initial package locations (each package initially colocated with its designated agent)
    (at-package package_0 location_0_1)
    (at-package package_1 location_1_0)
    (at-package package_2 location_1_3)

    ;; Connectivity (explicit, bidirectional edges)
    ;; location_0_1 <-> location_0_0 (for package_0 delivery)
    (connected location_0_1 location_0_0)
    (connected location_0_0 location_0_1)

    ;; location_1_0 <-> location_1_1 (for package_1 delivery)
    (connected location_1_0 location_1_1)
    (connected location_1_1 location_1_0)

    ;; location_1_1 <-> location_1_2 (for movement toward package_2's destination)
    (connected location_1_1 location_1_2)
    (connected location_1_2 location_1_1)

    ;; location_1_3 <-> location_1_2 (agent_2 can move to package_2 goal)
    (connected location_1_3 location_1_2)
    (connected location_1_2 location_1_3)
  )

  ;; Global goal: ensure each package is at its mandated final location.
  (:goal (and
    (at-package package_0 location_0_0)
    (at-package package_1 location_1_1)
    (at-package package_2 location_1_2)
  ))
)