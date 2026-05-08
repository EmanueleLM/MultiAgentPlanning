(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    slot-0900 slot-0930 slot-1000 slot-1030
    slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot

    raymond billy donald - person
  )

  (:init
    ;; slots
    (slot_exists slot-0900) (slot_exists slot-0930) (slot_exists slot-1000) (slot_exists slot-1030)
    (slot_exists slot-1100) (slot_exists slot-1130) (slot_exists slot-1200) (slot_exists slot-1230)
    (slot_exists slot-1300) (slot_exists slot-1330) (slot_exists slot-1400) (slot_exists slot-1430)
    (slot_exists slot-1500) (slot_exists slot-1530) (slot_exists slot-1600) (slot_exists slot-1630)

    ;; Mark slots strictly before 15:00 (Billy's preferred cutoff). Last preferred start is 14:30.
    (before_1500 slot-0900) (before_1500 slot-0930) (before_1500 slot-1000) (before_1500 slot-1030)
    (before_1500 slot-1100) (before_1500 slot-1130) (before_1500 slot-1200) (before_1500 slot-1230)
    (before_1500 slot-1300) (before_1500 slot-1330) (before_1500 slot-1400) (before_1500 slot-1430)

    ;; Normalized free facts derived from each participant's busy blocks.
    ;; Raymond busy: 09:00-09:30, 11:30-12:00, 13:00-13:30, 15:00-15:30
    ;; Therefore Raymond is free at all other 30-min start slots:
    (free raymond slot-0930) (free raymond slot-1000) (free raymond slot-1030)
    (free raymond slot-1100) (free raymond slot-1200) (free raymond slot-1230)
    (free raymond slot-1330) (free raymond slot-1400) (free raymond slot-1430)
    (free raymond slot-1530) (free raymond slot-1600) (free raymond slot-1630)

    ;; Billy busy: 10:00-10:30, 12:00-13:00 (blocks 12:00 and 12:30), 16:30-17:00
    ;; Billy prefers no meetings after 15:00 (encoded as preferred slots above).
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

  ;; Goal: schedule the single 30-minute meeting (one of the actions will set meeting_scheduled).
  (:goal (meeting_scheduled))
)