(define (problem meeting-schedule-problem)
  (:domain scheduling-merge)
  (:objects
     Alexander Elizabeth Walter - person
     slot-0900-0930 slot-0930-1000 slot-1000-1030 slot-1030-1100
     slot-1100-1130 slot-1130-1200 slot-1200-1230 slot-1230-1300
     slot-1300-1330 slot-1330-1400 slot-1400-1430 slot-1430-1500
     slot-1500-1530 slot-1530-1600 slot-1600-1630 slot-1630-1700 - slot
     M1 - meeting
  )
  (:init
     ;; Agent A: Free slots for Alexander
     (free Alexander slot-0900-0930)
     (free Alexander slot-1000-1030)
     (free Alexander slot-1100-1130)
     (free Alexander slot-1130-1200)
     (free Alexander slot-1200-1230)
     (free Alexander slot-1300-1330)
     (free Alexander slot-1330-1400)
     (free Alexander slot-1400-1430)
     (free Alexander slot-1500-1530)
     (free Alexander slot-1530-1600)

     ;; Agent A: Free slots for Elizabeth
     (free Elizabeth slot-0900-0930)
     (free Elizabeth slot-1000-1030)
     (free Elizabeth slot-1100-1130)
     (free Elizabeth slot-1130-1200)
     (free Elizabeth slot-1200-1230)
     (free Elizabeth slot-1300-1330)
     (free Elizabeth slot-1330-1400)
     (free Elizabeth slot-1400-1430)
     (free Elizabeth slot-1500-1530)
     (free Elizabeth slot-1530-1600)

     ;; Agent A: Free slots for Walter
     (free Walter slot-0900-0930)
     (free Walter slot-1000-1030)
     (free Walter slot-1100-1130)
     (free Walter slot-1130-1200)
     (free Walter slot-1200-1230)
     (free Walter slot-1300-1330)
     (free Walter slot-1330-1400)
     (free Walter slot-1400-1430)
     (free Walter slot-1500-1530)
     (free Walter slot-1530-1600)

     ;; Agent C: Initial availability (for 14:30-15:00 and 15:00-15:30)
     (available Alexander slot-1430-1500)
     (available Elizabeth slot-1430-1500)
     (available Walter slot-1430-1500)

     (available Alexander slot-1500-1530)
     (available Elizabeth slot-1500-1530)
     (available Walter slot-1500-1530)
  )
  (:goal (exists (?slot - slot) (meeting-at ?slot)))
)