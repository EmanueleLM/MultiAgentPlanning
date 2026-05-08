(define (problem meeting_planning_example_16)
  (:domain meeting_planning)
  (:objects
    chinatown russian_hill - location
    t_09_00 t_09_07 t_15_15 t_17_00 t_17_09 t_21_30 t_21_39 - time
    ronald - person
  )
  (:init
    ;; Starting state: at Chinatown at 9:00 AM
    (at chinatown)
    (current_time t_09_00)

    ;; Travel connectivity based on the problem statement
    ;; Chinatown to Russian Hill: 7 minutes (9:00 to 9:07)
    (can_travel chinatown russian_hill t_09_00 t_09_07)
    
    ;; Wait from arrival at Russian Hill (9:07) until Ronald arrives at Russian Hill (15:15)
    (can_wait t_09_07 t_15_15)

    ;; Ronald is at Russian Hill from 15:15 to 21:30.
    ;; Meeting Ronald for a minimum of 105 minutes.
    ;; A meeting from 15:15 to 17:00 is exactly 105 minutes.
    (can_meet ronald russian_hill t_15_15 t_17_00)

    ;; Progressing time while waiting or after the meeting
    (can_wait t_15_15 t_17_00)
    (can_wait t_17_00 t_21_30)

    ;; Returning to Chinatown: 9 minutes
    ;; From Russian Hill at 17:00 (after meeting) or 21:30 (after Ronald leaves)
    (can_travel russian_hill chinatown t_17_00 t_17_09)
    (can_travel russian_hill chinatown t_21_30 t_21_39)
  )
  (:goal
    (met ronald)
  )
)