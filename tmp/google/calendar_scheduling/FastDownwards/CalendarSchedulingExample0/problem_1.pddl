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
    (exists (?s ?n - halfslot)
      (and
        (next ?s ?n)
        (meeting ?s ?n)
        (meeting-michelle ?s)
        (meeting-steven ?s)
        (meeting-jerry ?s)
      )
    )
  )
)