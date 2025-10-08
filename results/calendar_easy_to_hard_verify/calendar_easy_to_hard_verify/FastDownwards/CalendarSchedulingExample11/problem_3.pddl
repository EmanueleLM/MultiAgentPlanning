(define (problem CalendarSchedulingExample11-prob)
  (:domain calendar-scheduling)
  (:objects
    madison linda logan virginia - participant
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )
  (:init
    (free madison slot1) (free madison slot2) (free madison slot4) (free madison slot5)
    (free madison slot6) (free madison slot7) (free madison slot8) (free madison slot9)
    (free madison slot10) (free madison slot11) (free madison slot13) (free madison slot15)

    (free linda slot1) (free linda slot2) (free linda slot3) (free linda slot4)
    (free linda slot5) (free linda slot6) (free linda slot7) (free linda slot8)
    (free linda slot9) (free linda slot10) (free linda slot11) (free linda slot12)
    (free linda slot13) (free linda slot14) (free linda slot15) (free linda slot16)

    (free logan slot7) (free logan slot15)

    (free virginia slot1) (free virginia slot5) (free virginia slot7) (free virginia slot8)
    (free virginia slot12) (free virginia slot14)
  )
  (:goal (scheduled slot7))
)