(define (problem schedule-meeting-monday)
  (:domain multiagent-scheduling)
  (:objects
    anthony pamela zachary - person
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - slot
  )

  (:init
    ;; successor relations (30-minute steps from 09:00..17:00)
    (next slot0 slot1) (next slot1 slot2) (next slot2 slot3) (next slot3 slot4)
    (next slot4 slot5) (next slot5 slot6) (next slot6 slot7) (next slot7 slot8)
    (next slot8 slot9) (next slot9 slot10) (next slot10 slot11) (next slot11 slot12)
    (next slot12 slot13) (next slot13 slot14) (next slot14 slot15)

    ;; Pamela's allowed meeting start slots (preference: meeting must end by 14:30 -> latest start slot9)
    (start_allowed slot0) (start_allowed slot1) (start_allowed slot2)
    (start_allowed slot3) (start_allowed slot4) (start_allowed slot5)
    (start_allowed slot6) (start_allowed slot7) (start_allowed slot8)
    (start_allowed slot9)

    ;; Known frees (encode only facts we know from the three agents' provided data)
    ;; Anthony's free slots (from first input; busy at slot1, slot6&7, slot14)
    (free anthony slot0) (free anthony slot2) (free anthony slot3)
    (free anthony slot4) (free anthony slot5) (free anthony slot8)
    (free anthony slot9) (free anthony slot10) (free anthony slot11)
    (free anthony slot12) (free anthony slot13) (free anthony slot15)

    ;; Pamela's free slots (from second input; busy at slot1 and slot15)
    (free pamela slot0) (free pamela slot2) (free pamela slot3)
    (free pamela slot4) (free pamela slot5) (free pamela slot6)
    (free pamela slot7) (free pamela slot8) (free pamela slot9)
    (free pamela slot10) (free pamela slot11) (free pamela slot12)
    (free pamela slot13) (free pamela slot14)

    ;; Zachary's known free slots (from third input)
    (free zachary slot5) (free zachary slot7)
    (free zachary slot9) (free zachary slot10)
    (free zachary slot12) (free zachary slot13)

    ;; meeting initially unscheduled
    (unscheduled)
  )

  ;; Goal: meeting scheduled (the start slot will be chosen by the planner)
  (:goal (meeting-scheduled))
)