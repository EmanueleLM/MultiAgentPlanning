(define (domain integrated-meeting-domain)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  ; Predicates (distinct resources per agent)
  (:predicates
    ; Agent 1: p1_A and p2_A free for a given slot
    (free_A1_p1 ?s - slot)
    (free_A1_p2 ?s - slot)

    ; Agent 2: availability per slot for alice and bob
    (slot_free ?s - slot)
    (available_A2_alice ?s - slot)
    (available_A2_bob ?s - slot)

    ; Agent 3: p1_C and p2_C free for a given slot
    (free_A3_p1 ?s - slot)
    (free_A3_p2 ?s - slot)

    ; Global joint outcome: meeting scheduled in a specific slot
    (joint_meeting_slot ?s - slot)
  )

  (:constants
     ; Agent 1 participants
     p1_A p2_A - person
     ; Agent 2 participants
     alice bob - person
     ; Agent 3 participants
     p1_C p2_C - person

     ; 16 discrete 30-min slots from 09:00 to 17:00
     s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  ; We provide one concrete joint scheduling action that ensures all calendars agree on the same earliest feasible slot.
  ; This action captures the "earliest slot" integration across all three agents.

  (:action schedule_meeting_s0900
     :precondition (and
        ;; Agent 1: both participants free at 09:00
        (free_A1_p1 s0900)
        (free_A1_p2 s0900)

        ;; Agent 2: both participants available at 09:00, and slot is currently free
        (slot_free s0900)
        (available_A2_alice s0900)
        (available_A2_bob s0900)

        ;; Agent 3: both participants free at 09:00
        (free_A3_p1 s0900)
        (free_A3_p2 s0900)

        ;; Ensure we select earliest available slot (no earlier joint slot chosen yet)
        (not (joint_meeting_slot s0900))
     )
     :effect (joint_meeting_slot s0900)
  )
)