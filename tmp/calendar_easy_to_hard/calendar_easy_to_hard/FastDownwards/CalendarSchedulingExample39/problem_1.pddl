(define (problem schedule-meeting-monday-integrated)
  (:domain meeting-scheduling-integrated)
  (:objects
    nicholas emma catherine steven adam lori - participant
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
    meeting1 - meeting
  )
  (:init
    (free nicholas slot1)  (free nicholas slot2)  (free nicholas slot3)  (free nicholas slot4)
    (free nicholas slot5)  (free nicholas slot6)  (free nicholas slot7)  (free nicholas slot8)
    (free nicholas slot9)  (free nicholas slot10) (free nicholas slot11) (free nicholas slot12)
    (free nicholas slot13) (free nicholas slot14) (free nicholas slot15) (free nicholas slot16)

    (free emma slot1)  (free emma slot2)  (free emma slot3)  (free emma slot4)
    (free emma slot5)  (free emma slot6)  (free emma slot7)  (free emma slot8)
    (free emma slot9)  (free emma slot10) (free emma slot11) (free emma slot12)
    (free emma slot13) (free emma slot14) (free emma slot15) (free emma slot16)

    (free catherine slot2)  (free catherine slot3)  (free catherine slot4)
    (free catherine slot5)  (free catherine slot7)  (free catherine slot8)
    (free catherine slot9)  (free catherine slot11) (free catherine slot12)
    (free catherine slot13) (free catherine slot15) (free catherine slot16)

    (free steven slot2) (free steven slot16)

    (free adam slot3) (free adam slot9) (free adam slot11) (free adam slot16)

    (free lori slot6) (free lori slot7) (free lori slot10) (free lori slot11)
    (free lori slot12) (free lori slot13) (free lori slot14) (free lori slot16)
  )
  (:goal (and (scheduled meeting1 slot16)))
)