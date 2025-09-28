(define (problem schedule-single-30min-monday)
  (:domain meeting-scheduling)
  (:objects
    peter judith keith evelyn - person
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )

  ; Time slots mapping (30-minute granularity):
  ; slot1 = 09:00-09:30, slot2 = 09:30-10:00, slot3 = 10:00-10:30, slot4 = 10:30-11:00
  ; slot5 = 11:00-11:30, slot6 = 11:30-12:00, slot7 = 12:00-12:30, slot8 = 12:30-13:00
  ; slot9 = 13:00-13:30, slot10 = 13:30-14:00, slot11 = 14:00-14:30, slot12 = 14:30-15:00
  ; slot13 = 15:00-15:30, slot14 = 15:30-16:00, slot15 = 16:00-16:30, slot16 = 16:30-17:00

  (:init
    ; unscheduled initially true
    (unscheduled)

    ; peter's free slots (unavailable: 09:00-09:30 slot1, 10:30-11:00 slot4, 11:30-12:00 slot6, 12:30-13:00 slot8)
    (free peter slot2) (free peter slot3) (free peter slot5) (free peter slot7)
    (free peter slot9) (free peter slot10) (free peter slot11) (free peter slot12)
    (free peter slot13) (free peter slot14) (free peter slot15) (free peter slot16)

    ; judith's free slots (calendar wide open)
    (free judith slot1) (free judith slot2) (free judith slot3) (free judith slot4)
    (free judith slot5) (free judith slot6) (free judith slot7) (free judith slot8)
    (free judith slot9) (free judith slot10) (free judith slot11) (free judith slot12)
    (free judith slot13) (free judith slot14) (free judith slot15) (free judith slot16)

    ; keith's free slots (unavailable: 11:30-12:00 slot6, 12:30-15:00 slots8-12, 15:30-16:00 slot14, 16:30-17:00 slot16)
    (free keith slot1) (free keith slot2) (free keith slot3) (free keith slot4) (free keith slot5)
    (free keith slot7) (free keith slot13) (free keith slot15)

    ; evelyn's free slots (unavailable: 09:00-12:30 slots1-7, 13:30-15:30 slots10-13, 16:30-17:00 slot16)
    (free evelyn slot8) (free evelyn slot9) (free evelyn slot14) (free evelyn slot15)
  )

  ; Goal: schedule the single 30-minute meeting so all participants are available.
  ; Earliest feasible common slot (given all hard constraints) is slot15 (16:00-16:30).
  (:goal (meeting-at slot15))
)