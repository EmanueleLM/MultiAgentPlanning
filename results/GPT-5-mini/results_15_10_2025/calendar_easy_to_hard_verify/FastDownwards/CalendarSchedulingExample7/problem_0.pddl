(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Objects: 3 participants and 16 half-hour slots covering 09:00-17:00
  (:objects
    heather nicholas zachary - participant
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )

  (:init
    ;; Participant and slot declarations
    (participant heather)
    (participant nicholas)
    (participant zachary)

    (slot slot1)  ;; 09:00-09:30
    (slot slot2)  ;; 09:30-10:00
    (slot slot3)  ;; 10:00-10:30
    (slot slot4)  ;; 10:30-11:00
    (slot slot5)  ;; 11:00-11:30
    (slot slot6)  ;; 11:30-12:00
    (slot slot7)  ;; 12:00-12:30
    (slot slot8)  ;; 12:30-13:00
    (slot slot9)  ;; 13:00-13:30
    (slot slot10) ;; 13:30-14:00
    (slot slot11) ;; 14:00-14:30
    (slot slot12) ;; 14:30-15:00
    (slot slot13) ;; 15:00-15:30
    (slot slot14) ;; 15:30-16:00
    (slot slot15) ;; 16:00-16:30
    (slot slot16) ;; 16:30-17:00

    ;; Availability facts derived from inputs (every busy interval is treated as unavailable).
    ;; Nicholas: fully available during work hours (09:00-17:00)
    (available nicholas slot1) (available nicholas slot2) (available nicholas slot3)
    (available nicholas slot4) (available nicholas slot5) (available nicholas slot6)
    (available nicholas slot7) (available nicholas slot8) (available nicholas slot9)
    (available nicholas slot10) (available nicholas slot11) (available nicholas slot12)
    (available nicholas slot13) (available nicholas slot14) (available nicholas slot15)
    (available nicholas slot16)

    ;; Heather: unavailable at 09:00-09:30(slot1),10:30-11:00(slot4),13:00-14:00(slot9,slot10),14:30-15:00(slot12),16:00-16:30(slot15).
    ;; Therefore available at the other slots:
    (available heather slot2) (available heather slot3)
    (available heather slot5) (available heather slot6)
    (available heather slot7) (available heather slot8)
    (available heather slot11) (available heather slot13)
    (available heather slot14) (available heather slot16)

    ;; Zachary: unavailable at 09:00-10:30(slot1,slot2,slot3),11:00-12:00(slot5,slot6),
    ;;            12:30-13:00(slot8),13:30-16:30(slot10,slot11,slot12,slot13,slot14,slot15).
    ;; Also has a hard preference (treated as hard) to avoid meetings after 14:00 -> disallow slots starting >=14:00.
    ;; Given the busy intervals and preference, Zachary is available only at:
    ;; slot4 (10:30-11:00), slot7 (12:00-12:30), slot9 (13:00-13:30).
    (available zachary slot4) (available zachary slot7) (available zachary slot9)
  )

  ;; Goal: a meeting scheduled (30-minute slot assigned) within work hours that fits all constraints.
  (:goal (and (meeting-scheduled)))
)