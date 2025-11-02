(define (problem schedule_monday)
  (:domain meeting-scheduling)

  (:objects
    slot-09_00 slot-09_30 slot-10_00 slot-10_30 slot-11_00 slot-11_30
    slot-12_00 slot-12_30 slot-13_00 slot-13_30 slot-14_00 slot-14_30
    slot-15_00 slot-15_30 slot-16_00 slot-16_30 - slot
  )

  (:init
    ;; Work hours encoding (09:00 start -> earliest 30-min slot; 16:30 start ends at 17:00)
    (work-hours-start slot-09_00)
    (work-hours-end slot-16_30)
    (meeting-duration-30)

    ;; -------------------------
    ;; Availability encoded from participants' busy slots (hard constraints).
    ;; Busy slots are NOT listed as available. Each available-X fact indicates
    ;; that participant is free for a 30-minute meeting starting at that slot.
    ;; -------------------------

    ;; Raymond busy: 09:00, 11:30, 13:00, 15:00
    ;; Available = all other slots within work hours
    (available-raymond slot-09_30)
    (available-raymond slot-10_00)
    (available-raymond slot-10_30)
    (available-raymond slot-11_00)
    (available-raymond slot-12_00)
    (available-raymond slot-12_30)
    (available-raymond slot-13_30)
    (available-raymond slot-14_00)
    (available-raymond slot-14_30)
    (available-raymond slot-15_30)
    (available-raymond slot-16_00)
    (available-raymond slot-16_30)

    ;; Billy busy: 10:00, 12:00, 16:30
    ;; Preference: avoid meetings after 15:00 (encoded as preferred slots for <15:00)
    (available-billy slot-09_00)
    (available-billy slot-09_30)
    (available-billy slot-10_30)
    (available-billy slot-11_00)
    (available-billy slot-11_30)
    (available-billy slot-12_30)
    (available-billy slot-13_00)
    (available-billy slot-13_30)
    (available-billy slot-14_00)
    (available-billy slot-14_30)
    (available-billy slot-15_00)
    (available-billy slot-15_30)
    (available-billy slot-16_00)

    ;; Donald busy: 09:00, 10:00, 10:30, 12:00, 12:30, 14:00, 16:00, 16:30
    (available-donald slot-09_30)
    (available-donald slot-11_00)
    (available-donald slot-11_30)
    (available-donald slot-13_00)
    (available-donald slot-13_30)
    (available-donald slot-14_30)
    (available-donald slot-15_00)
    (available-donald slot-15_30)

    ;; -------------------------
    ;; Preferred slots: all start times strictly before 15:00 (i.e., up to 14:30)
    ;; This models Billy's soft preference: scheduling at preferred slots costs 0,
    ;; scheduling at non-preferred (15:00 or later) costs 1.
    ;; -------------------------
    (preferred slot-09_00)
    (preferred slot-09_30)
    (preferred slot-10_00)
    (preferred slot-10_30)
    (preferred slot-11_00)
    (preferred slot-11_30)
    (preferred slot-12_00)
    (preferred slot-12_30)
    (preferred slot-13_00)
    (preferred slot-13_30)
    (preferred slot-14_00)
    (preferred slot-14_30)
  )

  ;; Minimize total-cost so planner will choose a preferred slot (before 15:00) if possible.
  (:metric minimize (total-cost))

  ;; Goal: schedule exactly one meeting respecting all hard availability constraints.
  (:goal
    (meeting-scheduled)
  )
)