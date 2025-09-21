(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    stephen edward angela orchestrator - person
    c0900 c0930 c1000 c1030 c1100 c1130 c1200 c1230 c1300 c1330 c1400 c1430 c1500 c1530 c1600 c1630 - cslot
  )
  (:init
    ;; allowed start times (meeting is 60 minutes = two consecutive 30-min slots),
    ;; last allowed start is 16:00 (c1600 -> c1630 covers until 17:00)
    (allowed_start c0900) (allowed_start c0930) (allowed_start c1000) (allowed_start c1030)
    (allowed_start c1100) (allowed_start c1130) (allowed_start c1200) (allowed_start c1230)
    (allowed_start c1300) (allowed_start c1330) (allowed_start c1400) (allowed_start c1430)
    (allowed_start c1500) (allowed_start c1530) (allowed_start c1600)

    ;; consecutive half-hour slots
    (next c0900 c0930) (next c0930 c1000) (next c1000 c1030) (next c1030 c1100)
    (next c1100 c1130) (next c1130 c1200) (next c1200 c1230) (next c1230 c1300)
    (next c1300 c1330) (next c1330 c1400) (next c1400 c1430) (next c1430 c1500)
    (next c1500 c1530) (next c1530 c1600) (next c1600 c1630)

    ;; free slots derived from agents' private busy information (private busy slots are omitted)
    ;; Stephen busy: c1000 c1300 c1430 c1600
    (free stephen c0900) (free stephen c0930) (free stephen c1030) (free stephen c1100)
    (free stephen c1130) (free stephen c1200) (free stephen c1230) (free stephen c1330)
    (free stephen c1400) (free stephen c1500) (free stephen c1530) (free stephen c1630)

    ;; Edward busy: c0900 c1000 c1330 c1400 c1500 c1530
    (free edward c0930) (free edward c1030) (free edward c1100) (free edward c1130)
    (free edward c1200) (free edward c1230) (free edward c1300) (free edward c1430)
    (free edward c1600) (free edward c1630)

    ;; Angela busy: c0900 c0930 c1000 c1030 c1100 c1230 c1330 c1400 c1430 c1500 c1600 c1630
    (free angela c1130) (free angela c1200) (free angela c1300) (free angela c1530)
  )
  (:goal (meeting_scheduled))
)