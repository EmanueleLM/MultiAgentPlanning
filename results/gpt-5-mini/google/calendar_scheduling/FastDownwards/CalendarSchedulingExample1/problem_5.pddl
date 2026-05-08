(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    slot-0900 slot-0930 slot-1000 slot-1030
    slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot
  )
  (:init
    (= (total-cost) 0)
    (preferred_start slot-0900) (preferred_start slot-0930) (preferred_start slot-1000) (preferred_start slot-1030)
    (preferred_start slot-1100) (preferred_start slot-1130) (preferred_start slot-1200) (preferred_start slot-1230)
    (preferred_start slot-1300) (preferred_start slot-1330) (preferred_start slot-1400) (preferred_start slot-1430)
    (free raymond slot-0930) (free raymond slot-1000) (free raymond slot-1030)
    (free raymond slot-1100) (free raymond slot-1200) (free raymond slot-1230)
    (free raymond slot-1330) (free raymond slot-1400) (free raymond slot-1430)
    (free raymond slot-1530) (free raymond slot-1600) (free raymond slot-1630)
    (free billy slot-0900) (free billy slot-0930) (free billy slot-1030)
    (free billy slot-1100) (free billy slot-1130)
    (free billy slot-1300) (free billy slot-1330) (free billy slot-1400) (free billy slot-1430)
    (free billy slot-1500) (free billy slot-1530) (free billy slot-1600)
    (free donald slot-0930) (free donald slot-1100) (free donald slot-1130)
    (free donald slot-1300) (free donald slot-1330) (free donald slot-1430)
    (free donald slot-1500) (free donald slot-1530)
  )
  (:goal (meeting_scheduled))
  (:metric minimize (total-cost))
)