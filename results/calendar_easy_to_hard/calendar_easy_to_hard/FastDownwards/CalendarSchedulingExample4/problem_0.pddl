(define (problem schedule-meeting-monday)
  (:domain multi-agent-scheduling)
  (:objects
    donna john billy - agent
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230
    t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - time
  )

  (:init
    ;; Donna is busy at 14:00-14:30 (t_1400) and 15:30-16:00 (t_1530); free at all other half-hour slots
    (free donna t_0900) (free donna t_0930) (free donna t_1000) (free donna t_1030)
    (free donna t_1100) (free donna t_1130) (free donna t_1200) (free donna t_1230)
    (free donna t_1300) (free donna t_1330) ; not t_1400
    (free donna t_1430) (free donna t_1500) ; not t_1530
    (free donna t_1600) (free donna t_1630)

    ;; John is busy at 11:00-11:30 (t_1100) and 16:30-17:00 (t_1630); free at other slots
    (free john t_0900) (free john t_0930) (free john t_1000) (free john t_1030)
    ; not t_1100
    (free john t_1130) (free john t_1200) (free john t_1230)
    (free john t_1300) (free john t_1330) (free john t_1400) (free john t_1430)
    (free john t_1500) (free john t_1530) (free john t_1600) ; not t_1630

    ;; Billy is busy 9:00-10:00 (t_0900,t_0930), 10:30-14:00 (t_1030..t_1330), and 14:30-17:00 (t_1430..t_1630).
    ;; Thus Billy is free only at 10:00-10:30 (t_1000) and 14:00-14:30 (t_1400).
    (free billy t_1000) (free billy t_1400)
  )

  ;; Goal: schedule the meeting. From integrated schedules the only feasible common slot is t_1000 (10:00-10:30).
  (:goal (meeting-scheduled t_1000))
)