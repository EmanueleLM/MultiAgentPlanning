(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    slot-0900 slot-0930 slot-1000 slot-1030
    slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot

    Billy - person
  )

  (:init
    ;; Slot declarations
    (slot slot-0900) (slot slot-0930) (slot slot-1000) (slot slot-1030)
    (slot slot-1100) (slot slot-1130) (slot slot-1200) (slot slot-1230)
    (slot slot-1300) (slot slot-1330) (slot slot-1400) (slot slot-1430)
    (slot slot-1500) (slot slot-1530) (slot slot-1600) (slot slot-1630)

    ;; Contiguous successor relations (30-minute granularity)
    (next slot-0900 slot-0930)
    (next slot-0930 slot-1000)
    (next slot-1000 slot-1030)
    (next slot-1030 slot-1100)
    (next slot-1100 slot-1130)
    (next slot-1130 slot-1200)
    (next slot-1200 slot-1230)
    (next slot-1230 slot-1300)
    (next slot-1300 slot-1330)
    (next slot-1330 slot-1400)
    (next slot-1400 slot-1430)
    (next slot-1430 slot-1500)
    (next slot-1500 slot-1530)
    (next slot-1530 slot-1600)
    (next slot-1600 slot-1630)

    ;; Participant availabilities (normalized): Billy is available for any 30-min start between 09:00 and 16:30,
    ;; and busy intervals (if any) would have been encoded here by omitting free facts. No busy intervals provided,
    ;; so mark all start slots as free for Billy.
    (free Billy slot-0900) (free Billy slot-0930) (free Billy slot-1000) (free Billy slot-1030)
    (free Billy slot-1100) (free Billy slot-1130) (free Billy slot-1200) (free Billy slot-1230)
    (free Billy slot-1300) (free Billy slot-1330) (free Billy slot-1400) (free Billy slot-1430)
    (free Billy slot-1500) (free Billy slot-1530) (free Billy slot-1600) (free Billy slot-1630)

    ;; Billy's stated preference treated as a hard constraint: avoid meetings starting at or after 15:00.
    ;; Mark as allowed only the slots strictly before 15:00 (last preferred start is 14:30).
    (before-1500 slot-0900) (before-1500 slot-0930) (before-1500 slot-1000) (before-1500 slot-1030)
    (before-1500 slot-1100) (before-1500 slot-1130) (before-1500 slot-1200) (before-1500 slot-1230)
    (before-1500 slot-1300) (before-1500 slot-1330) (before-1500 slot-1400) (before-1500 slot-1430)
  )

  ;; Goal: produce a valid schedule for the single 30-minute meeting during the defined window.
  ;; Meeting-scheduled must hold (the scheduled-at fact will record the chosen start time).
  (:goal (meeting-scheduled))
)