(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    slot-0900 slot-0930 slot-1000 slot-1030
    slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot

    raymond billy donald auditor orchestrator - person
  )

  (:init
    ;; slots
    (slot slot-0900) (slot slot-0930) (slot slot-1000) (slot slot-1030)
    (slot slot-1100) (slot slot-1130) (slot slot-1200) (slot slot-1230)
    (slot slot-1300) (slot slot-1330) (slot slot-1400) (slot slot-1430)
    (slot slot-1500) (slot slot-1530) (slot slot-1600) (slot slot-1630)

    ;; preferred starts (Billy prefers no meetings after 15:00).
    (preferred_start slot-0900) (preferred_start slot-0930) (preferred_start slot-1000) (preferred_start slot-1030)
    (preferred_start slot-1100) (preferred_start slot-1130) (preferred_start slot-1200) (preferred_start slot-1230)
    (preferred_start slot-1300) (preferred_start slot-1330) (preferred_start slot-1400) (preferred_start slot-1430)

    ;; Normalized free facts derived from participants' busy intervals (30-min meeting starts).
    ;; Raymond busy: 09:00-09:30, 11:30-12:00, 13:00-13:30, 15:00-15:30
    (free raymond slot-0930) (free raymond slot-1000) (free raymond slot-1030)
    (free raymond slot-1100) (free raymond slot-1200) (free raymond slot-1230)
    (free raymond slot-1330) (free raymond slot-1400) (free raymond slot-1430)
    (free raymond slot-1530) (free raymond slot-1600) (free raymond slot-1630)

    ;; Billy busy: 10:00-10:30, 12:00-13:00 (blocks 12:00 and 12:30), 16:30-17:00
    ;; Billy prefers no meetings after 15:00 (preferred_start encodes starts before 15:00).
    (free billy slot-0900) (free billy slot-0930) (free billy slot-1030)
    (free billy slot-1100) (free billy slot-1130)
    (free billy slot-1300) (free billy slot-1330) (free billy slot-1400) (free billy slot-1430)
    (free billy slot-1500) (free billy slot-1530) (free billy slot-1600)

    ;; Donald busy: 09:00-09:30, 10:00-11:00 (blocks 10:00 and 10:30),
    ;; 12:00-13:00 (blocks 12:00 and 12:30), 14:00-14:30, 16:00-17:00 (blocks 16:00 and 16:30)
    (free donald slot-0930) (free donald slot-1100) (free donald slot-1130)
    (free donald slot-1300) (free donald slot-1330) (free donald slot-1430)
    (free donald slot-1500) (free donald slot-1530)
  )

  (:goal (meeting_scheduled))
)