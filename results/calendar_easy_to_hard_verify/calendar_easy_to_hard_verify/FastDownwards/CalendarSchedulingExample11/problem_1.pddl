(define (problem CalendarSchedulingExample11-prob)
  (:domain calendar-scheduling)
  (:objects
    madison linda logan virginia - participant
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )
  (:init
    ; Madison free slots (not busy at 10:00-10:30 slot3, 14:30-15:00 slot12, 15:30-16:00 slot14, 16:30-17:00 slot16)
    (free madison slot1) (free madison slot2) (free madison slot4) (free madison slot5)
    (free madison slot6) (free madison slot7) (free madison slot8) (free madison slot9)
    (free madison slot10) (free madison slot11) (free madison slot13) (free madison slot15)

    ; Linda free all work slots
    (free linda slot1) (free linda slot2) (free linda slot3) (free linda slot4)
    (free linda slot5) (free linda slot6) (free linda slot7) (free linda slot8)
    (free linda slot9) (free linda slot10) (free linda slot11) (free linda slot12)
    (free linda slot13) (free linda slot14) (free linda slot15) (free linda slot16)

    ; Logan free only slot7 (12:00-12:30) and slot15 (16:00-16:30)
    (free logan slot7) (free logan slot15)

    ; Virginia free slots (not busy at 09:30-11:00 slots2-4, 11:30-12:00 slot6, 13:00-14:30 slots9-11, 15:00-15:30 slot13, 16:00-17:00 slots15-16)
    (free virginia slot1) (free virginia slot5) (free virginia slot7) (free virginia slot8)
    (free virginia slot12) (free virginia slot14)
  )
  (:goal (scheduled slot7))
)