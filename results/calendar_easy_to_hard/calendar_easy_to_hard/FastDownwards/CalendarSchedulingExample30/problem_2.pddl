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

    (allowed_slot s0900) (allowed_slot s0930) (allowed_slot s1000) (allowed_slot s1030)
    (allowed_slot s1100) (allowed_slot s1130) (allowed_slot s1200) (allowed_slot s1230)
    (allowed_slot s1300) (allowed_slot s1330) (allowed_slot s1400) (allowed_slot s1430)
    (allowed_slot s1500) (allowed_slot s1530) (allowed_slot s1600) (allowed_slot s1630)

    (busy eric s1000)
    (busy eric s1230)

    (busy jeremy s1100)
    (busy jeremy s1130)
    (busy jeremy s1230)
    (busy jeremy s1500)

    (available joe s0900) (available joe s0930) (available joe s1000) (available joe s1030)
    (available joe s1100) (available joe s1130) (available joe s1200) (available joe s1230)
    (available joe s1300) (available joe s1330) (available joe s1400) (available joe s1430)
    (available joe s1500) (available joe s1530) (available joe s1600) (available joe s1630)

    (busy brian s0900) (busy brian s0930) (busy brian s1000)
    (busy brian s1100) (busy brian s1130) (busy brian s1200) (busy brian s1230)
    (busy brian s1330)
    (busy brian s1430) (busy brian s1500) (busy brian s1530)
    (busy brian s1630)

    (busy brittany s0900)
    (busy brittany s1030) (busy brittany s1100) (busy brittany s1130)
    (busy brittany s1330) (busy brittany s1400)
    (busy brittany s1500)
    (busy brittany s1630)

    (busy julia s0900) (busy julia s0930) (busy julia s1000) (busy julia s1030)
    (busy julia s1230)
    (busy julia s1330) (busy julia s1400) (busy julia s1430)
    (busy julia s1600) (busy julia s1630)
  )

  (:goal (meeting-scheduled))
)