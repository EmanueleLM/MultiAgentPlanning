(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (work-slot s0900) (work-slot s0930) (work-slot s1000) (work-slot s1030)
    (work-slot s1100) (work-slot s1130) (work-slot s1200) (work-slot s1230)
    (work-slot s1300) (work-slot s1330) (work-slot s1400) (work-slot s1430)
    (work-slot s1500) (work-slot s1530) (work-slot s1600) (work-slot s1630)

    (busy stephen s1000)
    (busy stephen s1200)

    (busy brittany s1100)
    (busy brittany s1330)
    (busy brittany s1530)
    (busy brittany s1630)

    (busy dorothy s0900) (busy dorothy s1000) (busy dorothy s1100) (busy dorothy s1130)
    (busy dorothy s1200) (busy dorothy s1300) (busy dorothy s1330)
    (busy dorothy s1400) (busy dorothy s1430) (busy dorothy s1530)
    (busy dorothy s1600) (busy dorothy s1630)

    (busy rebecca s0930) (busy rebecca s1000) (busy rebecca s1100) (busy rebecca s1200)
    (busy rebecca s1300) (busy rebecca s1330) (busy rebecca s1400) (busy rebecca s1430)
    (busy rebecca s1500) (busy rebecca s1530) (busy rebecca s1600) (busy rebecca s1630)

    (busy jordan s0900) (busy jordan s1000) (busy jordan s1030) (busy jordan s1130)
    (busy jordan s1300) (busy jordan s1330) (busy jordan s1400) (busy jordan s1430)
    (busy jordan s1530) (busy jordan s1600)
  )
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