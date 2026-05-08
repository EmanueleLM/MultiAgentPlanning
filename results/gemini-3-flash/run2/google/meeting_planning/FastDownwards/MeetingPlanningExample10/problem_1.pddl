(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects 
    golden_gate_park marina_district - location
    t0900 t0916 t1015 t1030 t1330 - time
    james - person
  )
  (:init 
    ;; Starting position and time
    (at_me golden_gate_park t0900)
    
    ;; James's schedule at Marina District
    (is_at james marina_district t1015)
    (is_at james marina_district t1030)
    (is_at james marina_district t1330)
    
    ;; Travel connectivity and durations
    ;; Golden Gate Park to Marina District takes 16 minutes
    (can_travel golden_gate_park marina_district t0900 t0916)
    
    ;; Temporal ordering for wait and meet actions
    (next t0916 t1015)
    (next t1015 t1030)
    (next t1030 t1330)
    
    ;; Valid meeting intervals (James is there for at least 15 mins)
    ;; 10:15 AM to 10:30 AM is 15 minutes
    (duration_met t1015 t1030)
  )
  (:goal 
    (met james)
  )
)