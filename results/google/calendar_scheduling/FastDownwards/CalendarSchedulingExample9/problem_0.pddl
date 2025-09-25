(define (problem schedule-diane-deborah)
  (:domain multi-agent-meeting)
  (:objects
    dianekelly deborah - person
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30
    slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    ;; declare slots and persons
    (person dianekelly)
    (person deborah)

    (slot slot_9_00) (slot slot_9_30) (slot slot_10_00) (slot slot_10_30)
    (slot slot_11_00) (slot slot_11_30) (slot slot_12_00) (slot slot_12_30)
    (slot slot_13_00) (slot slot_13_30) (slot slot_14_00) (slot slot_14_30)
    (slot slot_15_00) (slot slot_15_30) (slot slot_16_00) (slot slot_16_30)

    ;; Work hours / available slot universe: Monday 9:00-17:00 expressed in 30-min slots
    ;; Private busy info integrated into the free facts below.

    ;; Diane Kelly's combined known busy intervals (from agents "diane" and "kelly"):
    ;; Busy: 9:00-9:30 (slot_9_00)
    ;; Busy: 9:30-10:00 (slot_9_30)
    ;; Busy: 10:30-11:00 (slot_10_30)
    ;; Busy: 12:00-12:30 (slot_12_00)
    ;; Busy: 14:30-15:30 (slot_14_30 and slot_15_00)
    ;; Therefore free slots for Diane Kelly (within working hours) are:
    (free dianekelly slot_10_00)
    (free dianekelly slot_11_00)
    (free dianekelly slot_11_30)
    (free dianekelly slot_12_30)
    (free dianekelly slot_13_00)
    (free dianekelly slot_13_30)
    (free dianekelly slot_14_00)
    (free dianekelly slot_15_30)
    (free dianekelly slot_16_00)
    (free dianekelly slot_16_30)

    ;; Deborah's private busy intervals:
    ;; Busy: 9:00-9:30 (slot_9_00)
    ;; Busy: 10:00-14:00 (slots slot_10_00 .. slot_13_30)
    ;; Busy: 14:30-17:00 (slots slot_14_30 .. slot_16_30)
    ;; Therefore Deborah is free at:
    (free deborah slot_9_30)
    (free deborah slot_14_00)
  )

  ;; Goal: schedule a 30-minute meeting for Diane Kelly and Deborah within work hours.
  ;; Given the integrated availability above, the only common free 30-min slot is 14:00-14:30 (slot_14_00).
  (:goal (and
    (scheduled)
    (meeting-at slot_14_00)
  ))
)