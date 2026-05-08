(define (problem delivery_problem)
  (:domain delivery_domain)

  ;; Objects: packages and the explicitly named locations.
  (:objects
    package_0 package_1 package_2 - package
    location_0_0 location_1_1 location_1_2 - location
  )

  ;; Initial state:
  ;; - Agent positions (agents are domain constants declared in the domain)
  ;; - Package initial placements chosen so movement is required to meet the goal.
  (:init
    ;; agents start positions
    (agent-at agent_0 location_1_1)
    (agent-at agent_1 location_0_0)
    (agent-at agent_2 location_1_2)

    ;; initial package placements (none are held initially)
    (package-at package_0 location_1_1)
    (package-at package_1 location_0_0)
    (package-at package_2 location_1_1)
  )

  ;; Goal: all packages must be at their mandated target locations.
  (:goal
    (and
      (package-at package_0 location_0_0)
      (package-at package_1 location_1_1)
      (package-at package_2 location_1_2)
    )
  )
)