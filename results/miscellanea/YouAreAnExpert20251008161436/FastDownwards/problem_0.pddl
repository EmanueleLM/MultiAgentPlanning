(define (problem schedule-monday)
  (:domain schedule-meeting)

  (:objects
    michelle steven jerry - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 - time
  )

  (:init
    ;; Michelle availability (meeting start times that do not overlap her busy 11:00-12:00)
    (available michelle t0900)
    (available michelle t0930)
    (available michelle t1000)
    (available michelle t1200)
    (available michelle t1230)
    (available michelle t1300)
    (available michelle t1330)
    (available michelle t1400)
    (available michelle t1430)
    (available michelle t1500)
    (available michelle t1530)
    (available michelle t1600)

    ;; Steven availability (meeting start times that do not overlap his busy intervals)
    (available steven t0930)
    (available steven t1000)
    (available steven t1030)
    (available steven t1200)
    (available steven t1230)
    (available steven t1400)
    (available steven t1430)
    (available steven t1600)

    ;; Jerry availability (meeting start times that do not overlap his busy intervals)
    (available jerry t1430)
  )

  ;; Goal: meeting scheduled at the earliest feasible time that fits all participants (14:30)
  (:goal (meeting-scheduled t1430))
)