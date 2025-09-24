(define (problem combined-meeting-problem)
  (:domain combined-meeting)

  (:objects
    agent1 agent2 - agent
    missiondistrict haightashbury - location
    margaret - person
  )

  (:init
    ;; Both agents arrive at MissionDistrict at 09:00 (540 minutes)
    (at agent1 missiondistrict)
    (at agent2 missiondistrict)

    ;; Visitor Margaret will be at HaightAshbury between 08:00 and 15:45
    (visitor-at haightashbury)

    ;; Current time is 09:00
    (= (time) 540)
    (= (met-count) 0)
  )

  (:goal
    (met margaret)
  )

  ;; Maximize number of distinct people met (met-count)
  (:metric maximize (met-count))
)