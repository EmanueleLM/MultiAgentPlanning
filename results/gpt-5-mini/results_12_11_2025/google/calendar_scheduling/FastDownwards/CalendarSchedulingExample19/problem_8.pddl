(define (problem schedule_monday_meeting)
  (:domain calendar_scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
    m1 - meeting
  )

  (:init
    ;; work hours slots
    (work_slot s0900) (work_slot s0930) (work_slot s1000) (work_slot s1030)
    (work_slot s1100) (work_slot s1130) (work_slot s1200) (work_slot s1230)
    (work_slot s1300) (work_slot s1330) (work_slot s1400) (work_slot s1430)
    (work_slot s1500) (work_slot s1530) (work_slot s1600) (work_slot s1630)

    ;; explicit immediate successor relations (30-minute grid)
    (next s0900 s0930)
    (next s0930 s1000)
    (next s1000 s1030)
    (next s1030 s1100)
    (next s1100 s1130)
    (next s1130 s1200)
    (next s1200 s1230)
    (next s1230 s1300)
    (next s1300 s1330)
    (next s1330 s1400)
    (next s1400 s1430)
    (next s1430 s1500)
    (next s1500 s1530)
    (next s1530 s1600)
    (next s1600 s1630)

    ;; Free facts consistent with audited availability (no extra claims)
    ;; Stephen busy: s1000, s1300, s1430, s1600 -> free all other work slots
    (free stephen s0900) (free stephen s0930) (free stephen s1030) (free stephen s1100)
    (free stephen s1130) (free stephen s1200) (free stephen s1230) (free stephen s1330)
    (free stephen s1400) (free stephen s1500) (free stephen s1530) (free stephen s1630)

    ;; Edward busy: s0900, s1000, s1330, s1400, s1500, s1530 -> free others
    (free edward s0930) (free edward s1030) (free edward s1100) (free edward s1130)
    (free edward s1200) (free edward s1230) (free edward s1300) (free edward s1430)
    (free edward s1600) (free edward s1630)

    ;; Angela busy: s0900,s0930,s1000,s1030,s1100,s1230,s1330,s1400,s1430,s1500,s1600,s1630
    ;; -> free: s1130, s1200, s1300, s1530
    (free angela s1130) (free angela s1200) (free angela s1300) (free angela s1530)
  )

  (:goal (scheduled m1))
)