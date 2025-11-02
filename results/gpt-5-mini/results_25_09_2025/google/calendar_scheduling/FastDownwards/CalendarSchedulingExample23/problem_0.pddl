(define (problem schedule-meeting)
  (:domain multiagent-scheduling)

  ;; candidate start times (30-minute granularity from 09:00 to 16:00 inclusive)
  (:objects
    s9_00 s9_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 - start
  )

  ;; Initial state: per-agent available-start facts computed from their private busy intervals.
  ;; Meeting duration = 60 minutes (two consecutive 30-min slots). Work hours 09:00-17:00 (start times limited accordingly).
  (:init
    ;; Billy's free start times (given busy: 11:30-12:00, 13:00-15:00, 16:00-16:30)
    (available-billy s9_00)
    (available-billy s9_30)
    (available-billy s10_00)
    (available-billy s10_30)
    (available-billy s12_00)
    (available-billy s12_30)
    (available-billy s15_00)

    ;; Maria's free start times (given busy: 9:00-9:30, 10:00-10:30, 13:00-13:30, 14:00-14:30)
    (available-maria s10_30)
    (available-maria s11_00)
    (available-maria s11_30)
    (available-maria s12_00)
    (available-maria s12_30)
    (available-maria s14_30)
    (available-maria s15_00)
    (available-maria s15_30)
    (available-maria s16_00)

    ;; William's free start times (given busy: 9:30-10:00, 12:00-12:30, 13:30-15:00, 15:30-17:00)
    (available-william s10_00)
    (available-william s10_30)
    (available-william s11_00)
    (available-william s11_30)
    (available-william s12_30)
  )

  ;; Global goal: schedule a one-hour meeting (the planner may pick a start that fits everyone's availability).
  ;; From the provided availabilities the only common feasible start is 10:30, so the goal is to have the meeting scheduled at s10_30.
  (:goal (meeting-scheduled s10_30))
)