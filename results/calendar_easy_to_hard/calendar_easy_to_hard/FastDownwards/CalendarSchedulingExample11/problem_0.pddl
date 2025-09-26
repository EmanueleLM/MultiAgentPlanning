(define (problem schedule-meeting-monday)
  (:domain pddl_orchestrator)
  (:objects
    madison linda logan virginia - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )
  (:init
    ;; slots
    (slot t0900) (slot t0930) (slot t1000) (slot t1030) (slot t1100) (slot t1130)
    (slot t1200) (slot t1230) (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ;; Madison free slots (busy: 10:00, 14:30, 15:30, 16:30)
    (free madison t0900) (free madison t0930)
    ;; t1000 busy -> omitted
    (free madison t1030) (free madison t1100) (free madison t1130)
    (free madison t1200) (free madison t1230) (free madison t1300) (free madison t1330) (free madison t1400)
    ;; t1430 busy -> omitted
    (free madison t1500)
    ;; t1530 busy -> omitted
    (free madison t1600)
    ;; t1630 busy -> omitted

    ;; Linda free whole day
    (free linda t0900) (free linda t0930) (free linda t1000) (free linda t1030)
    (free linda t1100) (free linda t1130) (free linda t1200) (free linda t1230)
    (free linda t1300) (free linda t1330) (free linda t1400) (free linda t1430)
    (free linda t1500) (free linda t1530) (free linda t1600) (free linda t1630)

    ;; Logan free slots (busy: 09:00-12:00 -> t0900..t1130 busy; 12:30-16:00 -> t1230..t1530 busy; 16:30-17:00 -> t1630 busy)
    (free logan t1200)
    (free logan t1600)

    ;; Virginia free slots (busy: 09:30-11:00 -> t0930,t1000,t1030 busy; 11:30-12:00 -> t1130 busy;
    ;; 13:00-14:30 -> t1300,t1330,t1400 busy; 15:00-15:30 -> t1500 busy; 16:00-17:00 -> t1600,t1630 busy)
    (free virginia t0900)
    (free virginia t1100)
    (free virginia t1200) (free virginia t1230)
    (free virginia t1430)
    (free virginia t1530)
  )
  ;; Goal: earliest feasible meeting slot that satisfies all constraints is 12:00-12:30 (t1200)
  (:goal (scheduled t1200))
)