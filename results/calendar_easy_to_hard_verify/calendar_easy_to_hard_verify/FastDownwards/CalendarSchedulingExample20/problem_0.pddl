(define (problem schedule-monday)
  (:domain meeting-scheduling)

  ;; Slot mapping (half-hour slots between 09:00 and 17:00):
  ;; slot1  = 09:00-09:30
  ;; slot2  = 09:30-10:00
  ;; slot3  = 10:00-10:30
  ;; slot4  = 10:30-11:00
  ;; slot5  = 11:00-11:30
  ;; slot6  = 11:30-12:00
  ;; slot7  = 12:00-12:30
  ;; slot8  = 12:30-13:00
  ;; slot9  = 13:00-13:30
  ;; slot10 = 13:30-14:00
  ;; slot11 = 14:00-14:30
  ;; slot12 = 14:30-15:00
  ;; slot13 = 15:00-15:30
  ;; slot14 = 15:30-16:00
  ;; slot15 = 16:00-16:30
  ;; slot16 = 16:30-17:00

  (:objects
    stephen elijah william jeremy timothy - agent
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )

  (:init
    ;; Availability is explicitly encoded (every busy interval from participants has been excluded).
    ;; Stephen: "I am free the entire day on Monday." => all slots available.
    (available stephen slot1) (available stephen slot2) (available stephen slot3)
    (available stephen slot4) (available stephen slot5) (available stephen slot6)
    (available stephen slot7) (available stephen slot8) (available stephen slot9)
    (available stephen slot10) (available stephen slot11) (available stephen slot12)
    (available stephen slot13) (available stephen slot14) (available stephen slot15)
    (available stephen slot16)

    ;; Elijah busy: slot1 (09:00-09:30), slot8 (12:30-13:00), slot12 (14:30-15:00), slot15 (16:00-16:30)
    ;; => available slots: 2,3,4,5,6,7,9,10,11,13,14,16
    (available elijah slot2) (available elijah slot3) (available elijah slot4)
    (available elijah slot5) (available elijah slot6) (available elijah slot7)
    (available elijah slot9) (available elijah slot10) (available elijah slot11)
    (available elijah slot13) (available elijah slot14) (available elijah slot16)

    ;; William busy: slot2 (09:30-10:00), slot14 (15:30-16:00)
    ;; => available slots: 1,3,4,5,6,7,8,9,10,11,12,13,15,16
    (available william slot1) (available william slot3) (available william slot4)
    (available william slot5) (available william slot6) (available william slot7)
    (available william slot8) (available william slot9) (available william slot10)
    (available william slot11) (available william slot12) (available william slot13)
    (available william slot15) (available william slot16)

    ;; Jeremy busy: slot1 (09:00-09:30), slots3-6 (10:00-12:00), slots9-12 (13:00-15:00), slots14-16 (15:30-17:00)
    ;; => available slots: 2,7,8,13
    (available jeremy slot2) (available jeremy slot7) (available jeremy slot8)
    (available jeremy slot13)

    ;; Timothy busy: slot3 (10:00-10:30), slots6-11 (11:30-14:30), slot14 (15:30-16:00)
    ;; => available slots: 1,2,4,5,12,13,15,16
    (available timothy slot1) (available timothy slot2) (available timothy slot4)
    (available timothy slot5) (available timothy slot12) (available timothy slot13)
    (available timothy slot15) (available timothy slot16)
  )

  ;; Goal: find any schedule action that sets (scheduled).
  (:goal (scheduled))
)