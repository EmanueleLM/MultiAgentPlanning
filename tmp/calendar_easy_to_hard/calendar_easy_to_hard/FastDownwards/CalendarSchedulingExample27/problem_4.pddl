(define (problem schedule-meeting-monday)
  (:domain multi-agent-meeting)

  (:objects
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot

    jesse kathryn megan - attendee
    orchestrator-agent - orchestrator
  )

  (:init
    (slot-free slot-0900) (slot-free slot-0930) (slot-free slot-1000) (slot-free slot-1030)
    (slot-free slot-1100) (slot-free slot-1130) (slot-free slot-1200) (slot-free slot-1230)
    (slot-free slot-1300) (slot-free slot-1330) (slot-free slot-1400) (slot-free slot-1430)
    (slot-free slot-1500) (slot-free slot-1530) (slot-free slot-1600) (slot-free slot-1630)

    ;; jesse is busy 10:00-10:30 (slot-1000) and 15:30-16:00 (slot-1530)
    (free jesse slot-0900) (free jesse slot-0930) (free jesse slot-1030) (free jesse slot-1100)
    (free jesse slot-1130) (free jesse slot-1200) (free jesse slot-1230) (free jesse slot-1300)
    (free jesse slot-1330) (free jesse slot-1400) (free jesse slot-1430) (free jesse slot-1500)
    (free jesse slot-1600) (free jesse slot-1630)

    ;; kathryn is free all day
    (free kathryn slot-0900) (free kathryn slot-0930) (free kathryn slot-1000) (free kathryn slot-1030)
    (free kathryn slot-1100) (free kathryn slot-1130) (free kathryn slot-1200) (free kathryn slot-1230)
    (free kathryn slot-1300) (free kathryn slot-1330) (free kathryn slot-1400) (free kathryn slot-1430)
    (free kathryn slot-1500) (free kathryn slot-1530) (free kathryn slot-1600) (free kathryn slot-1630)

    ;; megan busy: 10:30-11:00 (slot-1030), 11:30-12:30 (slot-1130, slot-1200),
    ;; 13:30-14:30 (slot-1330, slot-1400), 15:00-16:30 (slot-1500, slot-1530, slot-1600)
    (free megan slot-0900) (free megan slot-0930) (free megan slot-1000) (free megan slot-1100)
    (free megan slot-1230) (free megan slot-1300) (free megan slot-1430) (free megan slot-1630)
  )

  (:goal (and (scheduled) (scheduled-at slot-0900)))
)