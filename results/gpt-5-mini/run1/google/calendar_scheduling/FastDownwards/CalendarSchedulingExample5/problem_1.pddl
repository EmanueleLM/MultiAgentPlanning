(define (problem calendar_scheduling_problem5)
  (:domain calendar_scheduling)

  (:objects
    kathryn charlotte lauren - person
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )

  (:init
    ; kathryn busy: slot1, slot4, slot6, slot10, slot11, slot16
    ; kathryn free:
    (free kathryn slot2)
    (free kathryn slot3)
    (free kathryn slot5)
    (free kathryn slot7)
    (free kathryn slot8)
    (free kathryn slot9)
    (free kathryn slot12)
    (free kathryn slot13)
    (free kathryn slot14)
    (free kathryn slot15)

    ; charlotte busy: slot7, slot15
    ; charlotte free:
    (free charlotte slot1)
    (free charlotte slot2)
    (free charlotte slot3)
    (free charlotte slot4)
    (free charlotte slot5)
    (free charlotte slot6)
    (free charlotte slot8)
    (free charlotte slot9)
    (free charlotte slot10)
    (free charlotte slot11)
    (free charlotte slot12)
    (free charlotte slot13)
    (free charlotte slot14)
    (free charlotte slot16)

    ; lauren busy: slot1, slot2, slot7, slot10, slot11, slot13, slot14, slot16
    ; lauren free:
    (free lauren slot3)
    (free lauren slot4)
    (free lauren slot5)
    (free lauren slot6)
    (free lauren slot8)
    (free lauren slot9)
    (free lauren slot12)
    (free lauren slot15)

    ; Charlotte preference: do not start after 13:30
    ; allow starts at or before 13:30 -> slots 1..10 (slot10 starts at 13:30)
    (allowed_for_charlotte slot1)
    (allowed_for_charlotte slot2)
    (allowed_for_charlotte slot3)
    (allowed_for_charlotte slot4)
    (allowed_for_charlotte slot5)
    (allowed_for_charlotte slot6)
    (allowed_for_charlotte slot7)
    (allowed_for_charlotte slot8)
    (allowed_for_charlotte slot9)
    (allowed_for_charlotte slot10)
  )

  (:goal (meeting-scheduled))
)