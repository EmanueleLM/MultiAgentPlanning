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

  (:goal
    (or
      (and (next slot0 slot1) (meeting slot0 slot1) (meeting_michelle slot0) (meeting_steven slot0) (meeting_jerry slot0))
      (and (next slot1 slot2) (meeting slot1 slot2) (meeting_michelle slot1) (meeting_steven slot1) (meeting_jerry slot1))
      (and (next slot2 slot3) (meeting slot2 slot3) (meeting_michelle slot2) (meeting_steven slot2) (meeting_jerry slot2))
      (and (next slot3 slot4) (meeting slot3 slot4) (meeting_michelle slot3) (meeting_steven slot3) (meeting_jerry slot3))
      (and (next slot4 slot5) (meeting slot4 slot5) (meeting_michelle slot4) (meeting_steven slot4) (meeting_jerry slot4))
      (and (next slot5 slot6) (meeting slot5 slot6) (meeting_michelle slot5) (meeting_steven slot5) (meeting_jerry slot5))
      (and (next slot6 slot7) (meeting slot6 slot7) (meeting_michelle slot6) (meeting_steven slot6) (meeting_jerry slot6))
      (and (next slot7 slot8) (meeting slot7 slot8) (meeting_michelle slot7) (meeting_steven slot7) (meeting_jerry slot7))
      (and (next slot8 slot9) (meeting slot8 slot9) (meeting_michelle slot8) (meeting_steven slot8) (meeting_jerry slot8))
      (and (next slot9 slot10) (meeting slot9 slot10) (meeting_michelle slot9) (meeting_steven slot9) (meeting_jerry slot9))
      (and (next slot10 slot11) (meeting slot10 slot11) (meeting_michelle slot10) (meeting_steven slot10) (meeting_jerry slot10))
      (and (next slot11 slot12) (meeting slot11 slot12) (meeting_michelle slot11) (meeting_steven slot11) (meeting_jerry slot11))
      (and (next slot12 slot13) (meeting slot12 slot13) (meeting_michelle slot12) (meeting_steven slot12) (meeting_jerry slot12))
      (and (next slot13 slot14) (meeting slot13 slot14) (meeting_michelle slot13) (meeting_steven slot13) (meeting_jerry slot13))
      (and (next slot14 slot15) (meeting slot14 slot15) (meeting_michelle slot14) (meeting_steven slot14) (meeting_jerry slot14))
    )
  )
)