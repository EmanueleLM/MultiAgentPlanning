(define (problem schedule-meeting-monday-orchestrated)
  (:domain meeting-orchestration)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; consecutive half-hour relations (09:00..16:30)
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    ;; Agent 1 availability (from first agent's problem).
    ;; Busy: s1000, s1300, s1430, s1600  (those are not asserted free)
    (free-a1 s0900) (free-a1 s0930)
    (free-a1 s1030) (free-a1 s1100) (free-a1 s1130) (free-a1 s1200) (free-a1 s1230)
    (free-a1 s1330) (free-a1 s1400)
    (free-a1 s1500) (free-a1 s1530) (free-a1 s1630)

    ;; Agent 2 availability (from second agent's problem).
    ;; Busy: s0900, s1000, s1330, s1400, s1500, s1530  (those are not asserted free)
    (free-a2 s0930) (free-a2 s1030) (free-a2 s1100) (free-a2 s1130)
    (free-a2 s1200) (free-a2 s1230) (free-a2 s1300) (free-a2 s1430)
    (free-a2 s1600) (free-a2 s1630)

    ;; Agent 3 (Angela) availability (from third agent's problem).
    ;; Busy slots: 09:00..11:00 (starts 09:00,09:30,10:00,10:30,11:00),
    ;; 12:30 (s1230), 13:30..15:00 (s1330,s1400,s1430,s1500), 16:00..16:30 (s1600,s1630)
    ;; Free (per agent3): s1130, s1200, s1300, s1530
    (free-a3 s1130) (free-a3 s1200) (free-a3 s1300) (free-a3 s1530)
  )

  ;; Goal: orchestrator requires a global scheduled meeting that all agents agreed on
  (:goal (scheduled-global))
)