(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)

  ;; 30-minute start slots from 09:00 to 16:30
  (:objects
    slot9_00  slot9_30  slot10_00 slot10_30 slot11_00 slot11_30
    slot12_00 slot12_30 slot13_00 slot13_30 slot14_00 slot14_30
    slot15_00 slot15_30 slot16_00 slot16_30 - slot
  )

  (:init
    ;; Agent 1 provided: all these are within Monday 09:00-17:00
    (within-work-hours slot9_00)  (within-work-hours slot9_30)
    (within-work-hours slot10_00) (within-work-hours slot10_30)
    (within-work-hours slot11_00) (within-work-hours slot11_30)
    (within-work-hours slot12_00) (within-work-hours slot12_30)
    (within-work-hours slot13_00) (within-work-hours slot13_30)
    (within-work-hours slot14_00) (within-work-hours slot14_30)
    (within-work-hours slot15_00) (within-work-hours slot15_30)
    (within-work-hours slot16_00) (within-work-hours slot16_30)

    ;; Agent 1's known free slots (agent1 busy: 14:00 and 15:30)
    (free_a1 slot9_00)  (free_a1 slot9_30)
    (free_a1 slot10_00) (free_a1 slot10_30)
    (free_a1 slot11_00) (free_a1 slot11_30)
    (free_a1 slot12_00) (free_a1 slot12_30)
    (free_a1 slot13_00) (free_a1 slot13_30)
    ;; slot14_00 is busy for agent1 -> not free_a1
    (free_a1 slot14_30)
    (free_a1 slot15_00)
    ;; slot15_30 is busy for agent1 -> not free_a1
    (free_a1 slot16_00) (free_a1 slot16_30)

    ;; Agent 2's available slots (agent2 busy: 11:00 and 16:30)
    (free_a2 slot9_00)  (free_a2 slot9_30)
    (free_a2 slot10_00) (free_a2 slot10_30)
    ;; slot11_00 busy for agent2 -> not free_a2
    (free_a2 slot11_30) (free_a2 slot12_00) (free_a2 slot12_30)
    (free_a2 slot13_00) (free_a2 slot13_30)
    (free_a2 slot14_00) (free_a2 slot14_30)
    (free_a2 slot15_00) (free_a2 slot15_30)
    (free_a2 slot16_00)
    ;; slot16_30 busy for agent2 -> not free_a2

    ;; Agent 3's known free slots (agent3 reported only 10:00 and 14:00 free)
    (free_a3 slot10_00)
    (free_a3 slot14_00)
  )

  ;; Goal: schedule the meeting at any slot such that all agents have it scheduled.
  ;; We express it as a disjunction over all possible start slots.
  (:goal (or
    (meeting_scheduled slot9_00)  (meeting_scheduled slot9_30)
    (meeting_scheduled slot10_00) (meeting_scheduled slot10_30)
    (meeting_scheduled slot11_00) (meeting_scheduled slot11_30)
    (meeting_scheduled slot12_00) (meeting_scheduled slot12_30)
    (meeting_scheduled slot13_00) (meeting_scheduled slot13_30)
    (meeting_scheduled slot14_00) (meeting_scheduled slot14_30)
    (meeting_scheduled slot15_00) (meeting_scheduled slot15_30)
    (meeting_scheduled slot16_00) (meeting_scheduled slot16_30)
  ))
)