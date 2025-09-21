(define (problem schedule-meeting-monday)
  (:domain multi-agent-meeting)

  (:objects
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot

    agent1 kathryn megan - participant
  )

  (:init
    ;; all slots initially marked free (no meeting scheduled yet)
    (slot-free slot-0900) (slot-free slot-0930) (slot-free slot-1000) (slot-free slot-1030)
    (slot-free slot-1100) (slot-free slot-1130) (slot-free slot-1200) (slot-free slot-1230)
    (slot-free slot-1300) (slot-free slot-1330) (slot-free slot-1400) (slot-free slot-1430)
    (slot-free slot-1500) (slot-free slot-1530) (slot-free slot-1600) (slot-free slot-1630)

    ;; Participant availability
    ;; Agent1 (jesse) busy at slot-1000 and slot-1530, free otherwise
    (free agent1 slot-0900) (free agent1 slot-0930) (free agent1 slot-1030) (free agent1 slot-1100)
    (free agent1 slot-1130) (free agent1 slot-1200) (free agent1 slot-1230) (free agent1 slot-1300)
    (free agent1 slot-1330) (free agent1 slot-1400) (free agent1 slot-1430) (free agent1 slot-1500)
    (free agent1 slot-1600) (free agent1 slot-1630)

    ;; Kathryn is free all day
    (free kathryn slot-0900) (free kathryn slot-0930) (free kathryn slot-1000) (free kathryn slot-1030)
    (free kathryn slot-1100) (free kathryn slot-1130) (free kathryn slot-1200) (free kathryn slot-1230)
    (free kathryn slot-1300) (free kathryn slot-1330) (free kathryn slot-1400) (free kathryn slot-1430)
    (free kathryn slot-1500) (free kathryn slot-1530) (free kathryn slot-1600) (free kathryn slot-1630)

    ;; Megan's free slots (others implicitly busy)
    (free megan slot-0900)
    (free megan slot-0930)
    (free megan slot-1000)
    (free megan slot-1100)
    (free megan slot-1230)
    (free megan slot-1300)
    (free megan slot-1430)
    (free megan slot-1630)

    ;; Temporal ordering relations (before)
    (before slot-0900 slot-0930) (before slot-0900 slot-1000) (before slot-0900 slot-1030)
    (before slot-0900 slot-1100) (before slot-0900 slot-1130) (before slot-0900 slot-1200)
    (before slot-0900 slot-1230) (before slot-0900 slot-1300) (before slot-0900 slot-1330)
    (before slot-0900 slot-1400) (before slot-0900 slot-1430) (before slot-0900 slot-1500)
    (before slot-0900 slot-1530) (before slot-0900 slot-1600) (before slot-0900 slot-1630)

    (before slot-0930 slot-1000) (before slot-0930 slot-1030) (before slot-0930 slot-1100)
    (before slot-0930 slot-1130) (before slot-0930 slot-1200) (before slot-0930 slot-1230)
    (before slot-0930 slot-1300) (before slot-0930 slot-1330) (before slot-0930 slot-1400)
    (before slot-0930 slot-1430) (before slot-0930 slot-1500) (before slot-0930 slot-1530)
    (before slot-0930 slot-1600) (before slot-0930 slot-1630)

    (before slot-1000 slot-1030) (before slot-1000 slot-1100) (before slot-1000 slot-1130)
    (before slot-1000 slot-1200) (before slot-1000 slot-1230) (before slot-1000 slot-1300)
    (before slot-1000 slot-1330) (before slot-1000 slot-1400) (before slot-1000 slot-1430)
    (before slot-1000 slot-1500) (before slot-1000 slot-1530) (before slot-1000 slot-1600)
    (before slot-1000 slot-1630)

    (before slot-1030 slot-1100) (before slot-1030 slot-1130) (before slot-1030 slot-1200)
    (before slot-1030 slot-1230) (before slot-1030 slot-1300) (before slot-1030 slot-1330)
    (before slot-1030 slot-1400) (before slot-1030 slot-1430) (before slot-1030 slot-1500)
    (before slot-1030 slot-1530) (before slot-1030 slot-1600) (before slot-1030 slot-1630)

    (before slot-1100 slot-1130) (before slot-1100 slot-1200) (before slot-1100 slot-1230)
    (before slot-1100 slot-1300) (before slot-1100 slot-1330) (before slot-1100 slot-1400)
    (before slot-1100 slot-1430) (before slot-1100 slot-1500) (before slot-1100 slot-1530)
    (before slot-1100 slot-1600) (before slot-1100 slot-1630)

    (before slot-1130 slot-1200) (before slot-1130 slot-1230) (before slot-1130 slot-1300)
    (before slot-1130 slot-1330) (before slot-1130 slot-1400) (before slot-1130 slot-1430)
    (before slot-1130 slot-1500) (before slot-1130 slot-1530) (before slot-1130 slot-1600)
    (before slot-1130 slot-1630)

    (before slot-1200 slot-1230) (before slot-1200 slot-1300) (before slot-1200 slot-1330)
    (before slot-1200 slot-1400) (before slot-1200 slot-1430) (before slot-1200 slot-1500)
    (before slot-1200 slot-1530) (before slot-1200 slot-1600) (before slot-1200 slot-1630)

    (before slot-1230 slot-1300) (before slot-1230 slot-1330) (before slot-1230 slot-1400)
    (before slot-1230 slot-1430) (before slot-1230 slot-1500) (before slot-1230 slot-1530)
    (before slot-1230 slot-1600) (before slot-1230 slot-1630)

    (before slot-1300 slot-1330) (before slot-1300 slot-1400) (before slot-1300 slot-1430)
    (before slot-1300 slot-1500) (before slot-1300 slot-1530) (before slot-1300 slot-1600)
    (before slot-1300 slot-1630)

    (before slot-1330 slot-1400) (before slot-1330 slot-1430) (before slot-1330 slot-1500)
    (before slot-1330 slot-1530) (before slot-1330 slot-1600) (before slot-1330 slot-1630)

    (before slot-1400 slot-1430) (before slot-1400 slot-1500) (before slot-1400 slot-1530)
    (before slot-1400 slot-1600) (before slot-1400 slot-1630)

    (before slot-1430 slot-1500) (before slot-1430 slot-1530) (before slot-1430 slot-1600)
    (before slot-1430 slot-1630)

    (before slot-1500 slot-1530) (before slot-1500 slot-1600) (before slot-1500 slot-1630)

    (before slot-1530 slot-1600) (before slot-1530 slot-1630)

    (before slot-1600 slot-1630)
  )

  (:goal (and (scheduled) (scheduled-at slot-0900)))
)