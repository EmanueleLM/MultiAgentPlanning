(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    heather nicholas zachary - participant
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )
  (:init
    (available nicholas slot1) (available nicholas slot2) (available nicholas slot3)
    (available nicholas slot4) (available nicholas slot5) (available nicholas slot6)
    (available nicholas slot7) (available nicholas slot8) (available nicholas slot9)
    (available nicholas slot10) (available nicholas slot11) (available nicholas slot12)
    (available nicholas slot13) (available nicholas slot14) (available nicholas slot15)
    (available nicholas slot16)

    (available heather slot2) (available heather slot3)
    (available heather slot5) (available heather slot6)
    (available heather slot7) (available heather slot8)
    (available heather slot11) (available heather slot13)
    (available heather slot14) (available heather slot16)

    (available zachary slot4) (available zachary slot7) (available zachary slot9)
  )
  (:goal (and (meeting-scheduled)))
)