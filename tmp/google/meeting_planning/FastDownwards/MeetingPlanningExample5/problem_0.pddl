(define (problem meeting-instance-example)
  (:domain meeting-orchestrator)

  (:objects
    a1 a2 - agent
    locA locB locM - location
  )

  (:init
    ;; initial locations
    (at a1 locA)
    (at a2 locB)

    ;; time tracking
    (= (time) 0)
    (= (visitor-travel) 0)

    ;; meeting length
    (= (meeting-duration) 2)

    ;; availability windows (example):
    ;; agent a1 is available from time 0 to 10
    ;; agent a2 is available from time 3 to 10
    (= (avail-start a1) 0)
    (= (avail-end a1) 10)
    (= (avail-start a2) 3)
    (= (avail-end a2) 10)

    ;; travel times (example values)
    ;; a1 travels from locA -> locM in 2 time units
    (= (travel-time a1 locA locM) 2)
    (= (travel-time a1 locM locA) 2)
    ;; a2 travels from locB -> locM in 4 time units
    (= (travel-time a2 locB locM) 4)
    (= (travel-time a2 locM locB) 4)
    ;; other travel edges (examples)
    (= (travel-time a1 locA locB) 5)
    (= (travel-time a2 locB locA) 5)
  )

  ;; goal: meeting completed
  (:goal (meeting-done))

  ;; objective: minimize visitor travel (here visitor = a1 in this example)
  (:metric minimize (visitor-travel))
)