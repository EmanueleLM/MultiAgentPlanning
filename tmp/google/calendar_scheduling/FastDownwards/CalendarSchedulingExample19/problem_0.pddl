(define (problem meeting-problem)
  (:domain meeting-orchestrator)
  (:objects
    p1 p2 p3 p4 - person
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230 t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - time
    s_13_30 s_14_00 s_15_00 s_15_30 - time
  )
  (:init
    ; From agent 1: known busy blocks for participants
    (busy p1 t_1000)   ; Monday 10:00-10:30 is busy for participant 1
    (busy p2 t_1300)   ; Monday 13:00-13:30 is busy for participant 2
    (busy p3 t_1430)   ; Monday 14:30-15:00 is busy for participant 3
    (busy p4 t_1600)   ; Monday 16:00-16:30 is busy for participant 4

    ; From agent 3: known free blocks for 11:30-12:30 option
    (free t_1130) ; 11:30-12:00 free
    (free t_1200) ; 12:00-12:30 free

    ; From agent 2: known free blocks for two 60-minute options
    (free s_13_30) ; 13:30-14:00 free
    (free s_14_00) ; 14:00-14:30 free (completes 13:30-14:30 window)
    (free s_15_00) ; 15:00-15:30 free
    (free s_15_30) ; 15:30-16:00 free (completes 15:00-16:00 window)
  )
  ; No explicit goal state here; the domain's goal is to have at least one meeting scheduled in the constraints.
)