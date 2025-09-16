(define (problem monday-meeting)
  (:domain meeting-scheduler)
  (:objects
     m1 - meeting
  )
  (:init
    ; All time slots exist
    (time_slot t0900_0930) (time_slot t0930_1000) (time_slot t1000_1030) (time_slot t1030_1100)
    (time_slot t1100_1130) (time_slot t1130_1200) (time_slot t1200_1230) (time_slot t1230_1300)
    (time_slot t1300_1330) (time_slot t1330_1400) (time_slot t1400_1430) (time_slot t1430_1500)
    (time_slot t1500_1530) (time_slot t1530_1600) (time_slot t1600_1630) (time_slot t1630_1700)

    ; Agent 1 knowledge: Benjamin free all slots; Hannah and Brenda known free only 09:00-09:30
    (free benjamin t0900_0930) (free benjamin t0930_1000) (free benjamin t1000_1030)
    (free benjamin t1030_1100) (free benjamin t1100_1130) (free benjamin t1130_1200)
    (free benjamin t1200_1230) (free benjamin t1230_1300) (free benjamin t1300_1330)
    (free benjamin t1330_1400) (free benjamin t1400_1430) (free benjamin t1430_1500)
    (free benjamin t1500_1530) (free benjamin t1530_1600) (free benjamin t1600_1630)
    (free benjamin t1630_1700)

    (free hannah t0900_0930)  ; Hannah known free only at 09:00-09:30 (per Agent 1)
    (free brenda t0900_0930)

    ; Brenda's known blocked slots (from Agent 3)
    (blocked brenda t0930_1000)  ; 09:30-10:00
    (blocked brenda t1130_1200)  ; 11:30-12:00
    (blocked brenda t1200_1230)  ; 12:00-12:30
    (blocked brenda t1400_1430)  ; 14:00-14:30
    (blocked brenda t1430_1500)  ; 14:30-15:00
    (blocked brenda t1500_1530)  ; 15:00-15:30
    (blocked brenda t1530_1600)  ; 15:30-16:00
    (blocked brenda t1600_1630)  ; 16:00-16:30
  )
  (:goal (start m1 t0900_0930))
)