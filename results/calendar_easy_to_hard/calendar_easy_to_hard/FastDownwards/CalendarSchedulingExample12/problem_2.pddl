(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    dylan kathryn hannah anna orchestrator - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )
  (:init
    (person dylan) (person kathryn) (person hannah) (person anna) (person orchestrator)
    (time t0900) (time t0930) (time t1000) (time t1030)
    (time t1100) (time t1130) (time t1200) (time t1230)
    (time t1300) (time t1330) (time t1400) (time t1430)
    (time t1500) (time t1530) (time t1600) (time t1630)
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ;; Dylan busy 14:00-15:00 -> blocked t1400,t1430; free otherwise
    (free dylan t0900) (free dylan t0930) (free dylan t1000) (free dylan t1030)
    (free dylan t1100) (free dylan t1130) (free dylan t1200) (free dylan t1230)
    (free dylan t1300) (free dylan t1330) (free dylan t1500) (free dylan t1530)
    (free dylan t1600) (free dylan t1630)

    ;; Kathryn busy 09:00-09:30 (t0900) and 10:00-10:30 (t1000)
    (free kathryn t0930) (free kathryn t1030) (free kathryn t1100) (free kathryn t1130)
    (free kathryn t1200) (free kathryn t1230) (free kathryn t1300) (free kathryn t1330)
    (free kathryn t1400) (free kathryn t1430) (free kathryn t1500) (free kathryn t1530)
    (free kathryn t1600) (free kathryn t1630)

    ;; Hannah busy 09:00-10:30 (t0900,t0930,t1000), 12:30-15:30 (t1230,t1300,t1330,t1400,t1430), 16:00-16:30 (t1600)
    (free hannah t1030) (free hannah t1100) (free hannah t1130) (free hannah t1200)
    (free hannah t1500) (free hannah t1530) (free hannah t1630)

    ;; Anna busy 09:00-11:00 (t0900,t0930,t1000,t1030), 12:00-14:00 (t1200,t1230,t1300,t1330), 14:30-15:00 (t1430), 16:00-16:30 (t1600)
    (free anna t1100) (free anna t1130) (free anna t1400) (free anna t1500)
    (free anna t1530) (free anna t1630)
  )
  (:goal (meeting-scheduled t1100))
)