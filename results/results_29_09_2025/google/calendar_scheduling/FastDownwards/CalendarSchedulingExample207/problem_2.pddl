(define (problem calendar-scheduling-problem)
  (:domain calendar-scheduling)
  (:objects
    walter danielle julia samuel lori - person
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )
  (:init
    (free walter slot1) (free walter slot2) (free walter slot3) (free walter slot4)
    (free walter slot5) (free walter slot6) (free walter slot7) (free walter slot8)
    (free walter slot9) (free walter slot10) (free walter slot11) (free walter slot12)
    (free walter slot13) (free walter slot14) (free walter slot15) (free walter slot16)
    (free danielle slot1) (free danielle slot2) (free danielle slot3) (free danielle slot4)
    (free danielle slot5) (free danielle slot6) (free danielle slot7) (free danielle slot8)
    (free danielle slot9) (free danielle slot10) (free danielle slot11) (free danielle slot12)
    (free danielle slot13) (free danielle slot14) (free danielle slot15) (free danielle slot16)
    (free julia slot1) (free julia slot3) (free julia slot5) (free julia slot6)
    (free julia slot7) (free julia slot8) (free julia slot9) (free julia slot11)
    (free julia slot12) (free julia slot13) (free julia slot14) (free julia slot16)
    (free samuel slot5) (free samuel slot8) (free samuel slot12) (free samuel slot14)
    (free lori slot1) (free lori slot2) (free lori slot4) (free lori slot6)
    (free lori slot8) (free lori slot12)
    (earliest-allowed slot8)
  )
  (:goal (meeting-scheduled))
)