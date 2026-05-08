(define (problem san_francisco_meeting_problem)
  (:domain san_francisco_meetup)
  (:objects
    presidio north_beach - location
    yourself betty - person
    9_00am 6_45pm 10_00pm - time_point
  )
  
  (:init
    (at yourself presidio)
    (time_reached 9_00am)
    (travel_possible presidio north_beach)
    (travel_possible north_beach presidio)
  )
  
  (:goal
    (met_betty)
  )
)