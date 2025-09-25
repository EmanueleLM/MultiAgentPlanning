(define (problem combined-schedule-monday)
  (:domain combined-meeting)

  (:objects
    ;; half-hour slots slot0..slot15 correspond to 09:00-09:30 .. 16:30-17:00
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7
    slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - halfslot

    michelle steven jerry - person
  )

  (:init
    ;; adjacency of halfslots (30-minute sequence)
    (next slot0 slot1) (next slot1 slot2) (next slot2 slot3) (next slot3 slot4)
    (next slot4 slot5) (next slot5 slot6) (next slot6 slot7) (next slot7 slot8)
    (next slot8 slot9) (next slot9 slot10) (next slot10 slot11) (next slot11 slot12)
    (next slot12 slot13) (next slot13 slot14) (next slot14 slot15)

    ;; ---- Michelle's availability (originally given as 1-hour slots s9-10 ... s16-17)
    ;; Michelle was busy 11:00-12:00 (that corresponds to slot4 and slot5).
    ;; So Michelle is free in all other halfslots:
    (free michelle slot0) (free michelle slot1)
    (free michelle slot2) (free michelle slot3)
    ;; slot4 and slot5 are busy for Michelle (no free facts for them)
    (free michelle slot6) (free michelle slot7)
    (free michelle slot8) (free michelle slot9)
    (free michelle slot10) (free michelle slot11)
    (free michelle slot12) (free michelle slot13)
    (free michelle slot14) (free michelle slot15)

    ;; ---- Steven's availability (from his half-hour representation)
    ;; Steven busy: 9_00 (slot0), 11_30 (slot5), 13_30 (slot9), 15_30 (slot13)
    ;; Steven free in the listed halfslots in his problem:
    (free steven slot1) (free steven slot2) (free steven slot3) (free steven slot4)
    (free steven slot6) (free steven slot7) (free steven slot8)
    (free steven slot10) (free steven slot11) (free steven slot12)
    (free steven slot14) (free steven slot15)

    ;; ---- Jerry's availability (from his slot0..slot15 representation)
    ;; Jerry's free halfslots given in his problem:
    (free jerry slot1) (free jerry slot4) (free jerry slot7)
    (free jerry slot11) (free jerry slot12) (free jerry slot14)

    ;; No occupied slots initially
  )

  ;; Goal: find a pair of consecutive halfslots (?s ?n) such that each agent's scheduler
  ;; has scheduled the meeting starting at ?s. Requiring the three agent-specific
  ;; meeting predicates ensures each agent's constraints were respected for that time.
  (:goal
    (exists (?s ?n - halfslot)
      (and
        (next ?s ?n)
        (meeting-michelle ?s)
        (meeting-steven ?s)
        (meeting-jerry ?s)
      )
    )
  )
)