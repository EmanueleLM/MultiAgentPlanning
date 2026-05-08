(define (problem meeting_planning_example_15)
  (:domain meeting_planning)
  (:objects
    russian_hill golden_gate_park - location
    t0900 t0921 t1300 t1330 t1400 t1430 - time
    john - person
    stage_0m stage_30m stage_60m stage_90m - stage
  )
  (:init
    (at russian_hill)
    (current_time t0900)
    (person_at john golden_gate_park)
    (meeting_progress john stage_0m)
    
    ;; Travel configuration
    (can_travel russian_hill golden_gate_park t0900 t0921)
    
    ;; Successive time points for waiting and meeting
    (next_time t0921 t1300)
    (next_time t1300 t1330)
    (next_time t1330 t1400)
    (next_time t1400 t1430)
    
    ;; Successive stages for meeting duration (30-minute intervals)
    (next_stage stage_0m stage_30m)
    (next_stage stage_30m stage_60m)
    (next_stage stage_60m stage_90m)
    
    ;; John's availability window starts at 1:00PM (t1300)
    (is_available john t1300)
    (is_available john t1330)
    (is_available john t1400)
  )
  (:goal
    (and
      (meeting_progress john stage_90m)
    )
  )
)