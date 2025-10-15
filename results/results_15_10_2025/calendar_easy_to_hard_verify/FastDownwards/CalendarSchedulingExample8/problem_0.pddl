(define (problem schedule-30min-monday)
  (:domain meeting-scheduling)
  (:objects
    adam jerry matthew - person
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )

  ;; Initial state: only free facts are asserted. Busy slots (from participants'
  ;; calendars) are omitted, interpreted as unavailable.
  ;; Time slots mapping (30-min granularity between 09:00-17:00):
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

  (:init
    ;; adam's free slots (adam busy: slot3, slot8, slot10, slot11)
    (free adam slot1)
    (free adam slot2)
    (free adam slot4)
    (free adam slot5)
    (free adam slot6)
    (free adam slot7)
    (free adam slot9)
    (free adam slot12)
    (free adam slot13)
    (free adam slot14)
    (free adam slot15)
    (free adam slot16)

    ;; jerry's free slots (jerry busy: slot1, slot7, slot13, slot14)
    (free jerry slot2)
    (free jerry slot3)
    (free jerry slot4)
    (free jerry slot5)
    (free jerry slot6)
    (free jerry slot8)
    (free jerry slot9)
    (free jerry slot10)
    (free jerry slot11)
    (free jerry slot12)
    (free jerry slot15)
    (free jerry slot16)

    ;; matthew's free slots (matthew busy: slot2,slot3,slot4,slot6,slot7,slot9,slot10,slot12,slot13,slot14,slot15,slot16)
    (free matthew slot1)
    (free matthew slot5)
    (free matthew slot8)
    (free matthew slot11)
  )

  ;; Goal: schedule one meeting slot that is free for all participants.
  ;; Metric: prefer lower-cost (earlier) slots. Fast Downward will minimize total-cost.
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)