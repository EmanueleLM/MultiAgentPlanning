(define (problem orchestrate-schedule-monday)
  (:domain orchestrated-meeting)

  (:objects
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7
    slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - slot

    brian billy patricia - person

    meeting1 - meeting
  )

  (:init
    ;; Agent 1 availability (Brian)
    (avail_a1 brian slot0) (avail_a1 brian slot1) (avail_a1 brian slot2) (avail_a1 brian slot3)
    (avail_a1 brian slot4) (avail_a1 brian slot5) (avail_a1 brian slot6) (avail_a1 brian slot7)
    (avail_a1 brian slot8) (avail_a1 brian slot9) (avail_a1 brian slot10) (avail_a1 brian slot11)
    (avail_a1 brian slot12) (avail_a1 brian slot13) (avail_a1 brian slot14) (avail_a1 brian slot15)

    ;; Agent 2 view: all slots initially free
    (free_a2 slot0) (free_a2 slot1) (free_a2 slot2) (free_a2 slot3)
    (free_a2 slot4) (free_a2 slot5) (free_a2 slot6) (free_a2 slot7)
    (free_a2 slot8) (free_a2 slot9) (free_a2 slot10) (free_a2 slot11)
    (free_a2 slot12) (free_a2 slot13) (free_a2 slot14) (free_a2 slot15)

    ;; Agent 2 busy facts for Billy
    (busy_a2 billy slot2)
    (busy_a2 billy slot5)
    (busy_a2 billy slot10)
    (busy_a2 billy slot15)

    ;; Agent 2 attendees and unscheduled flag
    (attendee_a2 meeting1 billy)
    (attendee_a2 meeting1 brian)
    (attendee_a2 meeting1 patricia)
    (unscheduled_a2 meeting1)

    ;; Late slots from agent2 preference
    (late slot13) (late slot14) (late slot15)

    ;; Agent 3 availability (Patricia)
    (avail_a3 patricia slot7)
    (avail_a3 patricia slot8)
    (avail_a3 patricia slot10)
    (avail_a3 patricia slot14)
  )

  (:goal (and
           (meeting-scheduled)
           (meeting-with brian)
           (meeting-with billy)
           (meeting-with patricia)
         ))

  (:metric minimize (total-cost))
)