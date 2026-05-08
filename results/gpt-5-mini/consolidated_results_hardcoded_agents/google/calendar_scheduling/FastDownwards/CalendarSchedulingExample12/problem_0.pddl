(define (problem schedule_monday)
  (:domain single_meeting)
  (:objects
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - timeslot
  )
  (:init
    ; within-hours for all defined slots
    (within_hours slot_0900_0930) (within_hours slot_0930_1000)
    (within_hours slot_1000_1030) (within_hours slot_1030_1100)
    (within_hours slot_1100_1130) (within_hours slot_1130_1200)
    (within_hours slot_1200_1230) (within_hours slot_1230_1300)
    (within_hours slot_1300_1330) (within_hours slot_1330_1400)
    (within_hours slot_1400_1430) (within_hours slot_1430_1500)
    (within_hours slot_1500_1530) (within_hours slot_1530_1600)
    (within_hours slot_1600_1630) (within_hours slot_1630_1700)

    ; successor (adjacency) links between consecutive 30-minute slots
    (succ slot_0900_0930 slot_0930_1000)
    (succ slot_0930_1000 slot_1000_1030)
    (succ slot_1000_1030 slot_1030_1100)
    (succ slot_1030_1100 slot_1100_1130)
    (succ slot_1100_1130 slot_1130_1200)
    (succ slot_1130_1200 slot_1200_1230)
    (succ slot_1200_1230 slot_1230_1300)
    (succ slot_1230_1300 slot_1300_1330)
    (succ slot_1300_1330 slot_1330_1400)
    (succ slot_1330_1400 slot_1400_1430)
    (succ slot_1400_1430 slot_1430_1500)
    (succ slot_1430_1500 slot_1500_1530)
    (succ slot_1500_1530 slot_1530_1600)
    (succ slot_1530_1600 slot_1600_1630)
    (succ slot_1600_1630 slot_1630_1700)

    ; availability according to vetted input
    ; David: no meetings on Monday -> available all slots
    (available david slot_0900_0930) (available david slot_0930_1000)
    (available david slot_1000_1030) (available david slot_1030_1100)
    (available david slot_1100_1130) (available david slot_1130_1200)
    (available david slot_1200_1230) (available david slot_1230_1300)
    (available david slot_1300_1330) (available david slot_1330_1400)
    (available david slot_1400_1430) (available david slot_1430_1500)
    (available david slot_1500_1530) (available david slot_1530_1600)
    (available david slot_1600_1630) (available david slot_1630_1700)

    ; Debra: busy 09:30-10:00,11:00-11:30,12:00-13:00 (two slots),14:00-14:30,16:00-16:30
    ; therefore available on the other within-hours slots
    (available debra slot_0900_0930)
    (available debra slot_1000_1030) (available debra slot_1030_1100)
    (available debra slot_1130_1200)
    (available debra slot_1300_1330) (available debra slot_1330_1400)
    (available debra slot_1430_1500) (available debra slot_1500_1530)
    (available debra slot_1530_1600) (available debra slot_1630_1700)

    ; Kevin: busy 09:00-12:00 and 14:00-17:00 -> free 12:00-14:00 (four slots)
    (available kevin slot_1200_1230) (available kevin slot_1230_1300)
    (available kevin slot_1300_1330) (available kevin slot_1330_1400)
  )
  (:goal (meeting_scheduled slot_1300_1330 slot_1330_1400))
)