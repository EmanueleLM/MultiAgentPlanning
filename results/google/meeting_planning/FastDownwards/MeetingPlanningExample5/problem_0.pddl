(define (problem meeting-example)
  (:domain meeting-orchestration)
  (:objects
    agentA agentB - agent
    home office meetpoint - location
  )

  (:init
    ;; initial positions
    (at agentA home)
    (at agentB office)

    ;; initial numeric state
    (= (current-time) 0)
    (= (total-cost) 0)

    ;; set meeting duration (example: 30 minutes)
    (= (meeting-duration) 30)

    ;; availability windows (example values in same time units as travel times)
    ;; Agent A (visitor) is available from time 10 to 120
    (= (avail-start agentA) 10)
    (= (avail-end agentA) 120)

    ;; Agent B (host) is available from time 0 to 200
    (= (avail-start agentB) 0)
    (= (avail-end agentB) 200)

    ;; travel-time assignments (example numbers)
    ;; travel-time agentA: home -> meetpoint = 20, home -> office = 40
    (= (travel-time agentA home meetpoint) 20)
    (= (travel-time agentA home office) 40)
    ;; For completeness: reverse directions
    (= (travel-time agentA meetpoint home) 20)
    (= (travel-time agentA office home) 40)

    ;; travel-time agentB: office -> meetpoint = 15, office -> home = 45
    (= (travel-time agentB office meetpoint) 15)
    (= (travel-time agentB office home) 45)
    (= (travel-time agentB meetpoint office) 15)
    (= (travel-time agentB home office) 45)
  )

  ;; Goal: meeting occurs (orchestrator goal)
  (:goal (meeting-scheduled))

  ;; Objective: minimize visitor travel time (total-cost)
  (:metric minimize (total-cost))
)