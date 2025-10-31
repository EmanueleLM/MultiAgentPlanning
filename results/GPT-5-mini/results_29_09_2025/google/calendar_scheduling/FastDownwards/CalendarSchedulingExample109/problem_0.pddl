(define (problem schedule-monday-30m)
  (:domain meeting-scheduling)
  (:objects
    Marie Janice Elijah Theresa - person
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )
  (:init
    ;; declare persons and slots
    (person Marie) (person Janice) (person Elijah) (person Theresa)
    (slot slot1) (slot slot2) (slot slot3) (slot slot4) (slot slot5) (slot slot6) (slot slot7) (slot slot8)
    (slot slot9) (slot slot10) (slot slot11) (slot slot12) (slot slot13) (slot slot14) (slot slot15) (slot slot16)

    ;; Slot mapping (30-minute slots from 09:00 to 17:00)
    ;; slot1 = 09:00-09:30, slot2 = 09:30-10:00, ..., slot16 = 16:30-17:00
    (= (index slot1) 1)  (= (index slot2) 2)  (= (index slot3) 3)  (= (index slot4) 4)
    (= (index slot5) 5)  (= (index slot6) 6)  (= (index slot7) 7)  (= (index slot8) 8)
    (= (index slot9) 9)  (= (index slot10) 10) (= (index slot11) 11) (= (index slot12) 12)
    (= (index slot13) 13)(= (index slot14) 14)(= (index slot15) 15)(= (index slot16) 16)

    ;; initial chosen value large (we will minimize this)
    (= (chosen) 100)

    ;; Participant busy/unavailable intervals (treated as hard constraints)
    ;; Marie: Busy 11:00-11:30 (slot5), 15:00-16:30 (slots13,14,15)
    (unavailable Marie slot5)
    (unavailable Marie slot13)
    (unavailable Marie slot14)
    (unavailable Marie slot15)

    ;; Janice: Busy 12:30-13:00 (slot8), 13:30-15:00 (slots10,11,12)
    (unavailable Janice slot8)
    (unavailable Janice slot10)
    (unavailable Janice slot11)
    (unavailable Janice slot12)

    ;; Elijah: Busy 10:00-13:00 (slots3,4,5,6,7,8), 14:30-15:00 (slot12), 16:00-16:30 (slot15)
    (unavailable Elijah slot3)
    (unavailable Elijah slot4)
    (unavailable Elijah slot5)
    (unavailable Elijah slot6)
    (unavailable Elijah slot7)
    (unavailable Elijah slot8)
    (unavailable Elijah slot12)
    (unavailable Elijah slot15)

    ;; Theresa: Busy 09:30-10:30 (slots2,3), 12:00-13:00 (slots7,8), 13:30-14:00 (slot10),
    ;; 14:30-15:00 (slot12), 15:30-16:00 (slot14), 16:30-17:00 (slot16)
    (unavailable Theresa slot2)
    (unavailable Theresa slot3)
    (unavailable Theresa slot7)
    (unavailable Theresa slot8)
    (unavailable Theresa slot10)
    (unavailable Theresa slot12)
    (unavailable Theresa slot14)
    (unavailable Theresa slot16)

    ;; Theresa's explicit hard preference: do not meet after 12:00 on Monday.
    ;; Enforce as hard unavailability for any slot that starts at or after 12:00
    ;; (i.e., disallow slots 7..16 for Theresa). Some of these are already declared busy above;
    ;; include all to enforce the preference strictly.
    (unavailable Theresa slot7)
    (unavailable Theresa slot8)
    (unavailable Theresa slot9)
    (unavailable Theresa slot10)
    (unavailable Theresa slot11)
    (unavailable Theresa slot12)
    (unavailable Theresa slot13)
    (unavailable Theresa slot14)
    (unavailable Theresa slot15)
    (unavailable Theresa slot16)
  )
  (:goal (scheduled))
  (:metric minimize (chosen))
)