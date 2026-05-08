(define (problem meeting_planning_example4)
  (:domain meeting_planning)
  (:objects
    presidio marina_district - location
    jessica - person
    t0900 t0915 t0930 t0945 t1000 t1015 t1030 t1045 t1100 - time
    p0 p15 p30 p45 p60 - progress
  )
  (:init
    ;; Initial location and time
    (at_loc presidio)
    (curr_time t0900)
    
    ;; Initial meeting status with Jessica
    (meeting_status jessica p0)
    
    ;; Time sequence (15-minute intervals)
    (next_time t0900 t0915)
    (next_time t0915 t0930)
    (next_time t0930 t0945)
    (next_time t0945 t1000)
    (next_time t1000 t1015)
    (next_time t1015 t1030)
    (next_time t1030 t1045)
    (next_time t1045 t1100)
    
    ;; Progress sequence for the 60-minute meeting requirement
    (next_progress p0 p15)
    (next_progress p15 p30)
    (next_progress p30 p45)
    (next_progress p45 p60)
    
    ;; Jessica's availability at Marina District (9:15 AM to 5:45 PM)
    ;; We only model her presence for the duration needed to fulfill the 60-minute meeting.
    (person_at jessica marina_district t0915)
    (person_at jessica marina_district t0930)
    (person_at jessica marina_district t0945)
    (person_at jessica marina_district t1000)
    (person_at jessica marina_district t1015)
    (person_at jessica marina_district t1030)
    (person_at jessica marina_district t1045)
  )
  (:goal
    ;; Meet Jessica for a minimum of 60 minutes
    (meeting_status jessica p60)
  )
)