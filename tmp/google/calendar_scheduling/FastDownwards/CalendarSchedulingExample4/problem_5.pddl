(define (problem integrate_schedules_monday)
  (:domain multi_agent_meeting_scheduler)
  (:objects
     s0900_0930 s0930_1000 s1000_1030 s1030_1100
     s1100_1130 s1130_1200 s1200_1230 s1230_1300
     s1300_1330 s1330_1400 s1400_1430 s1430_1500
     s1500_1530 s1530_1600 s1600_1630 s1630_1700
  - slot)
  (:init
     ; Donna's availability (busy at 14:00-14:30 and 15:30-16:00)
     (free donna s0900_0930) (free donna s0930_1000) (free donna s1000_1030)
     (free donna s1030_1100) (free donna s1100_1130) (free donna s1130_1200)
     (free donna s1200_1230) (free donna s1230_1300) (free donna s1300_1330)
     (free donna s1330_1400) (not (free donna s1400_1430))
     (free donna s1430_1500) (free donna s1500_1530) (not (free donna s1530_1600))
     (free donna s1600_1630) (free donna s1630_1700)

     ; John's availability (busy 11:00-11:30 and 16:30-17:00)
     (available john s0900_0930) (available john s0930_1000) (available john s1000_1030)
     (available john s1030_1100) (not (available john s1100_1130)) (available john s1130_1200)
     (available john s1200_1230) (available john s1230_1300) (available john s1300_1330)
     (available john s1330_1400) (available john s1400_1430) (available john s1430_1500)
     (available john s1500_1530) (available john s1530_1600) (available john s1600_1630)
     (not (available john s1630_1700))

     ; Billy's availability (busy 9:00-10:00, 10:30-14:00, 14:30-17:00)
     (slot-available s1000_1030) (slot-available s1400_1430)

     ; No meeting scheduled yet
     (not (meeting-scheduled s0900_0930)) (not (meeting-scheduled s0930_1000)) (not (meeting-scheduled s1000_1030))
     (not (meeting-scheduled s1030_1100)) (not (meeting-scheduled s1100_1130)) (not (meeting-scheduled s1130_1200))
     (not (meeting-scheduled s1200_1230)) (not (meeting-scheduled s1230_1300)) (not (meeting-scheduled s1300_1330))
     (not (meeting-scheduled s1330_1400)) (not (meeting-scheduled s1400_1430)) (not (meeting-scheduled s1430_1500))
     (not (meeting-scheduled s1500_1530)) (not (meeting-scheduled s1530_1600)) (not (meeting-scheduled s1600_1630))
     (not (meeting-scheduled s1630_1700))
  )
  (:goal (or
     (meeting-scheduled s0900_0930) (meeting-scheduled s0930_1000) (meeting-scheduled s1000_1030) (meeting-scheduled s1030_1100)
     (meeting-scheduled s1100_1130) (meeting-scheduled s1130_1200) (meeting-scheduled s1200_1230) (meeting-scheduled s1230_1300)
     (meeting-scheduled s1300_1330) (meeting-scheduled s1330_1400) (meeting-scheduled s1400_1430) (meeting-scheduled s1430_1500)
     (meeting-scheduled s1500_1530) (meeting-scheduled s1530_1600) (meeting-scheduled s1600_1630) (meeting-scheduled s1630_1700)
  ))