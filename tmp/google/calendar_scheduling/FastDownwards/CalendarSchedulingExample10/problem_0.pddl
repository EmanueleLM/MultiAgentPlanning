(define (problem schedule-30min-monday-all)
  (:domain multi-agent-meeting)

  (:objects
    ; canonical unified timeslots (09:00 - 16:30 in 30-min increments)
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot

    diana ethan janet - person
    meeting1 - meeting
  )

  (:init
    ; --- Agent 1 knowledge (Diana) mapped into unified timeslots ---
    ; Diana is available except 11:30 and 13:00 (those were omitted by agent1)
    (available diana t0900)
    (available diana t0930)
    (available diana t1000)
    (available diana t1030)
    (available diana t1100)
    ; t1130 omitted -> busy
    (available diana t1200)
    (available diana t1230)
    ; t1300 omitted -> busy
    (available diana t1330)
    (available diana t1400)
    (available diana t1430)
    (available diana t1500)
    (available diana t1530)
    (available diana t1600)
    (available diana t1630)

    ; --- Agent 2 knowledge (Ethan) mapped into unified timeslots ---
    ; Ethan is free in every slot (agent2 used `free`)
    (free ethan t0900) (free ethan t0930) (free ethan t1000) (free ethan t1030)
    (free ethan t1100) (free ethan t1130) (free ethan t1200) (free ethan t1230)
    (free ethan t1300) (free ethan t1330) (free ethan t1400) (free ethan t1430)
    (free ethan t1500) (free ethan t1530) (free ethan t1600) (free ethan t1630)

    ; Also add available for Ethan in the agent1/agent3 sense so agent1-style action can be used for Ethan too
    (available ethan t0900) (available ethan t0930) (available ethan t1000) (available ethan t1030)
    (available ethan t1100) (available ethan t1130) (available ethan t1200) (available ethan t1230)
    (available ethan t1300) (available ethan t1330) (available ethan t1400) (available ethan t1430)
    (available ethan t1500) (available ethan t1530) (available ethan t1600) (available ethan t1630)

    ; meeting requirements known to agent2: meeting1 requires Ethan
    ; We include requires facts for all participants to represent the orchestrator goal that all are required.
    (requires meeting1 ethan)
    (requires meeting1 diana)
    (requires meeting1 janet)

    ; meeting1 is initially unscheduled (agent2)
    (unscheduled meeting1)

    ; --- Agent 3 knowledge (Janet) mapped into unified timeslots ---
    ; Declare slots, person and meeting as agent3 expects
    (slot t0900) (slot t0930) (slot t1000) (slot t1030) (slot t1100) (slot t1130)
    (slot t1200) (slot t1230) (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    (person-p janet)
    (meeting-p meeting1)

    ; Janet's available slots (per agent3): s1000 s1030 s1100 s1130 s1200 s1300 s1330 s1500
    (available janet t1000)
    (available janet t1030)
    (available janet t1100)
    (available janet t1130)
    (available janet t1200)
    (available janet t1300)
    (available janet t1330)
    (available janet t1500)

    ; Janet's preferences (prefers not after 12:00) — treated as hard preference by agent3
    (preferred janet t0900)
    (preferred janet t0930)
    (preferred janet t1000)
    (preferred janet t1030)
    (preferred janet t1100)
    (preferred janet t1130)
    (preferred janet t1200)

    ; For completeness, also declare person-p entries for other persons so predicates exist if needed
    (person-p diana)
    (person-p ethan)
  )

  ; Goal: produce a single 30-minute slot on Monday between 09:00 and 17:00 that satisfies:
  ; - Agent1 representation: meeting-scheduled at slot and meeting-scheduled-for each participant
  ; - Agent2 representation: scheduled2 meeting1 slot (and unscheduled removed)
  ; - Agent3 representation: scheduled3 meeting1 slot janet (Janet's hard preference and availability)
  ; We choose the slot t1200 because it is within 09:00-17:00 and is in the intersection of:
  ;  - Diana's availability (t1200 is available)
  ;  - Ethan's free slots (all slots)
  ;  - Janet's availability and preference (t1200 is available & preferred)
  (:goal (and
    (meeting-scheduled t1200)
    (meeting-scheduled-for t1200 diana)
    (meeting-scheduled-for t1200 ethan)
    (meeting-scheduled-for t1200 janet)
    (scheduled2 meeting1 t1200)
    (scheduled3 meeting1 t1200 janet)
  ))
)