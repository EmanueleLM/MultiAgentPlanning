(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    jesse megan organizer - person
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )

  (:init
    ; Jesse free slots: 1,2,4,5,6,7,8,9,10,11,12,13,15,16
    (free jesse slot1)
    (free jesse slot2)
    (free jesse slot4)
    (free jesse slot5)
    (free jesse slot6)
    (free jesse slot7)
    (free jesse slot8)
    (free jesse slot9)
    (free jesse slot10)
    (free jesse slot11)
    (free jesse slot12)
    (free jesse slot13)
    (free jesse slot15)
    (free jesse slot16)

    ; Megan free slots: 1,2,3,5,8,9,12,16
    (free megan slot1)
    (free megan slot2)
    (free megan slot3)
    (free megan slot5)
    (free megan slot8)
    (free megan slot9)
    (free megan slot12)
    (free megan slot16)

    ; Organizer ("me") free slots: 2..16 (busy at slot1)
    (free organizer slot2)
    (free organizer slot3)
    (free organizer slot4)
    (free organizer slot5)
    (free organizer slot6)
    (free organizer slot7)
    (free organizer slot8)
    (free organizer slot9)
    (free organizer slot10)
    (free organizer slot11)
    (free organizer slot12)
    (free organizer slot13)
    (free organizer slot14)
    (free organizer slot15)
    (free organizer slot16)

    ; Precomputed "allfree" slots where all three participants are free:
    ; intersection of their free slots: slots 2,5,8,9,12,16
    (allfree slot2)
    (allfree slot5)
    (allfree slot8)
    (allfree slot9)
    (allfree slot12)
    (allfree slot16)
  )

  (:goal (meeting-scheduled))
)