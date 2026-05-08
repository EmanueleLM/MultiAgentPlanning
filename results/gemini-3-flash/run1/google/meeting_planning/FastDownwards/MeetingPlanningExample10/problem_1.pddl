(define (problem meeting_planning_example_10)
  (:domain meeting_planning_domain)
  (:objects
    golden_gate_park marina_district - location
    james - person
    t0900 t0916 t1015 t1030 t1048 t1315 t1330 t1348 - time
  )
  (:init
    ;; Starting state: Arrive at Golden Gate Park at 9:00 AM
    (at golden_gate_park)
    (current_time t0900)

    ;; Movement constraints:
    ;; Golden Gate Park to Marina District: 16 minutes
    (can_move golden_gate_park marina_district t0900 t0916)
    
    ;; Wait constraints:
    ;; Waiting at Marina District until James arrives at 10:15 AM
    (can_wait marina_district t0916 t1015)
    ;; Waiting after the first possible meeting until the end of James's stay
    (can_wait marina_district t1030 t1315)

    ;; Meeting constraints:
    ;; James is at Marina District from 10:15 AM to 1:30 PM (13:30)
    ;; Minimum meeting duration is 15 minutes.
    ;; Schedule A: Meet right when James arrives
    (can_meet james marina_district t1015 t1030)
    ;; Schedule B: Meet just before James leaves
    (can_meet james marina_district t1315 t1330)

    ;; Connectivity for completeness (Marina to Golden Gate Park: 18 minutes)
    (can_move marina_district golden_gate_park t1030 t1048)
    (can_move marina_district golden_gate_park t1330 t1348)
  )
  (:goal
    (and
      (has_met james)
    )
  )
)