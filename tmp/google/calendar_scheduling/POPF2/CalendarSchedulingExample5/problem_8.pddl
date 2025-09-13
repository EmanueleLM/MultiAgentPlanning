(define (problem schedule-meeting)
  (:domain meeting-scheduler)

  (:objects
    kathryn charlotte lauren - person
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100
    slot-1130 slot-1200 slot-1230 slot-1300 slot-1400
    slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - time-slot)

  (:init
    ;; Adjacent time slots for 30-minute meeting
    (adjacent slot-0900 slot-0930) (adjacent slot-0930 slot-1000)
    (adjacent slot-1000 slot-1030) (adjacent slot-1030 slot-1100)
    (adjacent slot-1100 slot-1130) (adjacent slot-1130 slot-1200)
    (adjacent slot-1200 slot-1230) (adjacent slot-1230 slot-1300)
    (adjacent slot-1300 slot-1400) (adjacent slot-1400 slot-1430)
    (adjacent slot-1430 slot-1500) (adjacent slot-1500 slot-1530)
    (adjacent slot-1530 slot-1600) (adjacent slot-1600 slot-1630)

    ;; Kathryn's availability
    (available kathryn slot-0930) (available kathryn slot-1000)
    (available kathryn slot-1030) (available kathryn slot-1100)
    (available kathryn slot-1400) (available kathryn slot-1430)
    (available kathryn slot-1500)

    ;; Charlotte's availability
    (available charlotte slot-0900) (available charlotte slot-0930)
    (available charlotte slot-1000) (available charlotte slot-1030)
    (available charlotte slot-1100) (available charlotte slot-1130)
    (available charlotte slot-1300)

    ;; Lauren's availability
    (available lauren slot-1000) (available lauren slot-1030)
    (available lauren slot-1100) (available lauren slot-1130)
    (available lauren slot-1230) (available lauren slot-1300)
    (available lauren slot-1430) (available lauren slot-1530)

    ;; Initial meeting readiness
    (meeting-ready)
  )

  (:goal
    (exists (?t1 ?t2 - time-slot)
      (and 
        (scheduled-kathryn ?t1 ?t2)
        (scheduled-charlotte ?t1 ?t2)
        (scheduled-lauren ?t1 ?t2)))
  )
)