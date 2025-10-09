(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    arthur michael samantha - participant
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )

  (:init
    ;; adjacency (consecutive 30-minute slots)
    (next slot1 slot2)
    (next slot2 slot3)
    (next slot3 slot4)
    (next slot4 slot5)
    (next slot5 slot6)
    (next slot6 slot7)
    (next slot7 slot8)
    (next slot8 slot9)
    (next slot9 slot10)
    (next slot10 slot11)
    (next slot11 slot12)
    (next slot12 slot13)
    (next slot13 slot14)
    (next slot14 slot15)
    (next slot15 slot16)

    ;; Initial availability = slots not in each participant's busy intervals
    ;; Arthur busy: slot1, slot4, slot5, slot6, slot15, slot16 -> therefore free facts exclude those
    (free-arthur slot2)
    (free-arthur slot3)
    (free-arthur slot7)
    (free-arthur slot8)
    (free-arthur slot9)
    (free-arthur slot10)
    (free-arthur slot11)
    (free-arthur slot12)
    (free-arthur slot13)
    (free-arthur slot14)

    ;; Michael busy: slot9, slot11 -> free all other slots
    (free-michael slot1)
    (free-michael slot2)
    (free-michael slot3)
    (free-michael slot4)
    (free-michael slot5)
    (free-michael slot6)
    (free-michael slot7)
    (free-michael slot8)
    (free-michael slot10)
    (free-michael slot12)
    (free-michael slot13)
    (free-michael slot14)
    (free-michael slot15)
    (free-michael slot16)

    ;; Samantha busy: slot4, slot7, slot8, slot9, slot10, slot11, slot12, slot14, slot15, slot16
    ;; Thus Samantha free at 1,2,3,5,6,13
    (free-samantha slot1)
    (free-samantha slot2)
    (free-samantha slot3)
    (free-samantha slot5)
    (free-samantha slot6)
    (free-samantha slot13)
  )

  (:goal (meeting-scheduled))
)