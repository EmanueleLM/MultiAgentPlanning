(define (problem schedule-meeting-monday-multi)
  (:domain multi_agent_scheduling)

  (:objects
    scott - person
    meeting1 - meeting
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; -------------------------
    ;; Agent 1 (Scott) knowledge
    ;; -------------------------
    ;; Declare agent-1 slots (slot universe for agent1)
    (a1_slot s09_00) (a1_slot s09_30) (a1_slot s10_00) (a1_slot s10_30)
    (a1_slot s11_00) (a1_slot s11_30) (a1_slot s12_00) (a1_slot s12_30)
    (a1_slot s13_00) (a1_slot s13_30) (a1_slot s14_00) (a1_slot s14_30)
    (a1_slot s15_00) (a1_slot s15_30) (a1_slot s16_00) (a1_slot s16_30)

    ;; Scott's known free slots (from agent1 information)
    (a1_free scott s09_00)
    (a1_free scott s10_30)
    (a1_free scott s11_00)
    (a1_free scott s11_30)
    (a1_free scott s12_00)
    (a1_free scott s12_30)
    (a1_free scott s13_00)
    (a1_free scott s14_00)
    (a1_free scott s15_00)
    (a1_free scott s16_00)

    ;; -------------------------
    ;; Agent 2 (Gabriel) knowledge
    ;; -------------------------
    ;; Work slots and slot-free facts for Gabriel (public: all work slots initially free)
    (g_work-slot s09_00) (g_slot-free s09_00)
    (g_work-slot s09_30) (g_slot-free s09_30)
    (g_work-slot s10_00) (g_slot-free s10_00)
    (g_work-slot s10_30) (g_slot-free s10_30)
    (g_work-slot s11_00) (g_slot-free s11_00)
    (g_work-slot s11_30) (g_slot-free s11_30)
    (g_work-slot s12_00) (g_slot-free s12_00)
    (g_work-slot s12_30) (g_slot-free s12_30)
    (g_work-slot s13_00) (g_slot-free s13_00)
    (g_work-slot s13_30) (g_slot-free s13_30)
    (g_work-slot s14_00) (g_slot-free s14_00)
    (g_work-slot s14_30) (g_slot-free s14_30)
    (g_work-slot s15_00) (g_slot-free s15_00)
    (g_work-slot s15_30) (g_slot-free s15_30)
    (g_work-slot s16_00) (g_slot-free s16_00)
    (g_work-slot s16_30) (g_slot-free s16_30)

    ;; Gabriel's public info
    (g_meeting-duration-30)
    (g_time-granularity-30)
    (g_exists-solution)

    ;; Gabriel's policy: no meetings on Monday (must be cleared by g_clear_no_meetings action)
    (g_no-meetings-monday)

    ;; -------------------------
    ;; Agent 3 (Christine) knowledge
    ;; -------------------------
    ;; Declare agent-3 slots and work slots
    (c_slot s09_00) (c_work-slot s09_00)
    (c_slot s09_30) (c_work-slot s09_30)
    (c_slot s10_00) (c_work-slot s10_00)
    (c_slot s10_30) (c_work-slot s10_30)
    (c_slot s11_00) (c_work-slot s11_00)
    (c_slot s11_30) (c_work-slot s11_30)
    (c_slot s12_00) (c_work-slot s12_00)
    (c_slot s12_30) (c_work-slot s12_30)
    (c_slot s13_00) (c_work-slot s13_00)
    (c_slot s13_30) (c_work-slot s13_30)
    (c_slot s14_00) (c_work-slot s14_00)
    (c_slot s14_30) (c_work-slot s14_30)
    (c_slot s15_00) (c_work-slot s15_00)
    (c_slot s15_30) (c_work-slot s15_30)
    (c_slot s16_00) (c_work-slot s16_00)
    (c_slot s16_30) (c_work-slot s16_30)

    ;; Christine's busy slots (cannot be used)
    ;; Busy 09:00-10:00 -> s09_00, s09_30
    (c_busy s09_00) (c_busy s09_30)
    ;; Busy 10:30-12:30 -> s10_30, s11_00, s11_30, s12_00
    (c_busy s10_30) (c_busy s11_00) (c_busy s11_30) (c_busy s12_00)
    ;; Busy 13:00-17:00 -> s13_00 .. s16_30
    (c_busy s13_00) (c_busy s13_30) (c_busy s14_00) (c_busy s14_30)
    (c_busy s15_00) (c_busy s15_30) (c_busy s16_00) (c_busy s16_30)
  )

  ;; Goal: find a single 30-minute slot that all agents can schedule.
  ;; Based on the intersection of known free times, s12_30 is the common available slot.
  (:goal (and
           (a1_scheduled scott s12_30)
           (g_scheduled meeting1 s12_30)
           (c_scheduled s12_30)
         ))
)