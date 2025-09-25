(define (problem combined-meeting-problem)
  (:domain combined-meeting)

  (:objects
    agent1 agent2 - agent
    mission-district haight-ashbury - location
    margaret - person
    t480 t540 t552 t582 t563 t945 - time
  )

  (:init
    (at agent1 mission-district)
    (at agent2 mission-district)
    (visitor-at haight-ashbury)
    (current-time t540)
    (plus12 t540 t552)
    (plus30 t552 t582)
    (plus11 t552 t563)
    (within-availability t552 t582)
  )

  (:goal
    (met margaret)
  )
)