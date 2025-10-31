(define (problem schedule-30min-monday-combined)
  (:domain meeting-scheduling-combined)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot

    nicole christine anna terry julie abigail - participant
  )

  (:init
    (available nicole t1200) (available nicole t1600)
    (available christine t1200) (available christine t1600)
    (available anna t1200) (available anna t1600)
    (available terry t1200) (available terry t1600)
    (available julie t1200) (available julie t1600)
    (available abigail t1200) (available abigail t1600)

    (before14 t0900) (before14 t0930) (before14 t1000) (before14 t1030)
    (before14 t1100) (before14 t1130) (before14 t1200) (before14 t1230)
    (before14 t1300) (before14 t1330)
  )

  (:goal (meeting-scheduled))
)