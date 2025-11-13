(define (problem select-max-meeting)
  (:domain schedule-selection)
  (:objects
    earliest_105 latest_leave_for_105 max_meeting_full - schedule
  )
  (:init
    ;; All audited schedules that satisfy the hard constraints are declared feasible.
    (feasible earliest_105)
    (feasible latest_leave_for_105)
    (feasible max_meeting_full)

    ;; The audited schedule that maximizes continuous meeting duration is marked best.
    ;; According to the audited data, max_meeting_full yields a 375-minute contiguous meeting.
    (best max_meeting_full)

    ;; Choice is initially open: planner must pick exactly one feasible best schedule.
    (choice-open)
  )
  ;; Goal: the meeting with Ronald has been executed AND the selected schedule is the audited best.
  (:goal (and (met-ronald) (selected max_meeting_full)))
)