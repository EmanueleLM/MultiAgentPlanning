(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    ;; attendees
    jesse nancy isabella harold linda - person
    ;; single meeting room
    meeting-room - room
    ;; half-hour slots on Monday 09:00-17:00 (start-end)
    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )

  (:init
    ;; meeting initially unscheduled and the room is free
    (unscheduled)
    (room-free meeting-room)

    ;; Availability derived from participants' busy intervals (busy = unavailable).
    ;; Jesse: busy 10:00-10:30 (s1000_1030), busy 15:00-15:30 (s1500_1530)
    ;; => available at all other slots
    (available jesse s0900_0930) (available jesse s0930_1000)
    (available jesse s1030_1100) (available jesse s1100_1130)
    (available jesse s1130_1200) (available jesse s1200_1230)
    (available jesse s1230_1300) (available jesse s1300_1330)
    (available jesse s1330_1400) (available jesse s1400_1430)
    (available jesse s1430_1500)              (available jesse s1530_1600)
    (available jesse s1600_1630) (available jesse s1630_1700)

    ;; Nancy: busy 09:00-09:30 (s0900_0930), 10:30-11:00 (s1030_1100),
    ;; 13:30-14:00 (s1330_1400), 14:30-15:00 (s1430_1500)
    ;; => available at others
    (available nancy s0930_1000) (available nancy s1000_1030)
    (available nancy s1100_1130) (available nancy s1130_1200)
    (available nancy s1200_1230) (available nancy s1230_1300)
    (available nancy s1300_1330)                 (available nancy s1400_1430)
    (available nancy s1500_1530) (available nancy s1530_1600)
    (available nancy s1600_1630) (available nancy s1630_1700)

    ;; Isabella: busy 09:00-10:00 (s0900_0930, s0930_1000), 11:30-12:00 (s1130_1200),
    ;; 15:30-16:00 (s1530_1600)
    ;; => available at others
    (available isabella s1000_1030) (available isabella s1030_1100)
    (available isabella s1100_1130)               (available isabella s1200_1230)
    (available isabella s1230_1300) (available isabella s1300_1330)
    (available isabella s1330_1400) (available isabella s1400_1430)
    (available isabella s1430_1500) (available isabella s1500_1530)
    (available isabella s1600_1630) (available isabella s1630_1700)

    ;; Harold: busy 09:00-10:00 (s0900_0930, s0930_1000), 10:30-16:30 (s1030_1100 .. s1600_1630)
    ;; => available only at s1000_1030 (10:00-10:30) and s1630_1700 (16:30-17:00)
    (available harold s1000_1030)
    (available harold s1630_1700)

    ;; Linda: busy 09:00-10:00 (s0900_0930, s0930_1000), 12:00-12:30 (s1200_1230),
    ;; 13:30-16:00 (s1330_1400, s1400_1430, s1430_1500, s1500_1530)
    ;; => available at others
    (available linda s1000_1030) (available linda s1030_1100)
    (available linda s1100_1130) (available linda s1130_1200)
                    (available linda s1230_1300) (available linda s1300_1330)
    (available linda s1600_1630) (available linda s1630_1700)
  )

  ;; Hard goal: schedule the meeting at the earliest feasible common slot.
  ;; From the availability above the only slot where ALL attendees are available is 16:30-17:00.
  (:goal (and (scheduled s1630_1700)))
)