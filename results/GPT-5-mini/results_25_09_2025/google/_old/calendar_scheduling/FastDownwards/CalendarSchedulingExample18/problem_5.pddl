(define (problem orchestrate-schedule-monday)
  (:domain orchestrated-meeting)

  (:objects
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7
    slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - slot
    brian billy patricia - person
    meeting1 - meeting
  )

  (:init
    (free slot0) (free slot1) (free slot2) (free slot3)
    (free slot4) (free slot5) (free slot6) (free slot7)
    (free slot8) (free slot9) (free slot10) (free slot11)
    (free slot12) (free slot13) (free slot14) (free slot15)

    (busy billy slot2)
    (busy billy slot5)
    (busy billy slot10)
    (busy billy slot15)

    (busy patricia slot0) (busy patricia slot1) (busy patricia slot2)
    (busy patricia slot3) (busy patricia slot4) (busy patricia slot5) (busy patricia slot6)
    (busy patricia slot9)
    (busy patricia slot11) (busy patricia slot12) (busy patricia slot13)
    (busy patricia slot15)

    (late slot13) (late slot14) (late slot15)

    (attendee meeting1 brian)
    (attendee meeting1 billy)
    (attendee meeting1 patricia)
    (unscheduled meeting1)
  )

  (:goal (and
           (meeting-scheduled)
           (meeting-with brian)
           (meeting-with billy)
           (meeting-with patricia)
         ))
)