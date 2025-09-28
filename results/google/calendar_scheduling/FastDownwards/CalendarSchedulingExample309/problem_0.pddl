(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Discrete 30-minute start slots from 09:00 to 16:30 (slot0 = 09:00, slot1 = 09:30, ..., slot15 = 16:30)
  (:objects
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15
    nicholas emma catherine steven adam lori
  )

  (:init
    ;; Nicholas: free all work slots (09:00-17:00)
    (free nicholas slot0) (free nicholas slot1) (free nicholas slot2) (free nicholas slot3)
    (free nicholas slot4) (free nicholas slot5) (free nicholas slot6) (free nicholas slot7)
    (free nicholas slot8) (free nicholas slot9) (free nicholas slot10) (free nicholas slot11)
    (free nicholas slot12) (free nicholas slot13) (free nicholas slot14) (free nicholas slot15)

    ;; Emma: free all work slots (09:00-17:00)
    (free emma slot0) (free emma slot1) (free emma slot2) (free emma slot3)
    (free emma slot4) (free emma slot5) (free emma slot6) (free emma slot7)
    (free emma slot8) (free emma slot9) (free emma slot10) (free emma slot11)
    (free emma slot12) (free emma slot13) (free emma slot14) (free emma slot15)

    ;; Catherine: busy at 09:00-09:30 (slot0), 11:30-12:00 (slot5), 13:30-14:00 (slot9), 15:30-16:00 (slot13)
    ;; Therefore free at all other slots:
    (free catherine slot1) (free catherine slot2) (free catherine slot3) (free catherine slot4)
    (free catherine slot6) (free catherine slot7) (free catherine slot8) (free catherine slot10)
    (free catherine slot11) (free catherine slot12) (free catherine slot14) (free catherine slot15)

    ;; Steven: busy 09:00-09:30 (slot0) and 10:00-16:30 (overlaps slots 2..14)
    ;; Therefore free slots are slot1 (09:30) and slot15 (16:30)
    (free steven slot1) (free steven slot15)

    ;; Adam: busy 09:00-10:00 (slots 0,1), 10:30-13:00 (slots 3,4,5,6,7), 13:30-14:00 (slot9), 14:30-16:30 (slots 11,12,13,14)
    ;; Therefore free slots: 2 (10:00), 8 (13:00), 10 (14:00), 15 (16:30)
    (free adam slot2) (free adam slot8) (free adam slot10) (free adam slot15)

    ;; Lori: busy 09:00-11:30 (slots 0,1,2,3,4), 12:30-13:30 (slots 7,8), 16:00-16:30 (slot14)
    ;; Therefore free slots: 5,6,9,10,11,12,13,15
    (free lori slot5) (free lori slot6) (free lori slot9) (free lori slot10)
    (free lori slot11) (free lori slot12) (free lori slot13) (free lori slot15)
  )

  ;; Goal: a meeting has been scheduled (meeting-at will point to the chosen slot).
  ;; Given the encoded availabilities, the only slot satisfying all participants' free predicates is slot15 (16:30-17:00).
  (:goal (scheduled))
)