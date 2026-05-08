(define (problem san_francisco_trip_example)
  (:domain san_francisco_trip)
  (:objects
    golden_gate_park marina_district - location
    james - friend
    start_time james_available_start james_available_end end_meeting_time - time
  )
  (:init
    (at golden_gate_park)
    (time start_time)
  )
  (:goal (and
    (met_james)
  ))
)