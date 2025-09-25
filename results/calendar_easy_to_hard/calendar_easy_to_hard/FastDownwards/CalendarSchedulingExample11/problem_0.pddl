(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ;; Work-hour availability is modeled by explicit per-person free facts
    ;; Alexander: busy at 09:30,10:30,12:30,14:30,16:00-17:00 (two slots)
    ;; Alexander free slots (within 09:00-17:00): t0900,t1000,t1100,t1130,t1200,t1300,t1330,t1400,t1500,t1530
    (free alexander t0900)
    (free alexander t1000)
    (free alexander t1100)
    (free alexander t1130)
    (free alexander t1200)
    (free alexander t1300)
    (free alexander t1330)
    (free alexander t1400)
    (free alexander t1500)
    (free alexander t1530)

    ;; Elizabeth: busy 09:00-09:30,11:30-12:30,13:00-14:30
    ;; Elizabeth free slots: t0930,t1000,t1030,t1100,t1230,t1430,t1500,t1530,t1600,t1630
    (free elizabeth t0930)
    (free elizabeth t1000)
    (free elizabeth t1030)
    (free elizabeth t1100)
    (free elizabeth t1230)
    (free elizabeth t1430)
    (free elizabeth t1500)
    (free elizabeth t1530)
    (free elizabeth t1600)
    (free elizabeth t1630)

    ;; Walter: busy 09:00-14:30 (09:00..14:00 slots), and 15:30-17:00 (15:30,16:00,16:30)
    ;; Walter free slots: t1430,t1500
    (free walter t1430)
    (free walter t1500)

    ;; No meeting scheduled initially
    ;; (scheduled) is absent initially
  )

  ;; Goal: have a meeting scheduled at a time that satisfies all participants.
  ;; The planner will find the unique compatible slot given the inputs.
  (:goal (meeting-at t1500))
)