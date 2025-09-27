(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    alice daniel scott lori cynthia jeffrey hannah - person
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - timeslot
  )
  (:init
    (free alice slot1) (free alice slot2) (free alice slot3) (free alice slot4)
    (free alice slot5) (free alice slot6) (free alice slot7) (free alice slot8)
    (free alice slot9) (free alice slot10) (free alice slot11) (free alice slot12)
    (free alice slot13) (free alice slot14) (free alice slot15) (free alice slot16)

    (free daniel slot1) (free daniel slot2) (free daniel slot4) (free daniel slot5)
    (free daniel slot6) (free daniel slot7) (free daniel slot8) (free daniel slot9)
    (free daniel slot10) (free daniel slot11) (free daniel slot12) (free daniel slot15)

    (free scott slot3) (free scott slot4) (free scott slot5) (free scott slot6)
    (free scott slot9) (free scott slot10) (free scott slot12) (free scott slot13)
    (free scott slot14) (free scott slot16)

    (free lori slot1) (free lori slot2) (free lori slot3) (free lori slot4)
    (free lori slot5) (free lori slot6) (free lori slot7) (free lori slot9)
    (free lori slot10) (free lori slot11) (free lori slot12) (free lori slot13)
    (free lori slot14) (free lori slot16)

    (free cynthia slot2) (free cynthia slot3) (free cynthia slot4) (free cynthia slot6)
    (free cynthia slot9) (free cynthia slot12) (free cynthia slot13) (free cynthia slot16)

    (free jeffrey slot6) (free jeffrey slot15)

    (free hannah slot5) (free hannah slot6) (free hannah slot8)
    (free hannah slot13) (free hannah slot14) (free hannah slot15)
  )
  (:goal (meeting_scheduled))
)