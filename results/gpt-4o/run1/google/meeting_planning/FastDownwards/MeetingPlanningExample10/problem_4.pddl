```
(define (problem san_francisco_trip_example)
  (:domain san_francisco_trip)
  (:objects
    golden_gate_park marina_district - location
    stage_9am stage_1015am stage_1030am stage_1045am - time_stage
  )
  (:init
    (at golden_gate_park)
    (at_time stage_9am)
  )
  (:goal (and
    (met_james)
  ))
)
```