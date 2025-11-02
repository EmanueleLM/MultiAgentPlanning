(define (problem integrated-schedule-monday)
  (:domain integrated-scheduling)

  (:objects
    ;; single named person known by agent1
    scott - person

    ;; day
    monday - day

    ;; unified slot names for 30-minute granularity 09:00-17:00
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; --- Agent1 (scott) knowledge ---
    ;; declare agent1's view of valid slots
    (a1_slot s0900) (a1_slot s0930) (a1_slot s1000) (a1_slot s1030)
    (a1_slot s1100) (a1_slot s1130) (a1_slot s1200) (a1_slot s1230)
    (a1_slot s1300) (a1_slot s1330) (a1_slot s1400) (a1_slot s1430)
    (a1_slot s1500) (a1_slot s1530) (a1_slot s1600) (a1_slot s1630)

    ;; scott's availability (derived from agent1 input; busy slots omitted)
    (a1_available scott s0900)
    (a1_available scott s1030)
    (a1_available scott s1100)
    (a1_available scott s1130)
    (a1_available scott s1200)
    (a1_available scott s1230)
    (a1_available scott s1300)
    (a1_available scott s1400)
    (a1_available scott s1500)
    (a1_available scott s1600)

    ;; --- Agent2 (public/work-hour/day) knowledge ---
    ;; every slot belongs to monday (agent2's view)
    (a2_slot_of s0900 monday)
    (a2_slot_of s0930 monday)
    (a2_slot_of s1000 monday)
    (a2_slot_of s1030 monday)
    (a2_slot_of s1100 monday)
    (a2_slot_of s1130 monday)
    (a2_slot_of s1200 monday)
    (a2_slot_of s1230 monday)
    (a2_slot_of s1300 monday)
    (a2_slot_of s1330 monday)
    (a2_slot_of s1400 monday)
    (a2_slot_of s1430 monday)
    (a2_slot_of s1500 monday)
    (a2_slot_of s1530 monday)
    (a2_slot_of s1600 monday)
    (a2_slot_of s1630 monday)

    ;; agent2 work-hour facts (valid start times within 09:00-17:00)
    (a2_work_hour s0900) (a2_work_hour s0930) (a2_work_hour s1000) (a2_work_hour s1030)
    (a2_work_hour s1100) (a2_work_hour s1130) (a2_work_hour s1200) (a2_work_hour s1230)
    (a2_work_hour s1300) (a2_work_hour s1330) (a2_work_hour s1400) (a2_work_hour s1430)
    (a2_work_hour s1500) (a2_work_hour s1530) (a2_work_hour s1600) (a2_work_hour s1630)

    ;; agent2's known constraint: "no meetings on monday" (keeps agent2's original knowledge,
    ;; but the orchestrator action intentionally does not require this predicate)
    (a2_no_meetings monday)

    ;; --- Agent3 (Christine) knowledge ---
    ;; declare agent3's view of valid slots
    (a3_slot s0900) (a3_slot s0930) (a3_slot s1000) (a3_slot s1030)
    (a3_slot s1100) (a3_slot s1130) (a3_slot s1200) (a3_slot s1230)
    (a3_slot s1300) (a3_slot s1330) (a3_slot s1400) (a3_slot s1430)
    (a3_slot s1500) (a3_slot s1530) (a3_slot s1600) (a3_slot s1630)

    ;; Christine's busy times (agent3 input)
    ;; Busy Monday 09:00-10:00 -> s0900, s0930
    (a3_busy s0900) (a3_busy s0930)

    ;; Busy Monday 10:30-12:30 -> s1030, s1100, s1130, s1200
    (a3_busy s1030) (a3_busy s1100) (a3_busy s1130) (a3_busy s1200)

    ;; Busy Monday 13:00-17:00 -> s1300, s1330, s1400, s1430, s1500, s1530, s1600, s1630
    (a3_busy s1300) (a3_busy s1330) (a3_busy s1400) (a3_busy s1430)
    (a3_busy s1500) (a3_busy s1530) (a3_busy s1600) (a3_busy s1630)
  )

  ;; Goal: get a meeting scheduled that fits both agent1's and agent3's constraints.
  ;; We require both agents to acknowledge that a meeting is scheduled.
  (:goal (and
            (a1_meeting_scheduled)
            (a3_meeting_scheduled)
         )
  )
)