(define (problem meeting-coordination)
  (:domain coordinated-meeting)
  
  (:objects
    agent1 agent2 - agent
    location1 location2 location3 - location
    time1 time2 time3 - time
  )
  
  (:init
    (at agent1 location1)
    (at agent2 location2)
    (available agent1 time1)
    (available agent1 time2)
    (available agent2 time2)
    (available agent2 time3)
    (connected location1 location2)
    (connected location2 location3)
    (connected location3 location1)
  )
  
  (:goal
    (meeting-scheduled agent1 agent2 time2)
  )
)