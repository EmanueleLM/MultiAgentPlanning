(define (problem combined-meeting-problem)
  (:domain combined-meeting)

  (:objects
    agent1 agent2 - agent
    missiondistrict haightashbury - location
    margaret - person
    t480 t540 t552 t582 t563 t945 - time
  )

  (:init
    (at agent1 missiondistrict)
    (at agent2 missiondistrict)
    (visitor-at haightashbury)
    (current_time t540)
    (plus12 t540 t552)
    (plus30 t552 t582)
    (plus11 t552 t563)
    (within-availability t552 t582)
  )

  (:goal
    (met margaret)
  )
)