(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling-multiagent)

  ; Time slots are 30-minute slots from 09:00 to 17:00 (slot1 = 09:00-09:30 ... slot16 = 16:30-17:00)
  (:objects
    heather nicholas zachary - person
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )

  (:init
    ; --- Nicholas: no private blocks (available all work slots) ---
    (available nicholas slot1)  (available nicholas slot2)  (available nicholas slot3)
    (available nicholas slot4)  (available nicholas slot5)  (available nicholas slot6)
    (available nicholas slot7)  (available nicholas slot8)  (available nicholas slot9)
    (available nicholas slot10) (available nicholas slot11) (available nicholas slot12)
    (available nicholas slot13) (available nicholas slot14) (available nicholas slot15)
    (available nicholas slot16)

    ; --- Heather: private blocks ---
    ; Heather blocks: 09:00-09:30 (slot1), 10:30-11:00 (slot4),
    ;                  13:00-14:00 (slot9 & slot10), 14:30-15:00 (slot12), 16:00-16:30 (slot15)
    ; Therefore Heather available on the remaining slots:
    (available heather slot2)  (available heather slot3)
    (available heather slot5)  (available heather slot6)
    (available heather slot7)  (available heather slot8)
    (available heather slot11) (available heather slot13)
    (available heather slot14) (available heather slot16)

    ; --- Zachary: private blocks and a stated preference ---
    ; Zachary blocks: 09:00-10:30 (slot1,2,3), 11:00-12:00 (slot5,6),
    ;                 12:30-13:00 (slot8), 13:30-16:30 (slot10..slot15)
    ; Thus Zachary is available at slot4 (10:30-11:00), slot7 (12:00-12:30), slot9 (13:00-13:30), and slot16 (16:30-17:00).
    (available zachary slot4)  (available zachary slot7)
    (available zachary slot9)  (available zachary slot16)

    ; Preference: Zachary would rather not meet after 14:00 (encoded as a soft annotation).
    ; Note: this preference is informational and not enforced as a hard constraint here.
    (preferred zachary slot7)
    (preferred zachary slot9)

    ; Public shared facts (implicit in objects/slots): meeting duration = 30 minutes (one slot),
    ; work hours 09:00-17:00 are represented by slots 1..16.
  )

  ; Goal: schedule the 30-minute meeting on Monday between Heather, Nicholas and Zachary.
  (:goal (meeting-scheduled))
)