(define (problem orchestrate-monday-meeting)
  (:domain orchestrated-meeting)

  ;; Objects: people, standardized slot names (30-minute slots 09:00-16:30 -> 16 slots), and the meeting
  (:objects
    benjamin hannah brenda - person
    m1 - meeting

    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Types / Entities
    (person benjamin) (person hannah) (person brenda)
    (meeting m1)

    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Work-hours (all slots lie within 09:00-17:00)
    (within-workhours s0900) (within-workhours s0930)
    (within-workhours s1000) (within-workhours s1030)
    (within-workhours s1100) (within-workhours s1130)
    (within-workhours s1200) (within-workhours s1230)
    (within-workhours s1300) (within-workhours s1330)
    (within-workhours s1400) (within-workhours s1430)
    (within-workhours s1500) (within-workhours s1530)
    (within-workhours s1600) (within-workhours s1630)

    ;; Agent 1 information (Benjamin's known availability & preference)
    ;; Benjamin is known available for the entire day (agent1's available)
    (available benjamin s0900) (available benjamin s0930)
    (available benjamin s1000) (available benjamin s1030)
    (available benjamin s1100) (available benjamin s1130)
    (available benjamin s1200) (available benjamin s1230)
    (available benjamin s1300) (available benjamin s1330)
    (available benjamin s1400) (available benjamin s1430)
    (available benjamin s1500) (available benjamin s1530)
    (available benjamin s1600) (available benjamin s1630)

    ;; Benjamin's preference (he prefers 09:00 slot as per agent1)
    (preferred benjamin s0900)

    ;; Agent 2 information (Hannah is free all day)
    (free hannah s0900) (free hannah s0930)
    (free hannah s1000) (free hannah s1030)
    (free hannah s1100) (free hannah s1130)
    (free hannah s1200) (free hannah s1230)
    (free hannah s1300) (free hannah s1330)
    (free hannah s1400) (free hannah s1430)
    (free hannah s1500) (free hannah s1530)
    (free hannah s1600) (free hannah s1630)

    ;; Align Agent 1 and Agent 2 views for Benjamin: declare him free in Agent 2's predicate as well
    (free benjamin s0900) (free benjamin s0930)
    (free benjamin s1000) (free benjamin s1030)
    (free benjamin s1100) (free benjamin s1130)
    (free benjamin s1200) (free benjamin s1230)
    (free benjamin s1300) (free benjamin s1330)
    (free benjamin s1400) (free benjamin s1430)
    (free benjamin s1500) (free benjamin s1530)
    (free benjamin s1600) (free benjamin s1630)

    ;; Agent 3 information (Brenda's known free slots, mapped to the standardized slot names)
    ;; From agent3: Brenda is free at t0,t2,t3,t4,t7,t8,t9,t15 -> map to:
    ;; t0 = s0900, t2 = s1000, t3 = s1030, t4 = s1100, t7 = s1230, t8 = s1300, t9 = s1330, t15 = s1630
    (free brenda s0900)
    (free brenda s1000)
    (free brenda s1030)
    (free brenda s1100)
    (free brenda s1230)
    (free brenda s1300)
    (free brenda s1330)
    (free brenda s1630)

    ;; Note: No extra (free ...) facts for Brenda beyond those given by agent3 (we do not assume unknown availability).
    ;; No initial scheduled/occupied/meeting-scheduled facts.
  )

  ;; Goal: find and represent a single 30-minute slot that satisfies all three agents' views.
  ;; We require that the meeting m1 is scheduled according to agent1's representation, agent2's representation,
  ;; and agent3's representation, and that all three participants are in the meeting.
  (:goal (and
    (scheduled-a1 m1 s0900)            ; agent1: meeting m1 scheduled at 09:00 (respects Benjamin's preference)
    (meeting-scheduled-a2 m1 s0900)    ; agent2: meeting m1 scheduled at 09:00 (everyone must be free per agent2)
    (scheduled-a3 s0900)               ; agent3: slot s0900 is scheduled (Brenda's view)
    (in-meeting benjamin m1)
    (in-meeting hannah m1)
    (in-meeting brenda m1)
  ))
)