(define (problem san_francisco_meeting_problem)
  (:domain san_francisco_meetup)
  (:objects
    presidio north_beach - location
    yourself betty - person
    t_9_00am t_9_18am t_6_45pm t_9_45pm t_10_00pm - time_point
  )
  
  (:init
    (at yourself presidio)
    (time_reached t_9_00am)
    (travel_possible presidio north_beach)
    (travel_possible north_beach presidio)
  )
  
  (:goal
    (met_betty)
  )
)