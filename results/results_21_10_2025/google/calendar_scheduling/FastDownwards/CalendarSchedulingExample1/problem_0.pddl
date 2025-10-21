(define (problem schedule_monday)
  (:domain meeting-scheduling)

  ;; slots are 30-minute discrete start times. We include the explicit times
  ;; that appear in participants' data (no invented additional availability).
  (:objects
    slot-09_00 slot-09_30 slot-10_00 slot-10_30 slot-11_00 slot-11_30
    slot-12_00 slot-12_30 slot-13_00 slot-13_30 slot-14_00 slot-14_30
    slot-15_00 slot-15_30 slot-16_00 slot-16_30 - slot

    time-09_00 time-17_00 - time
  )

  (:init
    ;; Work hours and meeting duration (encoded as hard constraints / facts)
    (work-hours-start time-09_00)
    (work-hours-end time-17_00)
    (meeting-duration-30)

    ;; -------------------------
    ;; Availability encoding
    ;; Hard constraints (busy slots removed) and preferences treated as hard:
    ;; -- Billy prefers to avoid meetings after 15:00 -> disallow slots starting >=15:00
    ;; -- Raymond & Donald: preferences before 15:00 treated as hard as requested
    ;; Therefore available-X facts only appear for slots consistent with both
    ;; each agent's busy slots and the stated (now hard) temporal preferences.
    ;; -------------------------

    ;; Raymond's available 30-minute slots (respecting his hard busy slots
    ;; and treating his preference before 15:00 as a hard constraint)
    (available-raymond slot-09_30)
    (available-raymond slot-10_00)
    (available-raymond slot-10_30)
    (available-raymond slot-11_00)
    (available-raymond slot-12_00)
    (available-raymond slot-12_30)
    (available-raymond slot-13_30)
    (available-raymond slot-14_00)
    (available-raymond slot-14_30)

    ;; Billy's available slots (busy slots removed; preference to avoid after 15:00
    ;; is treated as hard, so no slots >=15:00 are available)
    (available-billy slot-09_00)
    (available-billy slot-09_30)
    (available-billy slot-10_30)
    (available-billy slot-11_00)
    (available-billy slot-11_30)
    (available-billy slot-13_00)
    (available-billy slot-13_30)
    (available-billy slot-14_00)
    (available-billy slot-14_30)

    ;; Donald's available slots (busy slots removed; preference before 15:00
    ;; treated as hard so slots starting at or after 15:00 are not offered)
    (available-donald slot-09_30)
    (available-donald slot-11_00)
    (available-donald slot-11_30)
    (available-donald slot-13_00)
    (available-donald slot-13_30)
    (available-donald slot-14_30)

    ;; Note: No (meeting-scheduled) fact initially; planner must apply exactly one
    ;; schedule-meeting action to achieve the goal. Negative precondition on the
    ;; action prevents more than one scheduling.
  )

  ;; Goal: find a single 30-minute slot on Monday satisfying all hard constraints,
  ;; respecting participants' busy slots and the stated preferences (treated as hard).
  (:goal
    (meeting-scheduled)
  )
)