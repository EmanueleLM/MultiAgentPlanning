(define (problem schedule-monday)
  (:domain single-meeting-scheduling)
  (:objects
    slot-0900-0930 slot-0930-1000 slot-1000-1030 slot-1030-1100
    slot-1100-1130 slot-1130-1200 slot-1200-1230 slot-1230-1300
    slot-1300-1330 slot-1330-1400 slot-1400-1430 slot-1430-1500
    slot-1500-1530 slot-1530-1600 slot-1600-1630 slot-1630-1700 - slot
  )
  (:init
    ; Diane free slots (busy: 09:00-09:30, 12:00-12:30, 14:30-15:30)
    (free diane slot-0930-1000)
    (free diane slot-1000-1030)
    (free diane slot-1030-1100)
    (free diane slot-1100-1130)
    (free diane slot-1130-1200)
    (free diane slot-1230-1300)
    (free diane slot-1300-1330)
    (free diane slot-1330-1400)
    (free diane slot-1400-1430)
    (free diane slot-1530-1600)
    (free diane slot-1600-1630)
    (free diane slot-1630-1700)

    ; Kelly free slots (busy: 09:30-10:00, 10:30-11:00)
    (free kelly slot-0900-0930)
    (free kelly slot-1000-1030)
    (free kelly slot-1100-1130)
    (free kelly slot-1130-1200)
    (free kelly slot-1200-1230)
    (free kelly slot-1230-1300)
    (free kelly slot-1300-1330)
    (free kelly slot-1330-1400)
    (free kelly slot-1400-1430)
    (free kelly slot-1430-1500)
    (free kelly slot-1500-1530)
    (free kelly slot-1530-1600)
    (free kelly slot-1600-1630)
    (free kelly slot-1630-1700)

    ; Deborah free slots (busy: 09:00-09:30, 10:00-14:00, 14:30-17:00)
    (free deborah slot-0930-1000)
    (free deborah slot-1400-1430)
  )
  (:goal (and
    (meeting-scheduled)
  ))
)