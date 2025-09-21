(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    stephen edward angela orchestrator - person
    c0900 c0930 c1000 c1030 c1100 c1130 c1200 c1230 c1300 c1330 c1400 c1430 c1500 c1530 c1600 c1630 - cslot
  )
  (:init
    (allowed_start c0900) (allowed_start c0930) (allowed_start c1000) (allowed_start c1030)
    (allowed_start c1100) (allowed_start c1130) (allowed_start c1200) (allowed_start c1230)
    (allowed_start c1300) (allowed_start c1330) (allowed_start c1400) (allowed_start c1430)
    (allowed_start c1500) (allowed_start c1530) (allowed_start c1600)

    ;; stephen busy at c1000, c1300, c1430, c1600 -> free at other slots
    (free stephen c0900) (free stephen c0930) (free stephen c1030) (free stephen c1100)
    (free stephen c1130) (free stephen c1200) (free stephen c1230) (free stephen c1330)
    (free stephen c1400) (free stephen c1500) (free stephen c1530) (free stephen c1630)

    ;; edward busy at c0900, c1000, c1330, c1400, c1500, c1530 -> free at other slots
    (free edward c0930) (free edward c1030) (free edward c1100) (free edward c1130)
    (free edward c1200) (free edward c1230) (free edward c1300) (free edward c1430)
    (free edward c1600) (free edward c1630)

    ;; angela busy at c0900 c0930 c1000 c1030 c1100 c1230 c1330 c1400 c1430 c1500 c1600 c1630
    ;; free at remaining slots
    (free angela c1130) (free angela c1200) (free angela c1300) (free angela c1530)

    ;; orchestrator has no private constraints -> free all slots
    (free orchestrator c0900) (free orchestrator c0930) (free orchestrator c1000) (free orchestrator c1030)
    (free orchestrator c1100) (free orchestrator c1130) (free orchestrator c1200) (free orchestrator c1230)
    (free orchestrator c1300) (free orchestrator c1330) (free orchestrator c1400) (free orchestrator c1430)
    (free orchestrator c1500) (free orchestrator c1530) (free orchestrator c1600) (free orchestrator c1630)
  )
  (:goal (global_scheduled))
)