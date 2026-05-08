(define (problem multiagent-logistics-problem)
  (:domain multiagent-logistics)

  (:objects
    truck1 - truck
    hoist1 - hoist
    depot site dest - location
    container1 - container
    s1 s2 s3 s4 s5 s6 s7 s8 s9 - step
  )

  (:init
    (at-truck truck1 depot)
    (at-hoist hoist1 site)
    (at-container container1 site)

    (truck-empty truck1)
    (hoist-idle hoist1)

    (current-step s1)
  )

  (:goal (and
    (at-container container1 dest)
    (at-truck truck1 dest)
    (truck-empty truck1)
    (hoist-idle hoist1)
    (current-step s9)
  ))
)