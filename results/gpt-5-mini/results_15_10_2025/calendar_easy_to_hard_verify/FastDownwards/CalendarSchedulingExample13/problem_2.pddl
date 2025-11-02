(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )

  (:init
    (free diane slot1) (free diane slot3) (free diane slot4) (free diane slot5)
    (free diane slot6) (free diane slot7) (free diane slot8) (free diane slot9)
    (free diane slot10) (free diane slot11) (free diane slot13) (free diane slot14)
    (free diane slot15) (free diane slot16)

    (free jack slot1) (free jack slot2) (free jack slot3) (free jack slot4)
    (free jack slot5) (free jack slot6) (free jack slot7) (free jack slot8)
    (free jack slot9) (free jack slot11) (free jack slot13) (free jack slot14)
    (free jack slot15) (free jack slot16)

    (free eugene slot3) (free eugene slot6) (free eugene slot12) (free eugene slot16)

    (free patricia slot1) (free patricia slot4) (free patricia slot7)
    (free patricia slot11) (free patricia slot12) (free patricia slot16)
  )

  (:goal (meeting-scheduled slot16))
)