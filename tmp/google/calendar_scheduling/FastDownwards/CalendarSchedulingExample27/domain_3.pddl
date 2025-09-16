(define (domain integrated-meeting-domain)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (free_A1_p1 ?s - slot)
    (free_A1_p2 ?s - slot)
    (slot_free ?s - slot)
    (available_A2_alice ?s - slot)
    (available_A2_bob ?s - slot)
    (free_A3_p1 ?s - slot)
    (free_A3_p2 ?s - slot)
    (joint_meeting_slot ?s - slot)
  )

  (:constants
     p1_A p2_A - person
     alice bob - person
     p1_C p2_C - person

     s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:action schedule_meeting_at_s0900
     :parameters ()
     :precondition (and
        (free_A1_p1 s0900)
        (free_A1_p2 s0900)
        (slot_free s0900)
        (available_A2_alice s0900)
        (available_A2_bob s0900)
        (free_A3_p1 s0900)
        (free_A3_p2 s0900)
        (not (joint_meeting_slot s0900))
     )
     :effect (joint_meeting_slot s0900)
  )
)