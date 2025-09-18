(define (problem meet-joseph-instance)
  (:domain joint-meeting)

  ;; Objects: two agents, one person (Joseph), and three locations as an example.
  (:objects
    agent1 agent2 - agent
    joseph - person
    home1 home2 cafe - location
  )

  ;; Initial state:
  ;; - Agents start at their homes.
  ;; - Joseph is at the cafe.
  ;; - Travel times (in minutes) are provided as numeric initial assignments.
  ;; - Availability windows are provided using timed initial literals:
  ;;     (at T (available <agent>))    --> available becomes true at time T
  ;;     (at T (not (available <agent>))) --> available becomes false at time T
  ;;  Same for Joseph with person-available.
  (:init
    ;; initial locations
    (at agent1 home1)
    (at agent2 home2)
    (at-person joseph cafe)

    ;; travel-time assignments (example values). Replace/extend these with the actual travel times.
    (= (travel-time home1 cafe agent1) 30)   ; agent1: 30 minutes from home1 to cafe
    (= (travel-time home2 cafe agent2) 60)   ; agent2: 60 minutes from home2 to cafe
    (= (travel-time home1 home2 agent1) 45)  ; optional extra edges if needed
    (= (travel-time home2 home1 agent2) 45)

    ;; Timed initial literals for availability windows (example):
    ;; Agent1 is available from t=100 until t=500
    ;; Agent2 is available from t=150 until t=500
    ;; Joseph is available from t=200 until t=500
    ;; These windows ensure the planner must schedule the meeting wholly within overlapping availability.
  )

  ;; Timed initial literals (note: placed after :init in PDDL2.2-style problems)
  (:timed-initial-literals
    ;; Agent1 availability window
    (at 100 (available agent1))
    (at 500 (not (available agent1)))

    ;; Agent2 availability window
    (at 150 (available agent2))
    (at 500 (not (available agent2)))

    ;; Joseph availability window
    (at 200 (person-available joseph))
    (at 500 (not (person-available joseph)))
  )

  ;; Goal: ensure that the joint plan results in meeting Joseph for at least 75 minutes.
  (:goal (met-joseph))

  ;; Optional metric: minimize makespan (if the planner supports it).
  ;; Uncomment if you want to instruct the planner to minimize total time:
  ;;(:metric minimize (total-time))
)