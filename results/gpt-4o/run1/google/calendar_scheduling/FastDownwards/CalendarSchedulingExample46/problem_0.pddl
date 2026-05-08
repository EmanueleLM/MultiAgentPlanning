(define (problem schedule_meeting_instance)
  (:domain meeting_scheduling)
  (:objects
    arthur theresa carl - participant
    time_0900 time_0930 time_1000 time_1030 time_1100
    time_1130 time_1200 time_1230 time_1300 time_1330
    time_1400 time_1430 time_1500 time_1530 time_1600
    time_1630 time_1700 - time_slot
  )
  (:init
    ;; Availabilities
    (available arthur time_0900)
    (available arthur time_1000)
    (available arthur time_1030)
    (available arthur time_1100)
    (available arthur time_1130)
    (available arthur time_1200)
    (available arthur time_1230)
    (available arthur time_1300)
    (available arthur time_1330)
    (available arthur time_1430)
    (available arthur time_1500)
    (available arthur time_1530)
    (available arthur time_1600)
    (available arthur time_1630)
    (available theresa time_0930)
    (available theresa time_1000)
    (available theresa time_1030)
    (available theresa time_1100)
    (available theresa time_1130)
    (available theresa time_1300)
    (available theresa time_1330)
    (available theresa time_1400)
    (available theresa time_1430)
    (available theresa time_1630)
    (available theresa time_1700)
    (available carl time_1430)
    ;; Meeting Possibilities
    (meeting_possible time_1600 time_1630)
  )
  (:goal
    (scheduled time_1600 time_1630)
  )
)