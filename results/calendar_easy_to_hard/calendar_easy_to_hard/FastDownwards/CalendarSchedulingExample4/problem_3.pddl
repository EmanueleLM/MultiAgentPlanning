(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    slot9_00  slot9_30  slot10_00 slot10_30 slot11_00 slot11_30
    slot12_00 slot12_30 slot13_00 slot13_30 slot14_00 slot14_30
    slot15_00 slot15_30 slot16_00 slot16_30 - slot
  )

  (:init
    (within-work-hours slot9_00)  (within-work-hours slot9_30)
    (within-work-hours slot10_00) (within-work-hours slot10_30)
    (within-work-hours slot11_00) (within-work-hours slot11_30)
    (within-work-hours slot12_00) (within-work-hours slot12_30)
    (within-work-hours slot13_00) (within-work-hours slot13_30)
    (within-work-hours slot14_00) (within-work-hours slot14_30)
    (within-work-hours slot15_00) (within-work-hours slot15_30)
    (within-work-hours slot16_00) (within-work-hours slot16_30)

    (free_a1 slot9_00)  (free_a1 slot9_30)
    (free_a1 slot10_00) (free_a1 slot10_30)
    (free_a1 slot11_00) (free_a1 slot11_30)
    (free_a1 slot12_00) (free_a1 slot12_30)
    (free_a1 slot13_00) (free_a1 slot13_30)
    (free_a1 slot14_30)
    (free_a1 slot15_00)
    (free_a1 slot16_00) (free_a1 slot16_30)

    (free_a2 slot9_00)  (free_a2 slot9_30)
    (free_a2 slot10_00) (free_a2 slot10_30)
    (free_a2 slot11_30) (free_a2 slot12_00) (free_a2 slot12_30)
    (free_a2 slot13_00) (free_a2 slot13_30)
    (free_a2 slot14_00) (free_a2 slot14_30)
    (free_a2 slot15_00) (free_a2 slot15_30)
    (free_a2 slot16_00)

    (free_a3 slot10_00)
    (free_a3 slot14_00)

    (= (total-cost) 0)
  )

  (:goal (meeting_scheduled_any))

  (:metric minimize (total-cost))
)