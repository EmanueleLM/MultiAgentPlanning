(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    adam jerry matthew - person
    monday - day
    slot0900 slot0930 slot1000 slot1030 slot1100 slot1130 slot1200 slot1230
    slot1300 slot1330 slot1400 slot1430 slot1500 slot1530 slot1600 slot1630 - slot
  )

  (:init
    ; the day
    (day monday)

    ; declare all time start slots (09:00-16:30) and mark them as work slots (09:00-17:00)
    (slot slot0900) (slot slot0930) (slot slot1000) (slot slot1030)
    (slot slot1100) (slot slot1130) (slot slot1200) (slot slot1230)
    (slot slot1300) (slot slot1330) (slot slot1400) (slot slot1430)
    (slot slot1500) (slot slot1530) (slot slot1600) (slot slot1630)

    (work-slot slot0900) (work-slot slot0930) (work-slot slot1000) (work-slot slot1030)
    (work-slot slot1100) (work-slot slot1130) (work-slot slot1200) (work-slot slot1230)
    (work-slot slot1300) (work-slot slot1330) (work-slot slot1400) (work-slot slot1430)
    (work-slot slot1500) (work-slot slot1530) (work-slot slot1600) (work-slot slot1630)

    ; -----------------------
    ; Agent 1 knowledge about Adam (from agent1):
    ; Adam is busy at these slots:
    (busy adam slot1000)
    (busy adam slot1230)
    (busy adam slot1330)
    (busy adam slot1400)
    ; Adam is known free at many others (we include at least the target slot1100)
    (free adam slot0900) (free adam slot0930) (free adam slot1030)
    (free adam slot1100) (free adam slot1130) (free adam slot1200)
    (free adam slot1300) (free adam slot1430) (free adam slot1500)
    (free adam slot1530) (free adam slot1600) (free adam slot1630)

    ; -----------------------
    ; Agent 2 knowledge about Jerry (from agent2):
    ; Jerry is busy at:
    (busy jerry slot0900)
    (busy jerry slot1200)
    (busy jerry slot1500)
    (busy jerry slot1530)
    ; From agent3 we will ensure Jerry is free at the target slot1100:
    (free jerry slot1100)

    ; -----------------------
    ; Agent 3 knowledge about Matthew (from agent3):
    ; Matthew is free only at these specific slots (computed from his busy intervals)
    (free matthew slot0900)
    (free matthew slot1100)
    (free matthew slot1230)
    (free matthew slot1400)

    ; Note: We intentionally included the above busy/free facts aggregated from the three agents.
    ; Busy facts take precedence where agents reported a conflict (to avoid contradictions).
    ; The combination yields a common feasible time at slot1100 where all three are free.

    ; No meeting is scheduled initially (meeting-scheduled absent => negative preconditions allow scheduling)
  )

  ; Goal: schedule a 30-minute meeting on Monday between 09:00 and 17:00 with Adam, Jerry and Matthew.
  ; We require that the meeting is scheduled and recorded at the selected slot, and that attending facts
  ; for Monday are present for all three attendees. Agent1's action produces attending facts that include the day,
  ; so the planner will use the corresponding action to satisfy the goal.
  (:goal (and
    (meeting-scheduled)
    (meeting-at slot1100)
    (attending adam monday slot1100)
    (attending jerry monday slot1100)
    (attending matthew monday slot1100)
  ))
)