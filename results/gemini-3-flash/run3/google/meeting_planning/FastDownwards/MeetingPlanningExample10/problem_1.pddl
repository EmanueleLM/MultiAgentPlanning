(define (problem meeting_planning_problem)
  (:domain meeting_planning_domain)
  (:objects
    golden_gate_park marina_district - location
    me james - person
    t0900 t0916 t1015 t1030 - time_step
  )
  (:init
    ;; Starting State
    (at me golden_gate_park)
    (cur_time t0900)

    ;; Connectivity and Temporal Logic
    ;; Travel: GGP to Marina District takes 16 mins (9:00 -> 9:16)
    (can_travel golden_gate_park marina_district t0900 t0916)
    
    ;; Waiting: Wait at Marina until James arrives at 10:15
    (can_wait marina_district t0916 t1015)
    
    ;; James's schedule: At Marina District from 10:15 to 1:30 (13:30)
    ;; We define his presence at the key times for a 15-minute meeting.
    (presence james marina_district t1015)
    (presence james marina_district t1030)
    
    ;; Meeting Requirement: 15 minutes minimum.
    ;; Meeting James at Marina from 10:15 to 10:30 satisfies the 15-min requirement.
    (can_meet james marina_district t1015 t1030)
  )
  (:goal
    (and
        (met james)
    )
  )
)