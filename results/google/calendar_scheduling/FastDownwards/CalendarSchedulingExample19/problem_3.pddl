(define (problem schedule-monday-30m)
  (:domain meeting-scheduling)
  (:objects
    marie janice elijah theresa - person
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )
  (:init
    (person marie) (person janice) (person elijah) (person theresa)
    (slot slot1) (slot slot2) (slot slot3) (slot slot4) (slot slot5) (slot slot6) (slot slot7) (slot slot8)
    (slot slot9) (slot slot10) (slot slot11) (slot slot12) (slot slot13) (slot slot14) (slot slot15) (slot slot16)
    (= (total-cost) 0)

    ; Marie busy: 11:00-11:30 (slot5), 15:00-16:30 (slots13,14,15)
    (unavailable marie slot5)
    (unavailable marie slot13)
    (unavailable marie slot14)
    (unavailable marie slot15)

    ; Janice busy: 12:30-13:00 (slot8), 13:30-15:00 (slots10,11,12)
    (unavailable janice slot8)
    (unavailable janice slot10)
    (unavailable janice slot11)
    (unavailable janice slot12)

    ; Elijah busy: 10:00-13:00 (slots3,4,5,6,7,8), 14:30-15:00 (slot12), 16:00-16:30 (slot15)
    (unavailable elijah slot3)
    (unavailable elijah slot4)
    (unavailable elijah slot5)
    (unavailable elijah slot6)
    (unavailable elijah slot7)
    (unavailable elijah slot8)
    (unavailable elijah slot12)
    (unavailable elijah slot15)

    ; Theresa busy and preference: busy 09:30-10:30 (slots2,3), busy 12:00-13:00 etc.
    ; Preference "Do not meet after 12:00" -> mark all slots starting at or after 12:00 (slot7 onward) unavailable
    (unavailable theresa slot2)
    (unavailable theresa slot3)
    (unavailable theresa slot7)
    (unavailable theresa slot8)
    (unavailable theresa slot9)
    (unavailable theresa slot10)
    (unavailable theresa slot11)
    (unavailable theresa slot12)
    (unavailable theresa slot13)
    (unavailable theresa slot14)
    (unavailable theresa slot15)
    (unavailable theresa slot16)
  )
  (:goal (scheduled))
  (:metric minimize (total-cost))
)