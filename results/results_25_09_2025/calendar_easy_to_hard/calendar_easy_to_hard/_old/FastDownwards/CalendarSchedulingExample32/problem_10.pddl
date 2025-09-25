(define (problem schedule-30min-monday)
  (:domain meeting-scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot

    nicole christine anna terry julie abigail - participant
  )

  (:init
    ; nicole (busy 10:00-10:30 t1000, 14:30-15:00 t1430)
    (available nicole t0900) (available nicole t0930) (available nicole t1030)
    (available nicole t1100) (available nicole t1130) (available nicole t1200)
    (available nicole t1230) (available nicole t1300) (available nicole t1330)
    (available nicole t1400) (available nicole t1500) (available nicole t1530)
    (available nicole t1600) (available nicole t1630)

    ; christine (busy 11:00-11:30 t1100, 12:30-13:00 t1230)
    (available christine t0900) (available christine t0930) (available christine t1000)
    (available christine t1030) (available christine t1130) (available christine t1200)
    (available christine t1300) (available christine t1330) (available christine t1400)
    (available christine t1430) (available christine t1500) (available christine t1530)
    (available christine t1600) (available christine t1630)

    ; anna (busy 09:30-10:30 t0930,t1000; 11:00-11:30 t1100; 12:30-13:00 t1230; 15:30-16:00 t1530; 16:30-17:00 t1630)
    ; preference: would rather not meet before 14:00 -> only available from 14:00 onward
    (available anna t1400) (available anna t1430) (available anna t1500) (available anna t1600)

    ; terry (busy 09:30-11:30 t0930,t1000,t1030,t1100; 13:00-13:30 t1300; 14:00-15:30 t1400,t1430,t1500)
    (available terry t0900) (available terry t1130) (available terry t1200)
    (available terry t1230) (available terry t1330) (available terry t1530)
    (available terry t1600) (available terry t1630)

    ; julie (busy 10:00-12:00 t1000,t1030,t1100,t1130; 12:30-13:30 t1230,t1300; 14:00-15:00 t1400,t1430)
    (available julie t0900) (available julie t0930) (available julie t1200)
    (available julie t1330) (available julie t1500) (available julie t1530)
    (available julie t1600) (available julie t1630)

    ; abigail (busy 09:00-10:00 t0900; 11:30-12:00 t1130; 12:30-14:00 t1230,t1300,t1330; 14:30-15:00 t1430; 16:30-17:00 t1630)
    (available abigail t0930) (available abigail t1000) (available abigail t1030)
    (available abigail t1100) (available abigail t1200) (available abigail t1400)
    (available abigail t1500) (available abigail t1530) (available abigail t1600)
  )

  (:goal (meeting-scheduled))
)