(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    jesse nancy isabella harold linda - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (required jesse) (required nancy) (required isabella) (required harold) (required linda)

    (unavailable jesse s1000)
    (unavailable jesse s1500)

    (unavailable nancy s0900)
    (unavailable nancy s1030)
    (unavailable nancy s1330)
    (unavailable nancy s1430)

    (unavailable isabella s0900)
    (unavailable isabella s0930)
    (unavailable isabella s1130)
    (unavailable isabella s1530)

    (unavailable harold s0900)
    (unavailable harold s0930)
    (unavailable harold s1030)
    (unavailable harold s1100)
    (unavailable harold s1130)
    (unavailable harold s1200)
    (unavailable harold s1230)
    (unavailable harold s1300)
    (unavailable harold s1330)
    (unavailable harold s1400)
    (unavailable harold s1430)
    (unavailable harold s1500)
    (unavailable harold s1530)
    (unavailable harold s1600)

    (unavailable linda s0900)
    (unavailable linda s0930)
    (unavailable linda s1200)
    (unavailable linda s1330)
    (unavailable linda s1400)
    (unavailable linda s1430)
    (unavailable linda s1500)
    (unavailable linda s1530)

    (available jesse s0900) (available jesse s0930) (available jesse s1030)
    (available jesse s1100) (available jesse s1130) (available jesse s1200)
    (available jesse s1230) (available jesse s1300) (available jesse s1330)
    (available jesse s1400) (available jesse s1430) (available jesse s1530)
    (available jesse s1600) (available jesse s1630)

    (available nancy s0930) (available nancy s1000) (available nancy s1100)
    (available nancy s1130) (available nancy s1200) (available nancy s1230)
    (available nancy s1300) (available nancy s1400) (available nancy s1500)
    (available nancy s1530) (available nancy s1600) (available nancy s1630)

    (available isabella s1000) (available isabella s1030) (available isabella s1100)
    (available isabella s1200) (available isabella s1230) (available isabella s1300)
    (available isabella s1330) (available isabella s1400) (available isabella s1430)
    (available isabella s1500) (available isabella s1600) (available isabella s1630)

    (available harold s1000)
    (available harold s1630)

    (available linda s1000) (available linda s1030) (available linda s1100)
    (available linda s1130) (available linda s1230) (available linda s1300)
    (available linda s1600) (available linda s1630)

    (earliest-feasible s1630)
  )

  (:goal (meeting-scheduled s1630))
)