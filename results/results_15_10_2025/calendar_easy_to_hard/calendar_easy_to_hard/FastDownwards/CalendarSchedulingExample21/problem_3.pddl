(define (problem schedule-meeting-mon)
  (:domain schedule-meeting)
  (:objects
    sara sarah shirley harold terry - participant
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - slot
  )
  (:init
    ;; sara: free all slots
    (free sara slot0) (free sara slot1) (free sara slot2) (free sara slot3)
    (free sara slot4) (free sara slot5) (free sara slot6) (free sara slot7)
    (free sara slot8) (free sara slot9) (free sara slot10) (free sara slot11)
    (free sara slot12) (free sara slot13) (free sara slot14) (free sara slot15)

    ;; sarah: busy slot6 (12:00-12:30) and slot12 (15:00-15:30)
    (free sarah slot0) (free sarah slot1) (free sarah slot2) (free sarah slot3)
    (free sarah slot4) (free sarah slot5) (free sarah slot7) (free sarah slot8)
    (free sarah slot9) (free sarah slot10) (free sarah slot11) (free sarah slot13)
    (free sarah slot14) (free sarah slot15)

    ;; shirley: busy slot9 (13:30-14:00) and slot11 (14:30-15:00)
    (free shirley slot0) (free shirley slot1) (free shirley slot2) (free shirley slot3)
    (free shirley slot4) (free shirley slot5) (free shirley slot6) (free shirley slot7)
    (free shirley slot8) (free shirley slot10) (free shirley slot12) (free shirley slot13)
    (free shirley slot14) (free shirley slot15)

    ;; harold: free only slot2 (10:00-10:30) and slot7 (12:30-13:00)
    (free harold slot2) (free harold slot7)

    ;; terry: free only slot2 (10:00-10:30) and slot5 (11:30-12:00)
    (free terry slot2) (free terry slot5)

    ;; each participant initially uncommitted
    (uncommitted-sara) (uncommitted-sarah) (uncommitted-shirley) (uncommitted-harold) (uncommitted-terry)
  )
  (:goal (and (scheduled) (meeting-at slot2)))
)