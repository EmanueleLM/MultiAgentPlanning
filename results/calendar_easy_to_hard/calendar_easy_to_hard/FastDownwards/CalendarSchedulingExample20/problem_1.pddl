(define (problem integrated-schedule-meeting-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
    peter daniel ralph - participant
  )

  (:init
    (slot slot1) (slot slot2) (slot slot3) (slot slot4)
    (slot slot5) (slot slot6) (slot slot7) (slot slot8)
    (slot slot9) (slot slot10) (slot slot11) (slot slot12)
    (slot slot13) (slot slot14) (slot slot15) (slot slot16)

    (participant peter) (participant daniel) (participant ralph)

    (unscheduled)

    (busy ralph slot10)
    (busy ralph slot12)

    (busy daniel slot1)
    (busy daniel slot2)
    (busy daniel slot4)
    (busy daniel slot5)
    (busy daniel slot6)
    (busy daniel slot7)
    (busy daniel slot8)
    (busy daniel slot9)
    (busy daniel slot10)
    (busy daniel slot11)
    (busy daniel slot12)
    (busy daniel slot13)
    (busy daniel slot15)
    (busy daniel slot16)

    (free peter slot2) (free peter slot3) (free peter slot4)
    (free peter slot9) (free peter slot10) (free peter slot11)
    (free peter slot12) (free peter slot13) (free peter slot14)
    (free peter slot16)

    (busy peter slot1) (busy peter slot5) (busy peter slot6) (busy peter slot7) (busy peter slot8) (busy peter slot15)

    (free ralph slot1) (free ralph slot2) (free ralph slot3) (free ralph slot4)
    (free ralph slot5) (free ralph slot6) (free ralph slot7) (free ralph slot8)
    (free ralph slot9) (free ralph slot10) (free ralph slot11) (free ralph slot12)
    (free ralph slot13) (free ralph slot14) (free ralph slot15) (free ralph slot16)

    (free daniel slot1) (free daniel slot2) (free daniel slot3) (free daniel slot4)
    (free daniel slot5) (free daniel slot6) (free daniel slot7) (free daniel slot8)
    (free daniel slot9) (free daniel slot10) (free daniel slot11) (free daniel slot12)
    (free daniel slot13) (free daniel slot14) (free daniel slot15) (free daniel slot16)

    (early slot1) (early slot2) (early slot3) (early slot4) (early slot5)
    (early slot6) (early slot7) (early slot8) (early slot9)
  )

  (:goal (and
           (scheduled)
           (meeting-with peter)
           (meeting-with ralph)
           (meeting-with daniel)
           (or
             (meeting-at slot1) (meeting-at slot2) (meeting-at slot3) (meeting-at slot4)
             (meeting-at slot5) (meeting-at slot6) (meeting-at slot7) (meeting-at slot8)
             (meeting-at slot9) (meeting-at slot10) (meeting-at slot11) (meeting-at slot12)
             (meeting-at slot13) (meeting-at slot14) (meeting-at slot15) (meeting-at slot16)
           )
         )
  )