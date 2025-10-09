(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Timeslots are 30-minute start times from 09:00 up to and including 16:30 (meeting length = 30 minutes; last start at 16:30 ends at 17:00)
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - timeslot
  )

  ;; Initial state:
  ;; - No meeting scheduled yet.
  ;; - Every participant is free at every allowed start timeslot (no participant-specific unavailability was provided; we do not invent busy times).
  (:init
    ;; Adam free at all slots
    (free adam s09_00) (free adam s09_30) (free adam s10_00) (free adam s10_30)
    (free adam s11_00) (free adam s11_30) (free adam s12_00) (free adam s12_30)
    (free adam s13_00) (free adam s13_30) (free adam s14_00) (free adam s14_30)
    (free adam s15_00) (free adam s15_30) (free adam s16_00) (free adam s16_30)

    ;; Frances free at all slots
    (free frances s09_00) (free frances s09_30) (free frances s10_00) (free frances s10_30)
    (free frances s11_00) (free frances s11_30) (free frances s12_00) (free frances s12_30)
    (free frances s13_00) (free frances s13_30) (free frances s14_00) (free frances s14_30)
    (free frances s15_00) (free frances s15_30) (free frances s16_00) (free frances s16_30)

    ;; Natalie free at all slots
    (free natalie s09_00) (free natalie s09_30) (free natalie s10_00) (free natalie s10_30)
    (free natalie s11_00) (free natalie s11_30) (free natalie s12_00) (free natalie s12_30)
    (free natalie s13_00) (free natalie s13_30) (free natalie s14_00) (free natalie s14_30)
    (free natalie s15_00) (free natalie s15_30) (free natalie s16_00) (free natalie s16_30)

    ;; Patrick free at all slots
    (free patrick s09_00) (free patrick s09_30) (free patrick s10_00) (free patrick s10_30)
    (free patrick s11_00) (free patrick s11_30) (free patrick s12_00) (free patrick s12_30)
    (free patrick s13_00) (free patrick s13_30) (free patrick s14_00) (free patrick s14_30)
    (free patrick s15_00) (free patrick s15_30) (free patrick s16_00) (free patrick s16_30)

    ;; Willie free at all slots
    (free willie s09_00) (free willie s09_30) (free willie s10_00) (free willie s10_30)
    (free willie s11_00) (free willie s11_30) (free willie s12_00) (free willie s12_30)
    (free willie s13_00) (free willie s13_30) (free willie s14_00) (free willie s14_30)
    (free willie s15_00) (free willie s15_30) (free willie s16_00) (free willie s16_30)

    ;; Diana free at all slots
    (free diana s09_00) (free diana s09_30) (free diana s10_00) (free diana s10_30)
    (free diana s11_00) (free diana s11_30) (free diana s12_00) (free diana s12_30)
    (free diana s13_00) (free diana s13_30) (free diana s14_00) (free diana s14_30)
    (free diana s15_00) (free diana s15_30) (free diana s16_00) (free diana s16_30)
  )

  ;; Goal:
  ;; - Prioritise the earliest possible start time that satisfies all constraints.
  ;;   With no participant-specific unavailability provided, the earliest allowed start time is 09:00.
  ;;   Therefore require a meeting scheduled at s09_00.
  (:goal (and
    (scheduled s09_00)
    (meeting-scheduled)
  ))
)