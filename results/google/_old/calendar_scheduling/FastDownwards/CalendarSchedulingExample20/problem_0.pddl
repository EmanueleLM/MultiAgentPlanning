(define (problem schedule-meeting-monday-orchestrated)
  (:domain orchestrated-scheduling)

  (:objects
    ;; 30-minute slots from Monday 09:00 to 17:00 (16 slots)
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot

    ralph peter daniel - person
  )

  (:init
    ;; mark slots
    (slot slot1) (slot slot2) (slot slot3) (slot slot4)
    (slot slot5) (slot slot6) (slot slot7) (slot slot8)
    (slot slot9) (slot slot10) (slot slot11) (slot slot12)
    (slot slot13) (slot slot14) (slot slot15) (slot slot16)

    ;; initial meeting state
    (unscheduled)
    (= (total-cost) 0)

    ;; -------------------------
    ;; Agent 1 (Ralph) knowledge
    ;; Agent 1 modeled slots as 09:00..16:30. Ralph is busy at 13:30 and 14:30.
    ;; Mapping of slots:
    ;; slot1 = 09:00, slot2 = 09:30, slot3 = 10:00, slot4 = 10:30,
    ;; slot5 = 11:00, slot6 = 11:30, slot7 = 12:00, slot8 = 12:30,
    ;; slot9 = 13:00, slot10 = 13:30, slot11 = 14:00, slot12 = 14:30,
    ;; slot13 = 15:00, slot14 = 15:30, slot15 = 16:00, slot16 = 16:30.
    ;; Ralph busy at 13:30 (slot10) and 14:30 (slot12) -> those not marked free.
    (ralph_free slot1) (ralph_free slot2) (ralph_free slot3) (ralph_free slot4)
    (ralph_free slot5) (ralph_free slot6) (ralph_free slot7) (ralph_free slot8)
    (ralph_free slot9)                     ; not slot10
    (ralph_free slot11)                    ; not slot12
    (ralph_free slot13) (ralph_free slot14) (ralph_free slot15) (ralph_free slot16)

    ;; -------------------------
    ;; Agent 2 (Peter) knowledge
    ;; Peter is busy at:
    ;; - 09:00-09:30 => slot1
    ;; - 11:00-13:00 => slot5, slot6, slot7, slot8
    ;; - 16:00-16:30 => slot15
    ;; Peter marked free on the other slots (as provided by agent 2).
    (peter_free slot2)  ; 09:30-10:00
    (peter_free slot3)  ; 10:00-10:30
    (peter_free slot4)  ; 10:30-11:00
    (peter_free slot9)  ; 13:00-13:30
    (peter_free slot10) ; 13:30-14:00
    (peter_free slot11) ; 14:00-14:30
    (peter_free slot12) ; 14:30-15:00
    (peter_free slot13) ; 15:00-15:30
    (peter_free slot14) ; 15:30-16:00
    (peter_free slot16) ; 16:30-17:00

    ;; -------------------------
    ;; Agent 3 (Daniel) knowledge and preference
    ;; Daniel's availability (from his model):
    ;; Allowed start times: 10:00 (slot3) and 15:30 (slot14)
    (daniel_available slot3)
    (daniel_available slot14)

    ;; Daniel's preference: avoid slots starting at or after 13:30 (slot10 and later).
    ;; Mark those as undesirable.
    (daniel_undesirable slot10) (daniel_undesirable slot11)
    (daniel_undesirable slot12) (daniel_undesirable slot13)
    (daniel_undesirable slot14) (daniel_undesirable slot15)
    (daniel_undesirable slot16)
  )

  ;; Goal: a meeting has been scheduled. Minimize Daniel's penalty (total-cost).
  (:goal (meeting_scheduled))
  (:metric minimize (total-cost))
)