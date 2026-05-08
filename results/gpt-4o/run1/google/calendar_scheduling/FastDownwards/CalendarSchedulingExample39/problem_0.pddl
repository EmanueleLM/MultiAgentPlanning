(define (problem schedule_task)
  (:domain scheduling)
  
  (:objects
    emily victoria nancy - participant
    monday_0900 monday_0930 monday_1000 monday_1030 monday_1100 monday_1130
    monday_1200 monday_1230 monday_1300 monday_1330 monday_1400 monday_1430
    monday_1500 monday_1530 monday_1600 monday_1630 monday_1700 - timeslot
  )
  
  (:init
    ;; Emily's Free Schedule
    (free emily monday_0900) (free emily monday_0930) (free emily monday_1000)
    (free emily monday_1030) (free emily monday_1100) (free emily monday_1130)
    (free emily monday_1200) (free emily monday_1230) (free emily monday_1300)
    (free emily monday_1330) (free emily monday_1400) (free emily monday_1430)
    (free emily monday_1500) (free emily monday_1530) (free emily monday_1600)
    (free emily monday_1630) (free emily monday_1700)

    ;; Victoria's Free Schedule
    (free victoria monday_0900) (free victoria monday_0930)
    (free victoria monday_1000) (free victoria monday_1030)
    (free victoria monday_1100) (free victoria monday_1130)
    (free victoria monday_1200) (free victoria monday_1230)
    (free victoria monday_1300) (free victoria monday_1400)
    (free victoria monday_1430) (free victoria monday_1500)
    (free victoria monday_1530) (free victoria monday_1600)
    (free victoria monday_1630)

    ;; Nancy's Free Schedule
    (free nancy monday_1400) (free nancy monday_1430)
    (free nancy monday_1500) (free nancy monday_1530)
    (free nancy monday_1600) (free nancy monday_1630)
    (free nancy monday_1700)
  )

  (:goal
    (meeting_scheduled)
  )
)