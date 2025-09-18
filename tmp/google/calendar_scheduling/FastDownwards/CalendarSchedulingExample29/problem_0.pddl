(define (problem schedule-monday-60min-combined)
  (:domain combined-meeting-scheduling)

  (:objects
    madison diana shirley - person

    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    ;; consecutive 30-min relations (09:00 -> 09:30 -> ... -> 16:30)
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ;; Combined availability information (union of inputs; if any agent reports busy at a slot,
    ;; that slot is considered unavailable globally).
    ;;
    ;; Madison: busy at 09:30 (t0930) and 11:30 (t1130) per Agent1 -> NOT available on those
    ;; Therefore Madison available at all other slots in window:
    (available madison t0900) (free madison t0900)
    (available madison t1000) (free madison t1000)
    (available madison t1030) (free madison t1030)
    (available madison t1100) (free madison t1100)
    (available madison t1200) (free madison t1200)
    (available madison t1230) (free madison t1230)
    (available madison t1300) (free madison t1300)
    (available madison t1330) (free madison t1330)
    (available madison t1400) (free madison t1400)
    (available madison t1430) (free madison t1430)
    (available madison t1500) (free madison t1500)
    (available madison t1530) (free madison t1530)
    (available madison t1600) (free madison t1600)
    (available madison t1630) (free madison t1630)

    ;; Diana: busy at 11:00 (t1100) and 13:00 (t1300) per Agent2 -> NOT available on those
    ;; Diana available at all other slots:
    (available diana t0900) (free diana t0900)
    (available diana t0930) (free diana t0930)
    (available diana t1000) (free diana t1000)
    (available diana t1030) (free diana t1030)
    (available diana t1130) (free diana t1130)
    (available diana t1200) (free diana t1200)
    (available diana t1230) (free diana t1230)
    ;; (not available at t1300)
    (available diana t1330) (free diana t1330)
    (available diana t1400) (free diana t1400)
    (available diana t1430) (free diana t1430)
    (available diana t1500) (free diana t1500)
    (available diana t1530) (free diana t1530)
    (available diana t1600) (free diana t1600)
    (available diana t1630) (free diana t1630)

    ;; Shirley: Agent3 reports many busy periods; Shirley is available only at:
    ;; s7 -> t1200, s8 -> t1230, s9 -> t1300, s13 -> t1500
    (available shirley t1200) (free shirley t1200)
    (available shirley t1230) (free shirley t1230)
    (available shirley t1300) (free shirley t1300)
    (available shirley t1500) (free shirley t1500)

    ;; No meeting scheduled initially; no (meeting-scheduled) or (attends ...) present
  )

  ;; Goal: schedule a 60-minute meeting (two consecutive 30-min slots) where
  ;; Madison, Diana and Shirley attend. To satisfy the attends predicates we
  ;; keep Agent1's attends effects available, so planner can choose the appropriate
  ;; agent1 action to produce attends for all three.
  (:goal (and
    (meeting-scheduled)
    (attends madison)
    (attends diana)
    (attends shirley)
  ))
)