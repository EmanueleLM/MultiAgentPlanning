(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    david debra kevin - participant
    ;; hour start tokens (one-hour meeting may start at any integer hour 09..16)
    timeslot-09 timeslot-10 timeslot-11 timeslot-12 timeslot-13 timeslot-14 timeslot-15 timeslot-16 - hour

    ;; half-hour slots covering 09:00-17:00 (slot1 = 09:00-09:30, slot2 = 09:30-10:00, ...)
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot

    ;; time tokens used by agent3 (t9..t16)
    t9 t10 t11 t12 t13 t14 t15 t16 - time

    meeting1 - meeting
  )

  (:init
    ;; -------------------------
    ;; Agent-1 knowledge (hour-granularity)
    ;; Agent-1 asserted that David, Debra, Kevin are free for every allowed start time 09..16.
    (agent1_free david timeslot-09) (agent1_free david timeslot-10) (agent1_free david timeslot-11) (agent1_free david timeslot-12)
    (agent1_free david timeslot-13) (agent1_free david timeslot-14) (agent1_free david timeslot-15) (agent1_free david timeslot-16)

    (agent1_free debra timeslot-09) (agent1_free debra timeslot-10) (agent1_free debra timeslot-11) (agent1_free debra timeslot-12)
    (agent1_free debra timeslot-13) (agent1_free debra timeslot-14) (agent1_free debra timeslot-15) (agent1_free debra timeslot-16)

    (agent1_free kevin timeslot-09) (agent1_free kevin timeslot-10) (agent1_free kevin timeslot-11) (agent1_free kevin timeslot-12)
    (agent1_free kevin timeslot-13) (agent1_free kevin timeslot-14) (agent1_free kevin timeslot-15) (agent1_free kevin timeslot-16)

    ;; -------------------------
    ;; Agent-2 knowledge (half-hour slots)
    ;; Agent-2 provided Debra's known free slots (other participants' slot-level availability was not provided).
    (agent2_free debra slot1)
    (agent2_free debra slot3) (agent2_free debra slot4)
    (agent2_free debra slot6)
    (agent2_free debra slot9) (agent2_free debra slot10)
    (agent2_free debra slot12) (agent2_free debra slot13) (agent2_free debra slot14) (agent2_free debra slot16)

    ;; next relations for consecutive half-hour slots (slot1 -> slot2 -> slot3 ...)
    (next slot1 slot2) (next slot2 slot3) (next slot3 slot4) (next slot4 slot5)
    (next slot5 slot6) (next slot6 slot7) (next slot7 slot8) (next slot8 slot9)
    (next slot9 slot10) (next slot10 slot11) (next slot11 slot12) (next slot12 slot13)
    (next slot13 slot14) (next slot14 slot15) (next slot15 slot16)

    ;; -------------------------
    ;; Agent-3 knowledge (time tokens)
    ;; Agent-3 provided Kevin's availability: 09:00-12:00 (t9,t10,t11) and 14:00-17:00 (t14,t15,t16).
    (agent3_available kevin t9) (agent3_available kevin t10) (agent3_available kevin t11)
    (agent3_available kevin t14) (agent3_available kevin t15) (agent3_available kevin t16)

    ;; Agent-3 did not assert availability for David or Debra (no facts for them at agent-3 level).

    ;; Agent-3 meeting object
    (unscheduled meeting1)

    ;; -------------------------
    ;; Mappings: hour -> half-hour slots and hour -> time token (t9..t16)
    ;; timeslot-09 => slot1 + slot2 => t9
    (hour_slots timeslot-09 slot1 slot2) (hour_time timeslot-09 t9)
    ;; timeslot-10 => slot3 + slot4 => t10
    (hour_slots timeslot-10 slot3 slot4) (hour_time timeslot-10 t10)
    ;; timeslot-11 => slot5 + slot6 => t11
    (hour_slots timeslot-11 slot5 slot6) (hour_time timeslot-11 t11)
    ;; timeslot-12 => slot7 + slot8 => t12
    (hour_slots timeslot-12 slot7 slot8) (hour_time timeslot-12 t12)
    ;; timeslot-13 => slot9 + slot10 => t13
    (hour_slots timeslot-13 slot9 slot10) (hour_time timeslot-13 t13)
    ;; timeslot-14 => slot11 + slot12 => t14
    (hour_slots timeslot-14 slot11 slot12) (hour_time timeslot-14 t14)
    ;; timeslot-15 => slot13 + slot14 => t15
    (hour_slots timeslot-15 slot13 slot14) (hour_time timeslot-15 t15)
    ;; timeslot-16 => slot15 + slot16 => t16
    (hour_slots timeslot-16 slot15 slot16) (hour_time timeslot-16 t16)

    ;; -------------------------
    ;; Integrated ("unified") availability computed from combining the three agents' known facts.
    ;; We treat "unspecified" availability at a given granularity as unknown; the unified availability
    ;; reflects hours where all known constraints allow attendance (i.e., intersections of known free slots).
    ;; Resulting unified_free facts (precomputed here):
    ;; David: agent1 asserted free for all hours, and no agent asserts a conflict -> David is unified-free at all hours.
    (unified_free david timeslot-09) (unified_free david timeslot-10) (unified_free david timeslot-11) (unified_free david timeslot-12)
    (unified_free david timeslot-13) (unified_free david timeslot-14) (unified_free david timeslot-15) (unified_free david timeslot-16)

    ;; Debra: agent2 (slot-level) implies Debra is free at hour-starts 10, 13, 15 only (both half-slots free there),
    ;; agent1 had Debra free everywhere (no conflict), agent3 has no info => unify to agent2-known free hours.
    (unified_free debra timeslot-10) (unified_free debra timeslot-13) (unified_free debra timeslot-15)

    ;; Kevin: agent1 had Kevin free everywhere, agent3 restricts Kevin to {09,10,11,14,15,16} -> unify to that set.
    (unified_free kevin timeslot-09) (unified_free kevin timeslot-10) (unified_free kevin timeslot-11)
    (unified_free kevin timeslot-14) (unified_free kevin timeslot-15) (unified_free kevin timeslot-16)
  )

  ;; Goal: any successful scheduling action (from any agent) sets meeting_planned.
  (:goal (meeting_planned))
)