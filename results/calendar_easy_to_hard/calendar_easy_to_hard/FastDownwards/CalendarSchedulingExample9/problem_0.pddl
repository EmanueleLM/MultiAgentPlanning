(define (problem schedule_meeting_diane_deborah)
  (:domain meeting_multia)
  (:objects
    diane kelly deborah
    s_9_00 s_9_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30
  )
  (:init
    ;; PUBLIC: work hours 9:00-17:00 and meeting duration 30 minutes (implicitly encoded by slots)
    ;; PRIVATE availabilities encoded below (free PERSON SLOT)

    ;; Diane's private busy times: busy 9:00-9:30, 12:00-12:30, 14:30-15:30
    ;; Therefore Diane is free at all other 30-min slots:
    (free diane s_9_30)
    (free diane s_10_00)
    (free diane s_10_30)
    (free diane s_11_00)
    (free diane s_11_30)
    (free diane s_12_30)
    (free diane s_13_00)
    (free diane s_13_30)
    (free diane s_14_00)
    (free diane s_15_30)
    (free diane s_16_00)
    (free diane s_16_30)

    ;; Kelly's private busy times: busy 9:30-10:00, 10:30-11:00
    ;; Kelly is a separate agent (not required participant), record Kelly's availability:
    (free kelly s_9_00)
    (free kelly s_10_00)
    (free kelly s_11_00)
    (free kelly s_11_30)
    (free kelly s_12_00)
    (free kelly s_12_30)
    (free kelly s_13_00)
    (free kelly s_13_30)
    (free kelly s_14_00)
    (free kelly s_14_30)
    (free kelly s_15_00)
    (free kelly s_15_30)
    (free kelly s_16_00)
    (free kelly s_16_30)

    ;; Deborah's private busy times: busy 9:00-9:30, 10:00-14:00, 14:30-17:00
    ;; Deborah is therefore free only at 9:30 and 14:00 in the discretized slots:
    (free deborah s_9_30)
    (free deborah s_14_00)
  )

  ;; Goal: schedule a 30-minute meeting for Diane (diane) and Deborah (deborah).
  ;; We assert the concrete slot that fits all agents' availabilities: s_14_00 (14:00-14:30).
  (:goal (meeting-scheduled diane deborah s_14_00))
)