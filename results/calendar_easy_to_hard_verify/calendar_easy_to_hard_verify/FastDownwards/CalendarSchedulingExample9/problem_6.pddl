(define (problem schedule-meeting-mon)
  (:domain schedule-meeting)

  (:objects
    diane kelly deborah - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (free diane s0930)
    (free diane s1000)
    (free diane s1030)
    (free diane s1100)
    (free diane s1130)
    (free diane s1230)
    (free diane s1300)
    (free diane s1330)
    (free diane s1400)
    (free diane s1530)
    (free diane s1600)
    (free diane s1630)

    (free kelly s0900)
    (free kelly s1000)
    (free kelly s1100)
    (free kelly s1130)
    (free kelly s1200)
    (free kelly s1230)
    (free kelly s1300)
    (free kelly s1330)
    (free kelly s1400)
    (free kelly s1430)
    (free kelly s1500)
    (free kelly s1530)
    (free kelly s1600)
    (free kelly s1630)

    (free deborah s0930)
    (free deborah s1400)
  )

  (:goal (and (scheduled) (meeting_at s1400)))
)