(define (problem integrated-schedule-meeting-monday)
  (:domain integrated-meeting-scheduling)

  ;; Unified slot naming: slot1..slot16 represent 30-minute intervals:
  ;; slot1 = 09:00-09:30, slot2 = 09:30-10:00, ..., slot16 = 16:30-17:00
  (:objects
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot

    peter daniel ralph - participant
  )

  (:init
    ;; slots exist
    (slot slot1) (slot slot2) (slot slot3) (slot slot4)
    (slot slot5) (slot slot6) (slot slot7) (slot slot8)
    (slot slot9) (slot slot10) (slot slot11) (slot slot12)
    (slot slot13) (slot slot14) (slot slot15) (slot slot16)

    ;; participants
    (participant peter) (participant daniel) (participant ralph)

    ;; Global scheduling flag
    (unscheduled)

    ;; Occupancy: none initially
    ;; (occupied ...) none in init

    ;; === Busy / Free facts combined from the three agents ===
    ;; Agent 1: Ralph busy on slot10 (13:30-14:00) and slot12 (14:30-15:00)
    (busy ralph slot10)
    (busy ralph slot12)

    ;; Agent 3: Daniel busy on many slots (as provided); mapping s1..s16 -> slot1..slot16
    ;; daniel busy: s1, s2, s4 .. s13, s15, s16
    (busy daniel slot1)  ;; s1: 09:00-09:30
    (busy daniel slot2)  ;; s2: 09:30-10:00
    (busy daniel slot4)  ;; s4: 10:30-11:00
    (busy daniel slot5)  ;; s5: 11:00-11:30
    (busy daniel slot6)  ;; s6: 11:30-12:00
    (busy daniel slot7)  ;; s7: 12:00-12:30
    (busy daniel slot8)  ;; s8: 12:30-13:00
    (busy daniel slot9)  ;; s9: 13:00-13:30
    (busy daniel slot10) ;; s10: 13:30-14:00
    (busy daniel slot11) ;; s11: 14:00-14:30
    (busy daniel slot12) ;; s12: 14:30-15:00
    (busy daniel slot13) ;; s13: 15:00-15:30
    (busy daniel slot15) ;; s15: 16:00-16:30
    (busy daniel slot16) ;; s16: 16:30-17:00

    ;; Agent 2: declared explicit free facts.
    ;; Peter's stated free slots (from agent2): s09_30,s10_00,s10_30,s13_00,s13_30,s14_00,s14_30,s15_00,s15_30,s16_30
    ;; Map these to slot2,slot3,slot4,slot9,slot10,slot11,slot12,slot13,slot14,slot16
    (free peter slot2) (free peter slot3) (free peter slot4)
    (free peter slot9) (free peter slot10) (free peter slot11)
    (free peter slot12) (free peter slot13) (free peter slot14)
    (free peter slot16)

    ;; To capture the interpretation that Peter is busy on other slots, add busy facts for those not listed free:
    (busy peter slot1) (busy peter slot5) (busy peter slot6) (busy peter slot7) (busy peter slot8) (busy peter slot15)

    ;; Agent 2: Ralph and Daniel were modeled free on all slots by agent2.
    ;; Add free facts for ralph and daniel for all slots (the integrated model also
    ;; contains 'busy' facts for some slots for daniel from agent3; those busy facts
    ;; will be respected by actions that check (not (busy ...)).
    (free ralph slot1) (free ralph slot2) (free ralph slot3) (free ralph slot4)
    (free ralph slot5) (free ralph slot6) (free ralph slot7) (free ralph slot8)
    (free ralph slot9) (free ralph slot10) (free ralph slot11) (free ralph slot12)
    (free ralph slot13) (free ralph slot14) (free ralph slot15) (free ralph slot16)

    (free daniel slot1) (free daniel slot2) (free daniel slot3) (free daniel slot4)
    (free daniel slot5) (free daniel slot6) (free daniel slot7) (free daniel slot8)
    (free daniel slot9) (free daniel slot10) (free daniel slot11) (free daniel slot12)
    (free daniel slot13) (free daniel slot14) (free daniel slot15) (free daniel slot16)

    ;; Note: For slots where both (free ...) and (busy ...) facts exist (e.g. daniel),
    ;; the integrated scheduling actions check (not (busy ...)) to ensure busy constraints
    ;; are respected and prevent scheduling in those slots.

    ;; === Preference / Early markers from Agent 3 ===
    ;; early slots are s1..s9 => slot1..slot9 (prefer meetings starting before 13:30)
    (early slot1) (early slot2) (early slot3) (early slot4) (early slot5)
    (early slot6) (early slot7) (early slot8) (early slot9)

    ;; Agent 1: Ralph busy facts already included above; no explicit preferences provided.

    ;; Cost initialization (agent3)
    (= (total-cost) 0)
  )

  ;; Goal: find a single 30-minute meeting slot within business hours that satisfies all participants
  ;; We require that a meeting be scheduled, at some slot, and that all three participants are marked
  ;; as meeting-with participants (ensures integration of the different agent semantics).
  (:goal (and
           (scheduled)
           ;; meeting-with all participants
           (meeting-with peter)
           (meeting-with ralph)
           (meeting-with daniel)
           ;; the meeting-at predicate must point to some slot (disjunction)
           (or
             (meeting-at slot1) (meeting-at slot2) (meeting-at slot3) (meeting-at slot4)
             (meeting-at slot5) (meeting-at slot6) (meeting-at slot7) (meeting-at slot8)
             (meeting-at slot9) (meeting-at slot10) (meeting-at slot11) (meeting-at slot12)
             (meeting-at slot13) (meeting-at slot14) (meeting-at slot15) (meeting-at slot16)
           )
         )
  )

  ;; Minimize the total-cost so that early slots (preferred by agent3) are chosen when possible.
  (:metric minimize (total-cost))
)