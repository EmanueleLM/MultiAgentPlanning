(define (problem orchestrate-monday)
  (:domain orchestrated-meeting)

  (:objects
    ;; Agent 1 slot names (from first agent)
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - slot1

    ;; Agent 2 slot names (s0..s15)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot2

    ;; Agent 3 slot names (from third agent)
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 - slot3

    ;; canonical slots representing 30-min starts 09:00..16:30
    c0900 c0930 c1000 c1030 c1100 c1130 c1200 c1230 c1300 c1330 c1400 c1430 c1500 c1530 c1600 c1630 - cslot
  )

  (:init
    ;; canonical adjacency (30-minute successors)
    (cnext c0900 c0930) (cnext c0930 c1000) (cnext c1000 c1030) (cnext c1030 c1100)
    (cnext c1100 c1130) (cnext c1130 c1200) (cnext c1200 c1230) (cnext c1230 c1300)
    (cnext c1300 c1330) (cnext c1330 c1400) (cnext c1400 c1430) (cnext c1430 c1500)
    (cnext c1500 c1530) (cnext c1530 c1600) (cnext c1600 c1630)

    ;; --------------------
    ;; MAPPINGS: map each agent's slot names to canonical slots
    ;; Agent 1 mapping (t09_00 etc -> canonical)
    (maps1 t09_00 c0900) (maps1 t09_30 c0930) (maps1 t10_00 c1000) (maps1 t10_30 c1030)
    (maps1 t11_00 c1100) (maps1 t11_30 c1130) (maps1 t12_00 c1200) (maps1 t12_30 c1230)
    (maps1 t13_00 c1300) (maps1 t13_30 c1330) (maps1 t14_00 c1400) (maps1 t14_30 c1430)
    (maps1 t15_00 c1500) (maps1 t15_30 c1530) (maps1 t16_00 c1600) (maps1 t16_30 c1630)

    ;; Agent 2 mapping (s0..s15 -> canonical)
    (maps2 s0 c0900) (maps2 s1 c0930) (maps2 s2 c1000) (maps2 s3 c1030)
    (maps2 s4 c1100) (maps2 s5 c1130) (maps2 s6 c1200) (maps2 s7 c1230)
    (maps2 s8 c1300) (maps2 s9 c1330) (maps2 s10 c1400) (maps2 s11 c1430)
    (maps2 s12 c1500) (maps2 s13 c1530) (maps2 s14 c1600) (maps2 s15 c1630)

    ;; Agent 3 mapping (t0900..t1700 -> canonical where applicable)
    (maps3 t0900 c0900) (maps3 t0930 c0930) (maps3 t1000 c1000) (maps3 t1030 c1030)
    (maps3 t1100 c1100) (maps3 t1130 c1130) (maps3 t1200 c1200) (maps3 t1230 c1230)
    (maps3 t1300 c1300) (maps3 t1330 c1330) (maps3 t1400 c1400) (maps3 t1430 c1430)
    (maps3 t1500 c1500) (maps3 t1530 c1530) (maps3 t1600 c1600) (maps3 t1630 c1630)
    ;; note: t1700 is an endpoint; no canonical start maps to it (meeting cannot start at t1700)

    ;; --------------------
    ;; Agent 1 knowledge (from first agent)
    ;; work hours (Monday 09:00-16:30 starts)
    (a1_work t09_00) (a1_work t09_30) (a1_work t10_00) (a1_work t10_30)
    (a1_work t11_00) (a1_work t11_30) (a1_work t12_00) (a1_work t12_30)
    (a1_work t13_00) (a1_work t13_30) (a1_work t14_00) (a1_work t14_30)
    (a1_work t15_00) (a1_work t15_30) (a1_work t16_00) (a1_work t16_30)

    ;; known busy half-hour intervals (agent1)
    ;; Monday 10:00-10:30, 13:00-13:30, 14:30-15:00, 16:00-16:30
    (a1_busy t10_00)
    (a1_busy t13_00)
    (a1_busy t14_30)
    (a1_busy t16_00)

    ;; --------------------
    ;; Agent 2 knowledge (from second agent - Edward)
    ;; free slots (all slots except explicitly known busy)
    ;; Known busy (from agent 2): s0, s2, s9, s10, s12, s13
    (a2_free s1) (a2_free s3) (a2_free s4) (a2_free s5) (a2_free s6)
    (a2_free s7) (a2_free s8) (a2_free s11) (a2_free s14) (a2_free s15)

    ;; --------------------
    ;; Agent 3 knowledge (from third agent)
    ;; within-work starts (Monday 09:00-16:30 as start times)
    (a3_within t0900) (a3_within t0930) (a3_within t1000) (a3_within t1030)
    (a3_within t1100) (a3_within t1130) (a3_within t1200) (a3_within t1230)
    (a3_within t1300) (a3_within t1330) (a3_within t1400) (a3_within t1430)
    (a3_within t1500) (a3_within t1530) (a3_within t1600) (a3_within t1630)

    ;; agent3 free slots (from their knowledge)
    ;; "Monday 09:00-11:30" -> t0900,t0930,t1000,t1030,t1100
    (a3_free t0900) (a3_free t0930) (a3_free t1000) (a3_free t1030) (a3_free t1100)
    ;; "Monday 12:30-13:00" -> t1230
    (a3_free t1230)
    ;; "Monday 13:30-15:30" -> t1330,t1400,t1430,t1500
    (a3_free t1330) (a3_free t1400) (a3_free t1430) (a3_free t1500)
    ;; "Monday 16:00-17:00" -> t1600,t1630
    (a3_free t1600) (a3_free t1630)
  )

  ;; Goal: the orchestrator should achieve a global_scheduled flag,
  ;; which requires all three agents to have scheduled the meeting on the same canonical start slot.
  (:goal (global_scheduled))
)