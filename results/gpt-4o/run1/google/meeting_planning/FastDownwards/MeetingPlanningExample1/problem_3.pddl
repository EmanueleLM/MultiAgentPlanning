(define (problem visit_san_francisco)
  (:domain meeting_friend)
  (:objects 
    richmond_district financial_district - location
    agent betty - person
    time_9_00AM time_5_15PM time_6_15PM time_9_45PM - time
  )
  (:init
    (at_location agent richmond_district)
    (at_time time_9_00AM)
    (next_time time_9_00AM time_5_15PM)
    (next_time time_5_15PM time_6_15PM)
    (next_time time_6_15PM time_9_45PM)
    (at_location betty financial_district)
  )
  (:goal (met_betty))
)