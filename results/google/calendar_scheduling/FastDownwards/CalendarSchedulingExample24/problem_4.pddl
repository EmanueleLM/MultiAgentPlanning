(define (problem schedule-meeting-template)
  (:domain meeting-scheduling)

  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot

    benjamin juan heather nathan jacob - participant
  )

  (:init
    (= (total-cost) 0)

    (is-slot s0900) (is-slot s0930) (is-slot s1000) (is-slot s1030)
    (is-slot s1100) (is-slot s1130) (is-slot s1200) (is-slot s1230)
    (is-slot s1300) (is-slot s1330) (is-slot s1400) (is-slot s1430)
    (is-slot s1500) (is-slot s1530) (is-slot s1600) (is-slot s1630)

    (is-participant benjamin) (is-participant juan) (is-participant heather) (is-participant nathan) (is-participant jacob)

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

    (= (slot-cost s0900) 1)
    (= (slot-cost s0930) 2)
    (= (slot-cost s1000) 3)
    (= (slot-cost s1030) 4)
    (= (slot-cost s1100) 5)
    (= (slot-cost s1130) 6)
    (= (slot-cost s1200) 7)
    (= (slot-cost s1230) 8)
    (= (slot-cost s1300) 9)
    (= (slot-cost s1330) 10)
    (= (slot-cost s1400) 11)
    (= (slot-cost s1430) 12)
    (= (slot-cost s1500) 13)
    (= (slot-cost s1530) 14)
    (= (slot-cost s1600) 15)
    (= (slot-cost s1630) 16)
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