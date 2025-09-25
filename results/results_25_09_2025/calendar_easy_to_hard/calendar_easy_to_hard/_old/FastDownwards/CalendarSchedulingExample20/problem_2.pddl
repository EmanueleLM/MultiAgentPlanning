(define (problem integrated-schedule-meeting-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
    peter daniel ralph - participant
  )

  (:init
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

    (busy peter slot1)
    (busy peter slot5)
    (busy peter slot6)
    (busy peter slot7)
    (busy peter slot8)
    (busy peter slot15)

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