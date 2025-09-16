(define (problem integrate_schedules_monday)
  (:domain multi_agent_meeting_scheduler)
  (:objects
     s0900_0930 s0930_1000 s1000_1030 s1030_1100
     s1100_1130 s1130_1200 s1200_1230 s1230_1300
     s1300_1330 s1330_1400 s1400_1430 s1430_1500
     s1500_1530 s1530_1600 s1600_1630 s1630_1700
     - slot
  )
  (:init
     ; Free times for Alice, Bob, Carol
     (free alice s0900_0930) (free bob s0900_0930) (free carol s0900_0930)
     (free alice s0930_1000) (free bob s0930_1000) (free carol s0930_1000)
     (free alice s1000_1030) (free bob s1000_1030) (free carol s1000_1030)
     (free alice s1030_1100) (free bob s1030_1100) (free carol s1030_1100)
     (free alice s1100_1130) (free bob s1100_1130) (free carol s1100_1130)
     (free alice s1130_1200) (free bob s1130_1200) (free carol s1130_1200)
     (free alice s1200_1230) (free bob s1200_1230) (free carol s1200_1230)
     (free alice s1230_1300) (free bob s1230_1300) (free carol s1230_1300)
     (free alice s1300_1330) (free bob s1300_1330) (free carol s1300_1330)
     (free alice s1330_1400) (free bob s1330_1400) (free carol s1330_1400)
     ; 14:00-14:30 busy for all
     (not (free alice s1400_1430)) (not (free bob s1400_1430)) (not (free carol s1400_1430))
     (free alice s1430_1500) (free bob s1430_1500) (free carol s1430_1500)
     ; 15:30-16:00 busy for all
     (not (free alice s1530_1600)) (not (free bob s1530_1600)) (not (free carol s1530_1600))
     (free alice s1600_1630) (free bob s1600_1630) (free carol s1600_1630)
     (free alice s1630_1700) (free bob s1630_1700) (free carol s1630_1700)
     ; John’s busy times (not available)
     (available john s0900_0930) (available john s0930_1000) (available john s1000_1030)
     (available john s1030_1100) (not (available john s1100_1130)) (available john s1130_1200)
     (available john s1200_1230) (available john s1230_1300) (available john s1300_1330)
     (available john s1330_1400) (available john s1400_1430) (available john s1430_1500)
     (available john s1500_1530) (available john s1530_1600) (available john s1600_1630)
     (not (available john s1630_1700))
     ; Slot-available (third agent's available slots)
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