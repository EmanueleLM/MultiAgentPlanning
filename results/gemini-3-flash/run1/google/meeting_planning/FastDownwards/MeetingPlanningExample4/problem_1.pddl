(define (problem meet_jessica_instance)
  (:domain meeting_planning)
  (:objects
    presidio marina_district - location
    t0900 t0910 t0915 t0930 t0945 t1000 t1015 - time
    s0 s15 s30 s45 s60 - meeting_stage
  )
  (:init
    (agent_at presidio)
    (current_time t0900)
    (meeting_progress s0)
    (travel_time presidio marina_district t0900 t0910)
    (next_time t0910 t0915)
    (next_time t0915 t0930)
    (next_time t0930 t0945)
    (next_time t0945 t1000)
    (next_time t1000 t1015)
    (next_stage s0 s15)
    (next_stage s15 s30)
    (next_stage s30 s45)
    (next_stage s45 s60)
    (jessica_at marina_district t0915)
    (jessica_at marina_district t0930)
    (jessica_at marina_district t0945)
    (jessica_at marina_district t1000)
  )
  (:goal (and (meeting_progress s60)))
)