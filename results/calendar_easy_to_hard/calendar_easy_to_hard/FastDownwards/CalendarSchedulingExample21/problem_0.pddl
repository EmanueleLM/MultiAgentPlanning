(define (problem schedule-meeting-mon)
  (:domain schedule-meeting)
  (:objects
    sara sarah shirley harold terry - participant
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - slot
  )

  ; Initial availability derived from given busy intervals (slots represent 30-min meeting start times):
  ; slot0=09:00, slot1=09:30, slot2=10:00, slot3=10:30, slot4=11:00, slot5=11:30,
  ; slot6=12:00, slot7=12:30, slot8=13:00, slot9=13:30, slot10=14:00, slot11=14:30,
  ; slot12=15:00, slot13=15:30, slot14=16:00, slot15=16:30

  (:init
    ; Sara: no meetings between 09:00 and 17:00 -> all slots free
    (free sara slot0) (free sara slot1) (free sara slot2) (free sara slot3)
    (free sara slot4) (free sara slot5) (free sara slot6) (free sara slot7)
    (free sara slot8) (free sara slot9) (free sara slot10) (free sara slot11)
    (free sara slot12) (free sara slot13) (free sara slot14) (free sara slot15)

    ; Sarah: busy 12:00-12:30 (blocks slot6), 15:00-15:30 (blocks slot12)
    (free sarah slot0) (free sarah slot1) (free sarah slot2) (free sarah slot3)
    (free sarah slot4) (free sarah slot5)              (free sarah slot7)
    (free sarah slot8) (free sarah slot9) (free sarah slot10) (free sarah slot11)
    (free sarah slot13) (free sarah slot14) (free sarah slot15)

    ; Shirley: busy 13:30-14:00 (blocks slot9), 14:30-15:00 (blocks slot11)
    (free shirley slot0) (free shirley slot1) (free shirley slot2) (free shirley slot3)
    (free shirley slot4) (free shirley slot5) (free shirley slot6) (free shirley slot7)
    (free shirley slot8)              (free shirley slot10) (free shirley slot12)
    (free shirley slot13) (free shirley slot14) (free shirley slot15)

    ; Harold: busy 09:00-10:00 (blocks slot0,slot1), 10:30-12:30 (blocks slot3,4,5,6), 13:00-17:00 (blocks slot8..slot15)
    ; Therefore Harold is free only at slot2 (10:00) and slot7 (12:30)
    (free harold slot2) (free harold slot7)

    ; Terry: busy 09:00-10:00 (blocks slot0,slot1), 10:30-11:30 (blocks slot3,slot4), 12:00-17:00 (blocks slot6..slot15)
    ; Therefore Terry is free at slot2 (10:00) and slot5 (11:30)
    (free terry slot2) (free terry slot5)
  )

  ; Hard preference: choose the earliest feasible 30-min slot that fits all participants.
  ; The earliest common free slot computed from the provided busy intervals is slot2 (10:00).
  (:goal (and
    (scheduled)
    (meeting-at slot2)
  ))
)