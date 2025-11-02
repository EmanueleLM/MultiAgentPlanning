(define (problem schedule-diane-deborah-monday)
  (:domain meeting-scheduling-integrated)

  (:objects
    dianekelly deborah - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
    meeting1 - meeting
  )

  (:init
    (within-work-hours t0900) (within-work-hours t0930) (within-work-hours t1000)
    (within-work-hours t1030) (within-work-hours t1100) (within-work-hours t1130)
    (within-work-hours t1200) (within-work-hours t1230) (within-work-hours t1300)
    (within-work-hours t1330) (within-work-hours t1400) (within-work-hours t1430)
    (within-work-hours t1500) (within-work-hours t1530) (within-work-hours t1600)
    (within-work-hours t1630)

    (free dianekelly t0930)
    (free dianekelly t1000) (free dianekelly t1030)
    (free dianekelly t1100) (free dianekelly t1130)
    (free dianekelly t1230) (free dianekelly t1300)
    (free dianekelly t1330) (free dianekelly t1400)
    (free dianekelly t1530) (free dianekelly t1600) (free dianekelly t1630)

    (free deborah t0930)
    (free deborah t1400)

    (meeting-exists meeting1)
  )

  (:goal (meeting-confirmed))
)