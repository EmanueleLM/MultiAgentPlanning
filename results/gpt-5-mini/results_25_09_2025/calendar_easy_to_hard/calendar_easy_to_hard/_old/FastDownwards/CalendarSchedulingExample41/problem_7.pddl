(define (problem schedule-monday-meeting-integrated)
  (:domain integrated-meeting-scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
    evelyn roy billy gregory vincent philip william - person
  )
  (:init
    (free evelyn s0900) (free evelyn s1000) (free evelyn s1030) (free evelyn s1100)
    (free evelyn s1200) (free evelyn s1230) (free evelyn s1300) (free evelyn s1330)
    (free evelyn s1400) (free evelyn s1430) (free evelyn s1500) (free evelyn s1530)
    (free evelyn s1600) (free evelyn s1630)

    (free roy s0900) (free roy s0930) (free roy s1000) (free roy s1030)
    (free roy s1100) (free roy s1130) (free roy s1200) (free roy s1230)
    (free roy s1300) (free roy s1330) (free roy s1400) (free roy s1430)
    (free roy s1500) (free roy s1530) (free roy s1600) (free roy s1630)

    (free billy s0900) (free billy s0930) (free billy s1000) (free billy s1030)
    (free billy s1100) (free billy s1130) (free billy s1200) (free billy s1230)
    (free billy s1300) (free billy s1330) (free billy s1400) (free billy s1430)
    (free billy s1500) (free billy s1530) (free billy s1600) (free billy s1630)

    (free gregory s0900) (free gregory s0930) (free gregory s1030) (free gregory s1100)
    (free gregory s1130) (free gregory s1200) (free gregory s1230) (free gregory s1300)
    (free gregory s1330) (free gregory s1400) (free gregory s1430) (free gregory s1500)
    (free gregory s1530) (free gregory s1630)

    (free vincent s0900) (free vincent s0930) (free vincent s1030) (free vincent s1200)
    (free vincent s1300) (free vincent s1400) (free vincent s1430) (free vincent s1630)

    (free philip s1030) (free philip s1130) (free philip s1300) (free philip s1330)
    (free philip s1400) (free philip s1430)

    (free william s1000) (free william s1030) (free william s1300) (free william s1430)

    (preferred evelyn s0900) (preferred evelyn s1000) (preferred evelyn s1030) (preferred evelyn s1100)
    (preferred evelyn s1200) (preferred evelyn s1230) (preferred evelyn s1300) (preferred evelyn s1330)
    (preferred evelyn s1400) (preferred evelyn s1430) (preferred evelyn s1500) (preferred evelyn s1530)
    (preferred evelyn s1600) (preferred evelyn s1630)

    (preferred roy s0900) (preferred roy s0930) (preferred roy s1000) (preferred roy s1030)
    (preferred roy s1100) (preferred roy s1130) (preferred roy s1200) (preferred roy s1230)
    (preferred roy s1300) (preferred roy s1330) (preferred roy s1400) (preferred roy s1430)
    (preferred roy s1500) (preferred roy s1530) (preferred roy s1600) (preferred roy s1630)

    (preferred billy s0900) (preferred billy s0930) (preferred billy s1000) (preferred billy s1030)
    (preferred billy s1100) (preferred billy s1130) (preferred billy s1200) (preferred billy s1230)
    (preferred billy s1300) (preferred billy s1330) (preferred billy s1400) (preferred billy s1430)
    (preferred billy s1500) (preferred billy s1530) (preferred billy s1600) (preferred billy s1630)

    (preferred gregory s0900) (preferred gregory s0930) (preferred gregory s1030) (preferred gregory s1100)
    (preferred gregory s1130) (preferred gregory s1200) (preferred gregory s1230) (preferred gregory s1300)
    (preferred gregory s1330) (preferred gregory s1400) (preferred gregory s1430) (preferred gregory s1500)
    (preferred gregory s1530) (preferred gregory s1630)

    (preferred vincent s0900) (preferred vincent s0930) (preferred vincent s1030) (preferred vincent s1200)
    (preferred vincent s1300) (preferred vincent s1400) (preferred vincent s1430) (preferred vincent s1630)

    (preferred philip s1030) (preferred philip s1130) (preferred philip s1300) (preferred philip s1330)
    (preferred philip s1400) (preferred philip s1430)

    (preferred william s1000) (preferred william s1030) (preferred william s1300)
  )
  (:goal (scheduled s1030))
)