(define (problem schedule-meeting-monday)
  (:domain multi-agent-scheduling)

  ;; Time slots are 30-minute aligned from 09:00 to 16:30 (each represents a 30-min interval).
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630
  )

  (:init
    ;; declare slot objects
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Public known facts
    (meeting-duration-30)
    (meeting-day-monday)

    ;; Gerald's private availability:
    ;; Gerald is busy at: 09:00-09:30 (s0900), 13:00-14:00 (s1300,s1330), 15:00-15:30 (s1500), 16:00-17:00 (s1600,s1630).
    ;; Therefore free for Gerald (all other slots within work hours):
    (free-gerald s0930) (free-gerald s1000) (free-gerald s1030)
    (free-gerald s1100) (free-gerald s1130) (free-gerald s1200)
    (free-gerald s1230) (free-gerald s1400) (free-gerald s1430)
    (free-gerald s1530)
    ;; Gerald's preference: avoid meetings before 13:00 (modeled declaratively, not enforced).
    ;; After 13:00 Gerald prefers s1400, s1430, s1530 (only those are both after 13:00 and free for Gerald).
    (preferred-gerald s1400) (preferred-gerald s1430) (preferred-gerald s1530)

    ;; Roy's private availability: free 09:00-17:00 (all slots)
    (free-roy s0900) (free-roy s0930) (free-roy s1000) (free-roy s1030)
    (free-roy s1100) (free-roy s1130) (free-roy s1200) (free-roy s1230)
    (free-roy s1300) (free-roy s1330) (free-roy s1400) (free-roy s1430)
    (free-roy s1500) (free-roy s1530) (free-roy s1600) (free-roy s1630)

    ;; Barbara's private availability:
    ;; Barbara is busy at: 09:30-10:00 (s0930), 11:30-14:00 (s1130,s1200,s1230,s1300,s1330),
    ;; 14:30-15:00 (s1430), 15:30-17:00 (s1530,s1600,s1630).
    ;; Therefore free for Barbara:
    (free-barbara s0900) (free-barbara s1000) (free-barbara s1030)
    (free-barbara s1100) (free-barbara s1400) (free-barbara s1500)
  )

  ;; Goal: produce a scheduled meeting (30 minutes) on Monday that all three accepted.
  (:goal (meeting-scheduled))
)