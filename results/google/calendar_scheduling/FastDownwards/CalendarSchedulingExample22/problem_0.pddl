(define (problem schedule-monday-60min)
  (:domain meeting-scheduling)
  (:objects
    theresa charles betty - agent
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )

  (:init
    ;; consecutive 30-minute slots from 09:00-09:30 .. 16:30-17:00
    (next slot1 slot2)  ;; 09:00-09:30 -> 09:30-10:00
    (next slot2 slot3)
    (next slot3 slot4)
    (next slot4 slot5)
    (next slot5 slot6)
    (next slot6 slot7)
    (next slot7 slot8)
    (next slot8 slot9)
    (next slot9 slot10)
    (next slot10 slot11)
    (next slot11 slot12)
    (next slot12 slot13)
    (next slot13 slot14)
    (next slot14 slot15)
    (next slot15 slot16) ;; last consecutive pair ends at slot16

    ;; Free slots for each agent (explicit from their private schedules).
    ;; Theresa busy: slot1, slot8, slot9, slot11, slot12, slot16
    ;; => Theresa free: 2,3,4,5,6,7,10,13,14,15
    (free theresa slot2)
    (free theresa slot3)
    (free theresa slot4)
    (free theresa slot5)
    (free theresa slot6)
    (free theresa slot7)
    (free theresa slot10)
    (free theresa slot13)
    (free theresa slot14)
    (free theresa slot15)

    ;; Charles busy: slot3, slot6, slot7, slot11, slot12, slot13
    ;; => Charles free: 1,2,4,5,8,9,10,14,15,16
    (free charles slot1)
    (free charles slot2)
    (free charles slot4)
    (free charles slot5)
    (free charles slot8)
    (free charles slot9)
    (free charles slot10)
    (free charles slot14)
    (free charles slot15)
    (free charles slot16)

    ;; Betty busy: slot1, slot2, slot3, slot7, slot9, slot10, slot13, slot14
    ;; => Betty free: 4,5,6,8,11,12,15,16
    (free betty slot4)
    (free betty slot5)
    (free betty slot6)
    (free betty slot8)
    (free betty slot11)
    (free betty slot12)
    (free betty slot15)
    (free betty slot16)
  )

  ;; Goal: schedule a 60-minute meeting (two consecutive 30-min slots) that everyone can attend.
  ;; From integrating all agents' availability, the feasible common consecutive pair is:
  ;; start at slot4 (10:30-11:00) and slot5 (11:00-11:30) => meeting from 10:30 to 11:30.
  (:goal (meeting-scheduled slot4))
)