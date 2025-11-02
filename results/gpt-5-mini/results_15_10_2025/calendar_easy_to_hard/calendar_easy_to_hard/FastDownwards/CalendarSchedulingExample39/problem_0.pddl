(define (problem schedule-meeting-monday)
  (:domain meeting-schedule)
  (:objects
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot
  )

  (:init
    ;; Nicholas: free entire workday 09:00-17:00 (all start slots)
    (available nicholas slot-0900) (available nicholas slot-0930) (available nicholas slot-1000)
    (available nicholas slot-1030) (available nicholas slot-1100) (available nicholas slot-1130)
    (available nicholas slot-1200) (available nicholas slot-1230) (available nicholas slot-1300)
    (available nicholas slot-1330) (available nicholas slot-1400) (available nicholas slot-1430)
    (available nicholas slot-1500) (available nicholas slot-1530) (available nicholas slot-1600)
    (available nicholas slot-1630)

    ;; Emma: free entire workday 09:00-17:00
    (available emma slot-0900) (available emma slot-0930) (available emma slot-1000)
    (available emma slot-1030) (available emma slot-1100) (available emma slot-1130)
    (available emma slot-1200) (available emma slot-1230) (available emma slot-1300)
    (available emma slot-1330) (available emma slot-1400) (available emma slot-1430)
    (available emma slot-1500) (available emma slot-1530) (available emma slot-1600)
    (available emma slot-1630)

    ;; Catherine: busy 09:00-09:30, 11:30-12:00, 13:30-14:00, 15:30-16:00
    ;; => available at all other start slots
    (available catherine slot-0930) (available catherine slot-1000) (available catherine slot-1030)
    (available catherine slot-1100) (available catherine slot-1200) (available catherine slot-1230)
    (available catherine slot-1300) (available catherine slot-1400) (available catherine slot-1430)
    (available catherine slot-1500) (available catherine slot-1600) (available catherine slot-1630)

    ;; Steven: busy 09:00-09:30 and 10:00-16:30
    ;; => available only at 09:30 and 16:30 (start times that do not overlap busy)
    (available steven slot-0930)
    (available steven slot-1630)

    ;; Adam: busy 09:00-10:00, 10:30-13:00, 13:30-14:00, 14:30-16:30
    ;; => available at 10:00, 13:00, 14:00, 16:30
    (available adam slot-1000) (available adam slot-1300) (available adam slot-1400)
    (available adam slot-1630)

    ;; Lori: busy 09:00-11:30, 12:30-13:30, 16:00-16:30
    ;; => available at 11:30,12:00,13:30,14:00,14:30,15:00,15:30,16:30
    (available lori slot-1130) (available lori slot-1200) (available lori slot-1330)
    (available lori slot-1400) (available lori slot-1430) (available lori slot-1500)
    (available lori slot-1530) (available lori slot-1630)
  )

  ;; Per "always prefer earliest feasible", the earliest start slot that satisfies all hard constraints
  ;; is 16:30 (slot-1630). Set the goal to schedule that slot.
  (:goal (scheduled slot-1630))
)