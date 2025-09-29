(define (problem TripPlanningExample5)
  (:domain trip-planning)
  (:objects
    oslo porto dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    oslo_s1 oslo_s2 oslo_s3 oslo_s4 oslo_s5 oslo_s6 - slot-oslo
    porto_s1 porto_s2 porto_s3 porto_s4 porto_s5 porto_s6 porto_s7 - slot-porto
    dub_s1 dub_s2 dub_s3 dub_s4 dub_s5 - slot-dubrovnik
  )
  (:init
    (flight oslo dubrovnik)
    (flight dubrovnik oslo)
    (flight porto oslo)
    (flight oslo porto)

    (first d1)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)
    (next d14 d15)
    (next d15 d16)

    (available-oslo oslo_s1)
    (available-oslo oslo_s2)
    (available-oslo oslo_s3)
    (available-oslo oslo_s4)
    (available-oslo oslo_s5)
    (available-oslo oslo_s6)

    (available-porto porto_s1)
    (available-porto porto_s2)
    (available-porto porto_s3)
    (available-porto porto_s4)
    (available-porto porto_s5)
    (available-porto porto_s6)
    (available-porto porto_s7)

    (available-dubrovnik dub_s1)
    (available-dubrovnik dub_s2)
    (available-dubrovnik dub_s3)
    (available-dubrovnik dub_s4)
    (available-dubrovnik dub_s5)

    (= (total-cost) 0)
  )
  (:goal (and
    (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5) (assigned d6) (assigned d7) (assigned d8)
    (assigned d9) (assigned d10) (assigned d11) (assigned d12) (assigned d13) (assigned d14) (assigned d15) (assigned d16)
    (in d12 dubrovnik)
    (in d16 dubrovnik)
    (used-oslo oslo_s1) (used-oslo oslo_s2) (used-oslo oslo_s3) (used-oslo oslo_s4) (used-oslo oslo_s5) (used-oslo oslo_s6)
    (used-porto porto_s1) (used-porto porto_s2) (used-porto porto_s3) (used-porto porto_s4) (used-porto porto_s5) (used-porto porto_s6) (used-porto porto_s7)
    (used-dubrovnik dub_s1) (used-dubrovnik dub_s2) (used-dubrovnik dub_s3) (used-dubrovnik dub_s4) (used-dubrovnik dub_s5)
  ))
)