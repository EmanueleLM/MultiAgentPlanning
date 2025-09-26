(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    michelle steven jerry
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630
  )

  (:init
    ;; adjacency (start -> next half-hour)
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ;; Michelle availability (busy 11:00-12:00 → t1100 and t1130 unavailable)
    (available michelle t0900) (available michelle t0930) (available michelle t1000) (available michelle t1030)
    (available michelle t1200) (available michelle t1230) (available michelle t1300) (available michelle t1330)
    (available michelle t1400) (available michelle t1430) (available michelle t1500) (available michelle t1530)
    (available michelle t1600) (available michelle t1630)

    ;; Steven availability (busy 09:00-09:30 -> t0900 unavailable;
    ;; busy 11:30-12:00 -> t1130 unavailable;
    ;; busy 13:30-14:00 -> t1330 unavailable;
    ;; busy 15:30-16:00 -> t1530 unavailable)
    (available steven t0930) (available steven t1000) (available steven t1030) (available steven t1100)
    (available steven t1200) (available steven t1230) (available steven t1300)
    (available steven t1400) (available steven t1430) (available steven t1500)
    (available steven t1600) (available steven t1630)

    ;; Jerry availability (busy 09:00-09:30 t0900;
    ;; 10:00-11:00 t1000,t1030;
    ;; 11:30-12:30 t1130,t1200;
    ;; 13:00-14:30 t1300,t1330,t1400;
    ;; 15:30-16:00 t1530;
    ;; 16:30-17:00 t1630)
    (available jerry t0930) (available jerry t1100) (available jerry t1230)
    (available jerry t1430) (available jerry t1500) (available jerry t1600)
  )

  ;; Goal: earliest feasible 60-minute (two-slot) start that fits all constraints
  (:goal (meeting-scheduled t1430))
)