(define (problem meeting_planning_example16)
  (:domain meeting_planning)
  (:objects
    chinatown russian_hill - location
    t_09_00 t_09_07 t_15_08 t_15_15 t_17_00 t_17_09 t_21_30 - time
  )
  (:init
    ;; Starting state: Arrive at Chinatown at 9:00 AM.
    (at_loc chinatown)
    (at_time t_09_00)

    ;; Temporal ordering of discrete time points.
    (next_time t_09_00 t_09_07)
    (next_time t_09_07 t_15_08)
    (next_time t_15_08 t_15_15)
    (next_time t_15_15 t_17_00)
    (next_time t_17_00 t_17_09)
    (next_time t_17_09 t_21_30)

    ;; Travel connectivity and durations.
    ;; Chinatown to Russian Hill: 7 minutes.
    (can_move chinatown russian_hill t_09_00 t_09_07)
    (can_move chinatown russian_hill t_15_08 t_15_15)
    ;; Russian Hill to Chinatown: 9 minutes.
    (can_move russian_hill chinatown t_17_00 t_17_09)

    ;; Ronald is at Russian Hill from 3:15 PM (15:15) to 9:30 PM (21:30).
    ;; Meeting requirement: Minimum of 105 minutes.
    ;; 15:15 + 105 minutes = 17:00. This is within Ronald's window.
    (can_meet russian_hill t_15_15 t_17_00)
  )
  (:goal
    ;; Objective: Meet Ronald for the required duration.
    (met_ronald)
  )
)