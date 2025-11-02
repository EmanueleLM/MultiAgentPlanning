(define (problem combined-meeting-problem)
  (:domain combined-meeting)

  (:objects
    agent1 agent2 - agent
    missiondistrict haightashbury - location
    margaret - person
    t480 t540 t552 t582 t945 - time
  )

  (:init
    ;; Both agents start at MissionDistrict at 09:00 (t540)
    (at agent1 missiondistrict)
    (at agent2 missiondistrict)

    ;; Margaret is at HaightAshbury
    (visitor-at haightashbury)

    ;; Current time is 09:00
    (current_time t540)

    ;; Precomputed time arithmetic relations needed for planning
    ;; travel durations: 12 and 11 minutes; meeting duration: 30 minutes
    (plus12 t540 t552)
    (plus30 t552 t582)

    ;; Margaret availability: 08:00 (t480) to 15:45 (t945)
    ;; Precompute that the candidate meeting interval [t552,t582] is within availability
    (within-availability t552 t582)

    ;; total-cost starts at 0
    (= (total-cost) 0)
  )

  (:goal
    (met margaret)
  )

  ;; minimize total-cost; meeting actions decrease cost by 1 to reward meetings
  (:metric minimize (total-cost))
)