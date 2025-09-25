(define (problem schedule-meeting-diane-deborah)
  (:domain meeting-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )
  (:init
    (free diane_kelly t1000)
    (free diane_kelly t1100)
    (free diane_kelly t1130)
    (free diane_kelly t1230)
    (free diane_kelly t1300)
    (free diane_kelly t1330)
    (free diane_kelly t1400)
    (free diane_kelly t1530)
    (free diane_kelly t1600)
    (free diane_kelly t1630)
    (free deborah t0930)
    (free deborah t1400)
  )
  (:goal (and (attended diane_kelly) (attended deborah)))
)