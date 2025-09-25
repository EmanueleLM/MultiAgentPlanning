(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    ;; Six participants (agents)
    ronald stephen brittany dorothy rebecca jordan - person

    ;; 30-minute start-time slots from 09:00 to 16:30 (inclusive)
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Define the working slots (09:00 - 16:30 inclusive)
    (work-slot s0900) (work-slot s0930) (work-slot s1000) (work-slot s1030)
    (work-slot s1100) (work-slot s1130) (work-slot s1200) (work-slot s1230)
    (work-slot s1300) (work-slot s1330) (work-slot s1400) (work-slot s1430)
    (work-slot s1500) (work-slot s1530) (work-slot s1600) (work-slot s1630)

    ;; ---- Known busy/availability facts collected from each agent ----
    ;; Agent 1 (Ronald): Ronald is free all day -> no busy facts for Ronald.

    ;; Agent 2 (Stephen): busy at 10:00 and 12:00
    (busy stephen s1000)
    (busy stephen s1200)

    ;; Agent 3 (Brittany): busy at 11:00, 13:30, 15:30, 16:30
    (busy brittany s1100)
    (busy brittany s1330)
    (busy brittany s1530)
    (busy brittany s1630)

    ;; Agent 4 (Dorothy): known free slots: s0930, s1030, s1230, s1500
    ;; -> busy at all other working slots
    (busy dorothy s0900) (busy dorothy s1000) (busy dorothy s1100) (busy dorothy s1130)
    (busy dorothy s1200)                 (busy dorothy s1300) (busy dorothy s1330)
    (busy dorothy s1400) (busy dorothy s1430)                 (busy dorothy s1530)
    (busy dorothy s1600) (busy dorothy s1630)

    ;; Agent 5 (Rebecca): busy at 09:30,10:00,11:00,12:00,13:00,13:30,14:00,14:30,15:00,15:30,16:00,16:30
    (busy rebecca s0930) (busy rebecca s1000) (busy rebecca s1100) (busy rebecca s1200)
    (busy rebecca s1300) (busy rebecca s1330) (busy rebecca s1400) (busy rebecca s1430)
    (busy rebecca s1500) (busy rebecca s1530) (busy rebecca s1600) (busy rebecca s1630)

    ;; Agent 6 (Jordan): busy at 09:00,10:00,10:30,11:30,13:00,13:30,14:00,14:30,15:30,16:00
    (busy jordan s0900) (busy jordan s1000) (busy jordan s1030) (busy jordan s1130)
    (busy jordan s1300) (busy jordan s1330) (busy jordan s1400) (busy jordan s1430)
    (busy jordan s1530) (busy jordan s1600)

    ;; (Optionally you can add explicit free facts; they are redundant here because
    ;; the absence of a busy fact means the slot is considered available by the
    ;; scheduling actions which check (not (busy ...)).)

    ;; Summary: with the above facts the only slot that all six participants are
    ;; known to be free at is s1230 (12:30). The planner can therefore apply any
    ;; agent's schedule action at s1230 to set (scheduled), (meeting-at s1230)
    ;; and (attends X s1230) for all participants.
  )

  ;; Goal: have a single meeting scheduled at s1230 and all six participants attend.
  (:goal (and
    (scheduled)
    (meeting-at s1230)
    (attends ronald s1230)
    (attends stephen s1230)
    (attends brittany s1230)
    (attends dorothy s1230)
    (attends rebecca s1230)
    (attends jordan s1230)
  ))
)