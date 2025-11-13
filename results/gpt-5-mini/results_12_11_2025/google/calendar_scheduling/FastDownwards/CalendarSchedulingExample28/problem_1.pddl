(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)

  (:objects
    brittany emily doris - participant

    slot0900 slot0930 slot1000 slot1030 slot1100 slot1130 slot1200 slot1230
    slot1300 slot1330 slot1400 slot1430 slot1500 slot1530 slot1600 slot1630 - slot
  )

  (:init
    ;; Brittany: busy 13:00-13:30 (slot1300) and 16:00-16:30 (slot1600); free otherwise
    (free-slot brittany slot0900)
    (free-slot brittany slot0930)
    (free-slot brittany slot1000)
    (free-slot brittany slot1030)
    (free-slot brittany slot1100)
    (free-slot brittany slot1130)
    (free-slot brittany slot1200)
    (free-slot brittany slot1230)
    ;; slot1300 is busy for brittany
    (free-slot brittany slot1330)
    (free-slot brittany slot1400)
    (free-slot brittany slot1430)
    (free-slot brittany slot1500)
    (free-slot brittany slot1530)
    ;; slot1600 is busy for brittany
    (free-slot brittany slot1630)

    ;; Emily: free the entire workday
    (free-slot emily slot0900)
    (free-slot emily slot0930)
    (free-slot emily slot1000)
    (free-slot emily slot1030)
    (free-slot emily slot1100)
    (free-slot emily slot1130)
    (free-slot emily slot1200)
    (free-slot emily slot1230)
    (free-slot emily slot1300)
    (free-slot emily slot1330)
    (free-slot emily slot1400)
    (free-slot emily slot1430)
    (free-slot emily slot1500)
    (free-slot emily slot1530)
    (free-slot emily slot1600)
    (free-slot emily slot1630)

    ;; Doris: busy 09:00-11:00 (slot0900..slot1030),
    ;;       busy 11:30-14:30 (slot1130..slot1400),
    ;;       busy 15:00-17:00 (slot1500..slot1630).
    ;; So Doris is free only at 11:00 (slot1100) and 14:30 (slot1430).
    (free-slot doris slot1100)
    (free-slot doris slot1430)
  )

  ;; The goal is that a meeting is scheduled (the domain only allows scheduling
  ;; at the audited earliest slot because only that scheduling action is provided).
  (:goal (meeting-scheduled))
)