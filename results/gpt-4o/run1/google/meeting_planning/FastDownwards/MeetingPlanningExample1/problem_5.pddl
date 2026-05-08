(define (problem visit_san_francisco)
  (:domain meeting_friend)
  (:objects 
    richmond_district financial_district - location
    agent betty - person
    time_9_00am time_5_15pm time_6_15pm time_9_45pm - time
  )
  (:init
    (at_location agent richmond_district)
    (at_time time_9_00am)
    (next_time time_9_00am time_5_15pm)
    (next_time time_5_15pm time_6_15pm)
    (next_time time_6_15pm time_9_45pm)
    (at_location betty financial_district)
  )
  (:goal (met_betty))
)