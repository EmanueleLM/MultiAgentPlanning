(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    david debra kevin - participant
    timeslot-09 timeslot-10 timeslot-11 timeslot-12 timeslot-13 timeslot-14 timeslot-15 timeslot-16 - hour
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
    t9 t10 t11 t12 t13 t14 t15 t16 - time
    meeting1 - meeting
  )

  (:init
    (agent1_free david timeslot-09) (agent1_free david timeslot-10) (agent1_free david timeslot-11) (agent1_free david timeslot-12)
    (agent1_free david timeslot-13) (agent1_free david timeslot-14) (agent1_free david timeslot-15) (agent1_free david timeslot-16)

    (agent1_free debra timeslot-09) (agent1_free debra timeslot-10) (agent1_free debra timeslot-11) (agent1_free debra timeslot-12)
    (agent1_free debra timeslot-13) (agent1_free debra timeslot-14) (agent1_free debra timeslot-15) (agent1_free debra timeslot-16)

    (agent1_free kevin timeslot-09) (agent1_free kevin timeslot-10) (agent1_free kevin timeslot-11) (agent1_free kevin timeslot-12)
    (agent1_free kevin timeslot-13) (agent1_free kevin timeslot-14) (agent1_free kevin timeslot-15) (agent1_free kevin timeslot-16)

    (agent2_free debra slot1)
    (agent2_free debra slot3) (agent2_free debra slot4)
    (agent2_free debra slot6)
    (agent2_free debra slot9) (agent2_free debra slot10)
    (agent2_free debra slot12) (agent2_free debra slot13) (agent2_free debra slot14) (agent2_free debra slot16)

    (next slot1 slot2) (next slot2 slot3) (next slot3 slot4) (next slot4 slot5)
    (next slot5 slot6) (next slot6 slot7) (next slot7 slot8) (next slot8 slot9)
    (next slot9 slot10) (next slot10 slot11) (next slot11 slot12) (next slot12 slot13)
    (next slot13 slot14) (next slot14 slot15) (next slot15 slot16)

    (agent3_available kevin t9) (agent3_available kevin t10) (agent3_available kevin t11)
    (agent3_available kevin t14) (agent3_available kevin t15) (agent3_available kevin t16)

    (unscheduled meeting1)

    (hour_slots timeslot-09 slot1 slot2) (hour_time timeslot-09 t9)
    (hour_slots timeslot-10 slot3 slot4) (hour_time timeslot-10 t10)
    (hour_slots timeslot-11 slot5 slot6) (hour_time timeslot-11 t11)
    (hour_slots timeslot-12 slot7 slot8) (hour_time timeslot-12 t12)
    (hour_slots timeslot-13 slot9 slot10) (hour_time timeslot-13 t13)
    (hour_slots timeslot-14 slot11 slot12) (hour_time timeslot-14 t14)
    (hour_slots timeslot-15 slot13 slot14) (hour_time timeslot-15 t15)
    (hour_slots timeslot-16 slot15 slot16) (hour_time timeslot-16 t16)

    (unified_free david timeslot-09) (unified_free david timeslot-10) (unified_free david timeslot-11) (unified_free david timeslot-12)
    (unified_free david timeslot-13) (unified_free david timeslot-14) (unified_free david timeslot-15) (unified_free david timeslot-16)

    (unified_free debra timeslot-10) (unified_free debra timeslot-13) (unified_free debra timeslot-15)

    (unified_free kevin timeslot-09) (unified_free kevin timeslot-10) (unified_free kevin timeslot-11)
    (unified_free kevin timeslot-14) (unified_free kevin timeslot-15) (unified_free kevin timeslot-16)
  )

  (:goal (meeting_planned))
)