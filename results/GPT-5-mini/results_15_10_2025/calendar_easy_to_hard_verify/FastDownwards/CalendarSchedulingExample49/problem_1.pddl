(define (problem schedule-monday)
  (:domain schedule-meeting)
  (:objects
    alan mason dennis theresa brenda juan angela - participant
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - slot
  )
  (:init
    (free-slot slot0) (free-slot slot1) (free-slot slot2) (free-slot slot3)
    (free-slot slot4) (free-slot slot5) (free-slot slot6) (free-slot slot7)
    (free-slot slot8) (free-slot slot9) (free-slot slot10) (free-slot slot11)
    (free-slot slot12) (free-slot slot13) (free-slot slot14) (free-slot slot15)

    (available alan slot1) (available alan slot4) (available alan slot6) (available alan slot7)
    (available alan slot8) (available alan slot9) (available alan slot10) (available alan slot11)
    (available alan slot12) (available alan slot13) (available alan slot14) (available alan slot15)

    (available mason slot0) (available mason slot1) (available mason slot2) (available mason slot3)
    (available mason slot4) (available mason slot5) (available mason slot6) (available mason slot7)
    (available mason slot8) (available mason slot10)

    (available dennis slot1) (available dennis slot2) (available dennis slot3) (available dennis slot4)
    (available dennis slot5) (available dennis slot6) (available dennis slot7) (available dennis slot8)
    (available dennis slot9) (available dennis slot10) (available dennis slot12) (available dennis slot13)
    (available dennis slot14) (available dennis slot15)

    (available theresa slot0) (available theresa slot1) (available theresa slot2) (available theresa slot3)
    (available theresa slot4) (available theresa slot5) (available theresa slot6) (available theresa slot7)
    (available theresa slot8) (available theresa slot9) (available theresa slot10) (available theresa slot11)
    (available theresa slot12) (available theresa slot13) (available theresa slot14) (available theresa slot15)

    (available brenda slot0) (available brenda slot1) (available brenda slot2) (available brenda slot4)
    (available brenda slot5) (available brenda slot9) (available brenda slot10) (available brenda slot13)

    (available juan slot0) (available juan slot2) (available juan slot4) (available juan slot8)
    (available juan slot9) (available juan slot10) (available juan slot12) (available juan slot13)

    (available angela slot2) (available angela slot4) (available angela slot6) (available angela slot7)
    (available angela slot10) (available angela slot11) (available angela slot13) (available angela slot14)
  )
  (:goal
    (and
      (meeting-scheduled slot4)
      (attends alan slot4)
      (attends mason slot4)
      (attends dennis slot4)
      (attends theresa slot4)
      (attends brenda slot4)
      (attends juan slot4)
      (attends angela slot4)
    )
  )
)