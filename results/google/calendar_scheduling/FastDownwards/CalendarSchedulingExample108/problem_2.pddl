(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    lisa dorothy anthony ryan - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (available lisa s1430) (available lisa s1600) (available lisa s1630)
    (available dorothy s0930) (available dorothy s1000) (available dorothy s1130) (available dorothy s1200) (available dorothy s1230) (available dorothy s1300) (available dorothy s1400) (available dorothy s1530) (available dorothy s1600) (available dorothy s1630)
    (available anthony s1000) (available anthony s1030) (available anthony s1230) (available anthony s1330) (available anthony s1400) (available anthony s1430) (available anthony s1630)
    (available ryan s1230) (available ryan s1630)
  )
  (:goal (scheduled s1630))
)