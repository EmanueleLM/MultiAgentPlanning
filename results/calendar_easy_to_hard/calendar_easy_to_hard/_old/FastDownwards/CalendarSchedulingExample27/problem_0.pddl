(define (problem schedule-meeting-monday)
  (:domain multi-agent-meeting)

  ;; Canonical 30-minute slots from 09:00 to 17:00 on Monday (16 slots)
  (:objects
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot

    agent1 kathryn megan - participant
  )

  (:init
    ;; participants exist (kept distinct)
    (participant agent1) (participant kathryn) (participant megan)

    ;; slots exist
    (slot slot-0900) (slot slot-0930) (slot slot-1000) (slot slot-1030)
    (slot slot-1100) (slot slot-1130) (slot slot-1200) (slot slot-1230)
    (slot slot-1300) (slot slot-1330) (slot slot-1400) (slot slot-1430)
    (slot slot-1500) (slot slot-1530) (slot slot-1600) (slot slot-1630)

    ;; all slots initially marked free (no meeting scheduled yet)
    (slot-free slot-0900) (slot-free slot-0930) (slot-free slot-1000) (slot-free slot-1030)
    (slot-free slot-1100) (slot-free slot-1130) (slot-free slot-1200) (slot-free slot-1230)
    (slot-free slot-1300) (slot-free slot-1330) (slot-free slot-1400) (slot-free slot-1430)
    (slot-free slot-1500) (slot-free slot-1530) (slot-free slot-1600) (slot-free slot-1630)

    ;; --------------------------
    ;; Participant availability
    ;; --------------------------
    ;; Agent1 (from first agent's info)
    ;; First agent reported busy at:
    ;;   10:00-10:30  => slot-1000
    ;;   15:30-16:00  => slot-1530
    ;; Therefore agent1 is free in all other slots:
    (free agent1 slot-0900) (free agent1 slot-0930) (free agent1 slot-1030) (free agent1 slot-1100)
    (free agent1 slot-1130) (free agent1 slot-1200) (free agent1 slot-1230) (free agent1 slot-1300)
    (free agent1 slot-1330) (free agent1 slot-1400) (free agent1 slot-1430) (free agent1 slot-1500)
    (free agent1 slot-1600) (free agent1 slot-1630)

    ;; Kathryn (from second agent's info) is free all day
    (free kathryn slot-0900) (free kathryn slot-0930) (free kathryn slot-1000) (free kathryn slot-1030)
    (free kathryn slot-1100) (free kathryn slot-1130) (free kathryn slot-1200) (free kathryn slot-1230)
    (free kathryn slot-1300) (free kathryn slot-1330) (free kathryn slot-1400) (free kathryn slot-1430)
    (free kathryn slot-1500) (free kathryn slot-1530) (free kathryn slot-1600) (free kathryn slot-1630)

    ;; Megan (from third agent's info) — she asserted only the free slots below.
    ;; Megan's busy slots (in that agent's mapping) were:
    ;;  10:30-11:00 => slot-1030
    ;;  11:30-12:30 => slot-1130, slot-1200
    ;;  13:30-14:30 => slot-1330, slot-1400
    ;;  15:00-16:30 => slot-1500, slot-1530, slot-1600
    ;; Megan's free slots (explicitly asserted by her):
    (free megan slot-0900)  ; s0
    (free megan slot-0930)  ; s1
    (free megan slot-1000)  ; s2
    (free megan slot-1100)  ; s4
    (free megan slot-1230)  ; s7
    (free megan slot-1300)  ; s8
    (free megan slot-1430)  ; s11
    (free megan slot-1630)  ; s15

    ;; --------------------------
    ;; Temporal ordering relations (before): for every strictly earlier -> later pair
    ;; used to check whether any earlier slot remains free (enforcing earliest choice)
    ;; (This list covers all strict order pairs. A compact encoding would be possible,
    ;; but we spell them out for clarity and FastDownward compatibility.)
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

  ;; Goal: schedule a single meeting at the earliest slot that fits all participant calendars.
  ;; Given the availability above, the earliest slot where all three participants are free is slot-0900.
  (:goal (and (scheduled) (scheduled-at slot-0900)))
)