(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    ;; Persons
    gerald roy barbara - person

    ;; Time objects (agent-1 canonical t0..t15 -> 09:00..16:30 starts every 30 min)
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time

    ;; Additional time-named objects used by agent-3 (keep distinct names)
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time

    ;; Slot objects used by agent-2
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; participants
    (participant gerald) (participant roy) (participant barbara)

    ;; slot declarations (agent-2)
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ;; agent-1: before13 marker for t0..t7 (09:00..12:30)
    (before13 t0) (before13 t1) (before13 t2) (before13 t3)
    (before13 t4) (before13 t5) (before13 t6) (before13 t7)

    ;; ------------------------
    ;; Agent-1 availability (free ?person ?time)
    ;; roy and barbara: free all t0..t15 (per agent-1)
    (free roy t0) (free roy t1) (free roy t2) (free roy t3)
    (free roy t4) (free roy t5) (free roy t6) (free roy t7)
    (free roy t8) (free roy t9) (free roy t10) (free roy t11)
    (free roy t12) (free roy t13) (free roy t14) (free roy t15)

    (free barbara t0) (free barbara t1) (free barbara t2) (free barbara t3)
    (free barbara t4) (free barbara t5) (free barbara t6) (free barbara t7)
    (free barbara t8) (free barbara t9) (free barbara t10) (free barbara t11)
    (free barbara t12) (free barbara t13) (free barbara t14) (free barbara t15)

    ;; gerald free times per agent-1 (known busy slots omitted)
    ;; Gerald busy: t0 (09:00), t8,t9 (13:00-14:00), t12 (15:00-15:30), t14,t15 (16:00-17:00)
    (free gerald t1) (free gerald t2) (free gerald t3) (free gerald t4)
    (free gerald t5) (free gerald t6) (free gerald t7)
    (free gerald t10) (free gerald t11) (free gerald t13)

    ;; ------------------------
    ;; Agent-2 availability (free-slot roy ?s) and feasibility
    ;; roy free on all agent-2 slots (as provided)
    (free-slot roy s09_00) (free-slot roy s09_30) (free-slot roy s10_00) (free-slot roy s10_30)
    (free-slot roy s11_00) (free-slot roy s11_30) (free-slot roy s12_00) (free-slot roy s12_30)
    (free-slot roy s13_00) (free-slot roy s13_30) (free-slot roy s14_00) (free-slot roy s14_30)
    (free-slot roy s15_00) (free-slot roy s15_30) (free-slot roy s16_00) (free-slot roy s16_30)

    ;; agent-2 marks s10_00 as a feasible-for-all slot (public info)
    (feasible s10_00)

    ;; ------------------------
    ;; Agent-3 facts (barbara is host and has availability)
    (is-host barbara)
    (can-schedule)
    ;; agent-3 available time slots (third agent names)
    (available barbara t0900)
    (available barbara t1000)
    (available barbara t1030)
    (available barbara t1100)
    (available barbara t1400)
    (available barbara t1500)

    ;; ------------------------
    ;; Bridge mapping: relate agent-2 slot s10_00 to agent-1 time t2 (10:00)
    (slot-time s10_00 t2)
  )

  (:goal (and
    (meeting-scheduled)
    (meeting-with gerald)
    (meeting-with roy)
    (meeting-with-2 s10_00 gerald barbara)
  ))
)