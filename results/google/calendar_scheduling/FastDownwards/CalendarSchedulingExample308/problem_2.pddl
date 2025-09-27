(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)
  (:objects
    catherine michael alexander - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ; Catherine availability (busy: 10:30-11:00, 12:30-13:30, 14:30-15:00)
    (available catherine s0900)
    (available catherine s0930)
    (available catherine s1000)
    (available catherine s1100)
    (available catherine s1130)
    (available catherine s1200)
    (available catherine s1330)
    (available catherine s1400)
    (available catherine s1500)
    (available catherine s1530)
    (available catherine s1600)
    (available catherine s1630)

    ; Michael availability (busy: 9:30-10:30, 12:00-13:00, 13:30-14:00, 15:00-15:30)
    (available michael s0900)
    (available michael s1030)
    (available michael s1100)
    (available michael s1130)
    (available michael s1300)
    (available michael s1400)
    (available michael s1430)
    (available michael s1530)
    (available michael s1600)
    (available michael s1630)

    ; Alexander availability (busy: 9:00-9:30, 10:00-10:30, 11:00-12:00, 13:00-13:30, 14:00-16:00, 16:30-17:00)
    (available alexander s0930)
    (available alexander s1030)
    (available alexander s1200)
    (available alexander s1230)
    (available alexander s1330)
    (available alexander s1600)

    (room-available s1600)
  )
  (:goal
    (and
      (meeting-scheduled)
      (scheduled-at s1600)
      (attends catherine)
      (attends michael)
      (attends alexander)
    )
  )
)