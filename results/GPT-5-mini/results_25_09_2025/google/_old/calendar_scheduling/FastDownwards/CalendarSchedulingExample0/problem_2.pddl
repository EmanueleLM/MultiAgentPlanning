(define (problem combined-schedule-monday)
  (:domain combined-meeting)
  (:objects
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7
    slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - halfslot
    michelle steven jerry - person
  )
  (:init
    (next slot0 slot1) (next slot1 slot2) (next slot2 slot3) (next slot3 slot4)
    (next slot4 slot5) (next slot5 slot6) (next slot6 slot7) (next slot7 slot8)
    (next slot8 slot9) (next slot9 slot10) (next slot10 slot11) (next slot11 slot12)
    (next slot12 slot13) (next slot13 slot14) (next slot14 slot15)

    (free michelle slot0) (free michelle slot1) (free michelle slot2) (free michelle slot3)
    (free michelle slot6) (free michelle slot7) (free michelle slot8) (free michelle slot9)
    (free michelle slot10) (free michelle slot11) (free michelle slot12) (free michelle slot13)
    (free michelle slot14) (free michelle slot15)

    (free steven slot1) (free steven slot2) (free steven slot3) (free steven slot4)
    (free steven slot6) (free steven slot7) (free steven slot8)
    (free steven slot10) (free steven slot11) (free steven slot12)
    (free steven slot14) (free steven slot15)

    (free jerry slot1) (free jerry slot4) (free jerry slot7)
    (free jerry slot11) (free jerry slot12) (free jerry slot14)
  )

  (:metric minimize (total-cost))

  (:goal
    (or
      (and (next slot0 slot1) (meeting slot0 slot1) (meeting-michelle slot0) (meeting-steven slot0) (meeting-jerry slot0))
      (and (next slot1 slot2) (meeting slot1 slot2) (meeting-michelle slot1) (meeting-steven slot1) (meeting-jerry slot1))
      (and (next slot2 slot3) (meeting slot2 slot3) (meeting-michelle slot2) (meeting-steven slot2) (meeting-jerry slot2))
      (and (next slot3 slot4) (meeting slot3 slot4) (meeting-michelle slot3) (meeting-steven slot3) (meeting-jerry slot3))
      (and (next slot4 slot5) (meeting slot4 slot5) (meeting-michelle slot4) (meeting-steven slot4) (meeting-jerry slot4))
      (and (next slot5 slot6) (meeting slot5 slot6) (meeting-michelle slot5) (meeting-steven slot5) (meeting-jerry slot5))
      (and (next slot6 slot7) (meeting slot6 slot7) (meeting-michelle slot6) (meeting-steven slot6) (meeting-jerry slot6))
      (and (next slot7 slot8) (meeting slot7 slot8) (meeting-michelle slot7) (meeting-steven slot7) (meeting-jerry slot7))
      (and (next slot8 slot9) (meeting slot8 slot9) (meeting-michelle slot8) (meeting-steven slot8) (meeting-jerry slot8))
      (and (next slot9 slot10) (meeting slot9 slot10) (meeting-michelle slot9) (meeting-steven slot9) (meeting-jerry slot9))
      (and (next slot10 slot11) (meeting slot10 slot11) (meeting-michelle slot10) (meeting-steven slot10) (meeting-jerry slot10))
      (and (next slot11 slot12) (meeting slot11 slot12) (meeting-michelle slot11) (meeting-steven slot11) (meeting-jerry slot11))
      (and (next slot12 slot13) (meeting slot12 slot13) (meeting-michelle slot12) (meeting-steven slot12) (meeting-jerry slot12))
      (and (next slot13 slot14) (meeting slot13 slot14) (meeting-michelle slot13) (meeting-steven slot13) (meeting-jerry slot13))
      (and (next slot14 slot15) (meeting slot14 slot15) (meeting-michelle slot14) (meeting-steven slot14) (meeting-jerry slot14))
    )
  )
)