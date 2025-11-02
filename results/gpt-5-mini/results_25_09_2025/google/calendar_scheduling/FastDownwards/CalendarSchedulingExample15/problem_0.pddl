(define (problem schedule-meeting-monday)
  (:domain multi-agent-meeting)

  ;; time slots (30-minute increments from 09:00 to 17:00)
  (:objects
    slot0900_0930 slot0930_1000 slot1000_1030 slot1030_1100
    slot1100_1130 slot1130_1200 slot1200_1230 slot1230_1300
    slot1300_1330 slot1330_1400 slot1400_1430 slot1430_1500
    slot1500_1530 slot1530_1600 slot1600_1630 slot1630_1700 - slot
  )

  (:init
    ;; declare slots
    (slot slot0900_0930) (slot slot0930_1000) (slot slot1000_1030) (slot slot1030_1100)
    (slot slot1100_1130) (slot slot1130_1200) (slot slot1200_1230) (slot slot1230_1300)
    (slot slot1300_1330) (slot slot1330_1400) (slot slot1400_1430) (slot slot1430_1500)
    (slot slot1500_1530) (slot slot1530_1600) (slot slot1600_1630) (slot slot1630_1700)

    ;; -------------------------
    ;; Joyce's private information
    ;; Busy intervals (as 30-min slots) from Joyce's description:
    ;; - 11:00-11:30, 13:30-14:00, 14:30-16:30
    (busy-joyce slot1100_1130)
    (busy-joyce slot1330_1400)
    (busy-joyce slot1430_1500)
    (busy-joyce slot1500_1530)
    (busy-joyce slot1530_1600)
    (busy-joyce slot1600_1630)

    ;; Available slots for Joyce (within 09:00-17:00 excluding known busy intervals)
    (available-joyce slot0900_0930)
    (available-joyce slot0930_1000)
    (available-joyce slot1000_1030)
    (available-joyce slot1030_1100)
    (available-joyce slot1130_1200)
    (available-joyce slot1200_1230)
    (available-joyce slot1230_1300)
    (available-joyce slot1300_1330)
    (available-joyce slot1400_1430)
    (available-joyce slot1630_1700)

    ;; -------------------------
    ;; Christine's private information
    ;; - I have no meetings on Monday
    ;; - I cannot meet before 12:00 -> not available for slots that start before 12:00
    ;; Represent unavailability for slots starting before 12:00 as busy-christine
    (busy-christine slot0900_0930)
    (busy-christine slot0930_1000)
    (busy-christine slot1000_1030)
    (busy-christine slot1030_1100)
    (busy-christine slot1100_1130)
    (busy-christine slot1130_1200)

    ;; Available slots for Christine (12:00 onward)
    (available-christine slot1200_1230)
    (available-christine slot1230_1300)
    (available-christine slot1300_1330)
    (available-christine slot1330_1400)
    (available-christine slot1400_1430)
    (available-christine slot1430_1500)
    (available-christine slot1500_1530)
    (available-christine slot1530_1600)
    (available-christine slot1600_1630)
    (available-christine slot1630_1700)

    ;; -------------------------
    ;; Alexander's private information
    ;; Busy intervals:
    ;; - 09:00-11:00  -> slots 09:00-09:30, 09:30-10:00, 10:00-10:30, 10:30-11:00
    ;; - 12:00-12:30 -> slot1200_1230
    ;; - 13:30-15:00 -> slots 1330_1400, 1400_1430, 1430_1500
    ;; - 15:30-16:00 -> slot1530_1600
    ;; - 16:30-17:00 -> slot1630_1700
    (busy-alexander slot0900_0930)
    (busy-alexander slot0930_1000)
    (busy-alexander slot1000_1030)
    (busy-alexander slot1030_1100)
    (busy-alexander slot1200_1230)
    (busy-alexander slot1330_1400)
    (busy-alexander slot1400_1430)
    (busy-alexander slot1430_1500)
    (busy-alexander slot1530_1600)
    (busy-alexander slot1630_1700)

    ;; Available slots for Alexander (those within 09:00-17:00 not listed busy)
    (available-alexander slot1100_1130)
    (available-alexander slot1130_1200)
    (available-alexander slot1230_1300)
    (available-alexander slot1300_1330)
    (available-alexander slot1500_1530)
    (available-alexander slot1600_1630)

    ;; -------------------------
    ;; Public/shared information (represented implicitly by the set of slots above).
    ;; Meeting has not yet been scheduled.
    ;; The meeting duration is 30 minutes; slots are 30-min increments.
    (not-meeting-scheduled) ;; note: this is not a PDDL predicate; meeting state is tracked by (meeting-scheduled) being absent initially
  )

  ;; Goal: schedule a 30-minute meeting with Joyce, Christine and Alexander
  ;; on Monday between 09:00 and 17:00. Model goal as having the meeting scheduled.
  (:goal (meeting-scheduled))
)