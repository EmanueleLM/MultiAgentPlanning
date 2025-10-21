(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )

  (:init
    ;; Work hours slots correspond to:
    ;; slot1: 09:00-09:30
    ;; slot2: 09:30-10:00
    ;; slot3: 10:00-10:30
    ;; slot4: 10:30-11:00
    ;; slot5: 11:00-11:30
    ;; slot6: 11:30-12:00
    ;; slot7: 12:00-12:30
    ;; slot8: 12:30-13:00
    ;; slot9: 13:00-13:30
    ;; slot10:13:30-14:00
    ;; slot11:14:00-14:30
    ;; slot12:14:30-15:00
    ;; slot13:15:00-15:30
    ;; slot14:15:30-16:00
    ;; slot15:16:00-16:30
    ;; slot16:16:30-17:00

    ;; Jesse: busy 10:00-10:30 (slot3), busy 15:30-16:00 (slot14)
    ;; Therefore Jesse free at all other slots:
    (free jesse slot1)
    (free jesse slot2)
    (free jesse slot4)
    (free jesse slot5)
    (free jesse slot6)
    (free jesse slot7)
    (free jesse slot8)
    (free jesse slot9)
    (free jesse slot10)
    (free jesse slot11)
    (free jesse slot12)
    (free jesse slot13)
    (free jesse slot15)
    (free jesse slot16)

    ;; Kathryn: no busy slots (free all work slots)
    (free kathryn slot1)
    (free kathryn slot2)
    (free kathryn slot3)
    (free kathryn slot4)
    (free kathryn slot5)
    (free kathryn slot6)
    (free kathryn slot7)
    (free kathryn slot8)
    (free kathryn slot9)
    (free kathryn slot10)
    (free kathryn slot11)
    (free kathryn slot12)
    (free kathryn slot13)
    (free kathryn slot14)
    (free kathryn slot15)
    (free kathryn slot16)

    ;; Megan: busy 10:30-11:00 (slot4), 11:30-12:30 (slot6 & slot7),
    ;; 13:30-14:30 (slot10 & slot11), 15:00-16:30 (slot13, slot14, slot15)
    ;; Therefore Megan free at: 1,2,3,5,8,9,12,16
    (free megan slot1)
    (free megan slot2)
    (free megan slot3)
    (free megan slot5)
    (free megan slot8)
    (free megan slot9)
    (free megan slot12)
    (free megan slot16)

    ;; Orchestrator has no private busy slots (free all)
    (free orchestrator slot1)
    (free orchestrator slot2)
    (free orchestrator slot3)
    (free orchestrator slot4)
    (free orchestrator slot5)
    (free orchestrator slot6)
    (free orchestrator slot7)
    (free orchestrator slot8)
    (free orchestrator slot9)
    (free orchestrator slot10)
    (free orchestrator slot11)
    (free orchestrator slot12)
    (free orchestrator slot13)
    (free orchestrator slot14)
    (free orchestrator slot15)
    (free orchestrator slot16)

    ;; Precomputed allfree slots where jesse, kathryn and megan are all free:
    ;; Intersection = {slot1, slot2, slot5, slot8, slot9, slot12, slot16}
    (allfree slot1)
    (allfree slot2)
    (allfree slot5)
    (allfree slot8)
    (allfree slot9)
    (allfree slot12)
    (allfree slot16)
  )

  (:goal (meeting-scheduled))
)