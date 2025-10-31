(define (problem schedule-monday-30m)
  (:domain meeting-scheduling)
  (:objects
    marie janice elijah theresa - person
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )
  (:init
    (= (total-cost) 0)

    (unavailable marie slot5)
    (unavailable marie slot13)
    (unavailable marie slot14)
    (unavailable marie slot15)

    (unavailable janice slot8)
    (unavailable janice slot10)
    (unavailable janice slot11)
    (unavailable janice slot12)

    (unavailable elijah slot3)
    (unavailable elijah slot4)
    (unavailable elijah slot5)
    (unavailable elijah slot6)
    (unavailable elijah slot7)
    (unavailable elijah slot8)
    (unavailable elijah slot12)
    (unavailable elijah slot15)

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