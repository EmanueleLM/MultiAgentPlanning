(define (problem schedule-meeting-template)
  (:domain meeting-scheduling)

  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot

    benjamin juan heather nathan jacob - participant
  )

  (:init
    (= (total-cost) 0)

    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    (participant benjamin) (participant juan) (participant heather) (participant nathan) (participant jacob)

    (free benjamin s0900) (free benjamin s0930) (free benjamin s1030) (free benjamin s1100)
    (free benjamin s1200) (free benjamin s1300) (free benjamin s1430) (free benjamin s1530)
    (free benjamin s1630)

    (free juan s0900) (free juan s0930) (free juan s1030) (free juan s1130)
    (free juan s1230) (free juan s1300) (free juan s1330) (free juan s1400)
    (free juan s1600) (free juan s1630)

    (free heather s0930) (free heather s1030) (free heather s1100) (free heather s1130)
    (free heather s1200) (free heather s1300) (free heather s1330) (free heather s1430)
    (free heather s1500) (free heather s1530) (free heather s1600) (free heather s1630)

    (free nathan s1100) (free nathan s1230) (free nathan s1300) (free nathan s1330)
    (free nathan s1430) (free nathan s1600)

    (free jacob s0930) (free jacob s1030) (free jacob s1300) (free jacob s1500)
  )

  (:goal (and
    (meeting-started s1300)
    (attends benjamin s1300)
    (attends juan s1300)
    (attends heather s1300)
    (attends nathan s1300)
    (attends jacob s1300)
  ))

  (:metric minimize (total-cost))
)