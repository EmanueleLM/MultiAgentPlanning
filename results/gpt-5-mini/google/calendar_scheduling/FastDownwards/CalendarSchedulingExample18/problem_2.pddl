(define (problem CalendarSchedulingExample18)
  (:domain calendar_scheduling)
  (:objects
    ;; only slots are objects here; persons are declared as domain constants
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; Brian: free all slots (Brian has no meetings)
    (free brian s09_00) (free brian s09_30) (free brian s10_00) (free brian s10_30)
    (free brian s11_00) (free brian s11_30) (free brian s12_00) (free brian s12_30)
    (free brian s13_00) (free brian s13_30) (free brian s14_00) (free brian s14_30)
    (free brian s15_00) (free brian s15_30) (free brian s16_00) (free brian s16_30)

    ;; Billy: busy at 10:00, 11:30, 14:00, 16:30 -> free otherwise
    (free billy s09_00) (free billy s09_30) (free billy s10_30)
    (free billy s11_00) (free billy s12_00) (free billy s12_30)
    (free billy s13_00) (free billy s13_30) (free billy s14_30)
    (free billy s15_00) (free billy s15_30) (free billy s16_00)

    ;; Patricia: busy 09:00-12:30, 13:30-14:00, 14:30-16:00, 16:30-17:00 -> free slots listed
    (free patricia s12_30) (free patricia s13_00) (free patricia s14_00) (free patricia s16_00)

    ;; Billy's preference: avoid meetings after 15:30 if possible.
    ;; Mark preferred (acceptable) slots for Billy that start on or before 15:30 and are free for him.
    (preferred_by_billy s09_00) (preferred_by_billy s09_30) (preferred_by_billy s10_30)
    (preferred_by_billy s11_00) (preferred_by_billy s12_00) (preferred_by_billy s12_30)
    (preferred_by_billy s13_00) (preferred_by_billy s13_30) (preferred_by_billy s14_30)
    (preferred_by_billy s15_00) (preferred_by_billy s15_30)
  )

  ;; goal: schedule one meeting that satisfies availability constraints
  (:goal (meeting_scheduled))
)