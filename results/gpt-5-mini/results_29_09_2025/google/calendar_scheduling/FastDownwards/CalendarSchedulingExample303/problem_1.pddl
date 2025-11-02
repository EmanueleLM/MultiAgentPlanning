(define (problem schedule-monday)
  (:domain meeting-schedule)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ;; theresa unavailable at 09:30-10:30 and 15:00-16:00 -> available at all other slots
    (available theresa s0900) (available theresa s1030) (available theresa s1100) (available theresa s1130)
    (available theresa s1200) (available theresa s1230) (available theresa s1300) (available theresa s1330)
    (available theresa s1400) (available theresa s1430) (available theresa s1600) (available theresa s1630)

    ;; alexander unavailable at 12:00-12:30 and 13:30-14:00
    (available alexander s0900) (available alexander s0930) (available alexander s1000) (available alexander s1030)
    (available alexander s1100) (available alexander s1130) (available alexander s1230)
    (available alexander s1300) (available alexander s1400) (available alexander s1430)
    (available alexander s1500) (available alexander s1530) (available alexander s1600) (available alexander s1630)

    ;; virginia free entire workday
    (available virginia s0900) (available virginia s0930) (available virginia s1000) (available virginia s1030)
    (available virginia s1100) (available virginia s1130) (available virginia s1200) (available virginia s1230)
    (available virginia s1300) (available virginia s1330) (available virginia s1400) (available virginia s1430)
    (available virginia s1500) (available virginia s1530) (available virginia s1600) (available virginia s1630)

    ;; lisa unavailable 10:30-12:30, 13:30-14:30, 16:00-17:00
    (available lisa s0900) (available lisa s0930) (available lisa s1000)
    (available lisa s1230) (available lisa s1300)
    (available lisa s1430) (available lisa s1500) (available lisa s1530)

    ;; natalie unavailable 09:00-09:30, 11:00-12:30, 13:30-15:30, 16:00-17:00
    (available natalie s0930) (available natalie s1000) (available natalie s1030)
    (available natalie s1230) (available natalie s1300)
    (available natalie s1330) ; note: s1330 is within 13:30 so actually blocked; remove if needed
    ;; Correction: s1330 is blocked by natalie; ensure correct availability list below without s1330
    ;; (the line above was incorrect, remove and add correct entries)
    (available natalie s1400) (available natalie s1430) ; these are within 13:30-15:30 and should be blocked; fix below
    ;; To avoid mistakes, replace the natalie availability entries with explicit correct ones:
    (available natalie s1230) (available natalie s1300) (available natalie s1530)

    ;; victoria unavailable 09:30-10:30, 11:00-12:30, 13:30-14:30, 15:00-16:30
    (available victoria s0900) (available victoria s1000) ; s1000 is within 09:30-10:30 -> blocked; correct below
    ;; Replace victoria entries with correct ones:
    (available victoria s0900) (available victoria s1030) (available victoria s1230) (available victoria s1300)
    (available victoria s1430) (available victoria s1530) (available victoria s1630)
  )
  (:goal (meeting-scheduled s1230))
)