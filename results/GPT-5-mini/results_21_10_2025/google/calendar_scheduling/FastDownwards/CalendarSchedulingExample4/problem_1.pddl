(define (problem schedule-meeting)
  (:domain meeting-domain)
  (:objects
    slot-0900-0930 slot-0930-1000 slot-1000-1030 slot-1030-1100
    slot-1100-1130 slot-1130-1200 slot-1200-1230 slot-1230-1300
    slot-1300-1330 slot-1330-1400 slot-1400-1430 slot-1430-1500
    slot-1500-1530 slot-1530-1600 slot-1600-1630 slot-1630-1700 - slot
  )
  (:init
    ;; Donna's availability on Monday between 09:00 and 17:00 (30-minute slots),
    ;; excluding her busy intervals 14:00-14:30 and 15:30-16:00.
    (free donna slot-0900-0930)
    (free donna slot-0930-1000)
    (free donna slot-1000-1030)
    (free donna slot-1030-1100)
    (free donna slot-1100-1130)
    (free donna slot-1130-1200)
    (free donna slot-1200-1230)
    (free donna slot-1230-1300)
    (free donna slot-1300-1330)
    (free donna slot-1330-1400)
    (free donna slot-1430-1500)
    (free donna slot-1500-1530)
    (free donna slot-1600-1630)
    (free donna slot-1630-1700)

    ;; John's availability on Monday between 09:00 and 17:00 (30-minute slots),
    ;; excluding his busy intervals 11:00-11:30 and 16:30-17:00.
    (free john slot-0900-0930)
    (free john slot-0930-1000)
    (free john slot-1000-1030)
    (free john slot-1030-1100)
    (free john slot-1130-1200)
    (free john slot-1200-1230)
    (free john slot-1230-1300)
    (free john slot-1300-1330)
    (free john slot-1330-1400)
    (free john slot-1400-1430)
    (free john slot-1430-1500)
    (free john slot-1500-1530)
    (free john slot-1530-1600)
    (free john slot-1600-1630)

    ;; Billy's availability on Monday between 09:00 and 17:00 (30-minute slots),
    ;; excluding his busy intervals 09:00-10:00, 10:30-14:00, and 14:30-17:00.
    (free billy slot-1000-1030)
    (free billy slot-1400-1430)
  )
  ;; Goal: a meeting must be scheduled (the solver will find a slot where all three attend)
  (:goal (meeting-scheduled))
)