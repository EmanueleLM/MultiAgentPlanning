(define (problem schedule_monday_30min)
  (:domain meeting_scheduling)

  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Gerald busy: 09:00-09:30, 13:00-14:00, 15:00-15:30, 16:00-17:00
    ;; => available starts (half-hour boundaries) are all slots except
    ;; s0900, s1300, s1330, s1500, s1600, s1630
    (available_gerald s0930) (available_gerald s1000) (available_gerald s1030)
    (available_gerald s1100) (available_gerald s1130) (available_gerald s1200)
    (available_gerald s1230) (available_gerald s1400) (available_gerald s1430)
    (available_gerald s1530)

    ;; Roy: free entire work day 09:00-17:00 => available at every half-hour start
    (available_roy s0900) (available_roy s0930) (available_roy s1000) (available_roy s1030)
    (available_roy s1100) (available_roy s1130) (available_roy s1200) (available_roy s1230)
    (available_roy s1300) (available_roy s1330) (available_roy s1400) (available_roy s1430)
    (available_roy s1500) (available_roy s1530) (available_roy s1600) (available_roy s1630)

    ;; Barbara busy: 09:30-10:00, 11:30-14:00, 14:30-15:00, 15:30-17:00
    ;; => available starts: s0900, s1000, s1030, s1100, s1400, s1500
    (available_barbara s0900) (available_barbara s1000) (available_barbara s1030)
    (available_barbara s1100) (available_barbara s1400) (available_barbara s1500)

    ;; Preferred slots are those starting at or after 13:00 (Gerald's soft preference)
    (preferred_slot s1300) (preferred_slot s1330) (preferred_slot s1400)
    (preferred_slot s1430) (preferred_slot s1500) (preferred_slot s1530)
    (preferred_slot s1600) (preferred_slot s1630)

    ;; Auditor/orchestrator preprocessing determined there exists at least one
    ;; preferred slot that is available to all participants (s1400).
    ;; This flag enforces that the planner must use a preferred slot when one exists.
    (preferred_available)
  )

  ;; Goal: produce a scheduled meeting (the schedule action will record the chosen slot)
  (:goal (meeting_scheduled))
)