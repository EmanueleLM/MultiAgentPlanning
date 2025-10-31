(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    mic steven jerry - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    (adjacent t0900 t0930)
    (adjacent t0930 t1000)
    (adjacent t1000 t1030)
    (adjacent t1030 t1100)
    (adjacent t1100 t1130)
    (adjacent t1130 t1200)
    (adjacent t1200 t1230)
    (adjacent t1230 t1300)
    (adjacent t1300 t1330)
    (adjacent t1330 t1400)
    (adjacent t1400 t1430)
    (adjacent t1430 t1500)
    (adjacent t1500 t1530)
    (adjacent t1530 t1600)
    (adjacent t1600 t1630)

    ;; Michelle free (busy 11:00-12:00 -> t1100,t1130 busy)
    (free mic t0900) (free mic t0930) (free mic t1000) (free mic t1030)
    (free mic t1200) (free mic t1230) (free mic t1300) (free mic t1330)
    (free mic t1400) (free mic t1430) (free mic t1500) (free mic t1530)
    (free mic t1600) (free mic t1630)

    ;; Steven free (busy 09:00-09:30 t0900, 11:30-12:00 t1130, 13:30-14:00 t1330, 15:30-16:00 t1530)
    (free steven t0930) (free steven t1000) (free steven t1030) (free steven t1100)
    (free steven t1200) (free steven t1230) (free steven t1300)
    (free steven t1400) (free steven t1430) (free steven t1500)
    (free steven t1600) (free steven t1630)

    ;; Jerry free (busy: 09:00-09:30 t0900; 10:00-11:00 t1000,t1030; 11:30-12:30 t1130,t1200;
    ;; 13:00-14:30 t1300,t1330,t1400; 15:30-16:00 t1530; 16:30-17:00 t1630)
    (free jerry t0930) (free jerry t1100) (free jerry t1230)
    (free jerry t1430) (free jerry t1500) (free jerry t1600)
  )

  (:goal (and (meeting-at t1430) (meeting-scheduled)))
)