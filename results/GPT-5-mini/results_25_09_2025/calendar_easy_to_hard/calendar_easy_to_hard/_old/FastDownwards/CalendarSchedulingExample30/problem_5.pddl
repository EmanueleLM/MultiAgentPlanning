(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - timeslot
  )

  (:init
    (is-slot s0900) (is-slot s0930) (is-slot s1000) (is-slot s1030)
    (is-slot s1100) (is-slot s1130) (is-slot s1200) (is-slot s1230)
    (is-slot s1300) (is-slot s1330) (is-slot s1400) (is-slot s1430)
    (is-slot s1500) (is-slot s1530) (is-slot s1600) (is-slot s1630)

    ; Eric busy: 10:00-10:30, 12:30-13:00
    (busy eric s1000)
    (busy eric s1230)

    ; Jeremy busy: 11:00-12:00, 12:30-13:00, 15:00-15:30
    (busy jeremy s1100) (busy jeremy s1130)
    (busy jeremy s1230)
    (busy jeremy s1500)

    ; Joe is free (no busy facts)

    ; Brian busy: 09:00-10:30, 11:00-13:00, 13:30-14:00, 14:30-16:00, 16:30-17:00
    (busy brian s0900) (busy brian s0930) (busy brian s1000)
    (busy brian s1100) (busy brian s1130) (busy brian s1200) (busy brian s1230)
    (busy brian s1330)
    (busy brian s1430) (busy brian s1500) (busy brian s1530)
    (busy brian s1630)

    ; Brittany busy: 09:00-09:30, 10:30-12:00, 13:30-14:30, 15:00-15:30, 16:30-17:00
    (busy brittany s0900)
    (busy brittany s1030) (busy brittany s1100) (busy brittany s1130)
    (busy brittany s1330) (busy brittany s1400)
    (busy brittany s1500)
    (busy brittany s1630)

    ; Julia busy: 09:00-11:00, 12:30-13:00, 13:30-15:00, 16:00-17:00
    (busy julia s0900) (busy julia s0930) (busy julia s1000) (busy julia s1030)
    (busy julia s1230)
    (busy julia s1330) (busy julia s1400) (busy julia s1430)
    (busy julia s1600) (busy julia s1630)
  )

  (:goal (meeting-scheduled))
)