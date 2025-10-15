(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    marie janice elijah theresa - agent
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; Marie availability (blocked: 11:00-11:30 and 15:00-16:30 -> blocks starts 11:00,15:00,15:30,16:00)
    (available marie s09_00)
    (available marie s09_30)
    (available marie s10_00)
    (available marie s10_30)
    (available marie s11_30)
    (available marie s12_00)
    (available marie s12_30)
    (available marie s13_00)
    (available marie s13_30)
    (available marie s14_00)
    (available marie s14_30)
    (available marie s16_30)

    ;; Janice availability (blocked: 12:30-13:00 -> s12_30; 13:30-15:00 -> s13_30,s14_00,s14_30)
    (available janice s09_00)
    (available janice s09_30)
    (available janice s10_00)
    (available janice s10_30)
    (available janice s11_00)
    (available janice s11_30)
    (available janice s12_00)
    (available janice s13_00)
    (available janice s15_00)
    (available janice s15_30)
    (available janice s16_00)
    (available janice s16_30)

    ;; Elijah availability (blocked: 10:00-13:00 -> s10_00,s10_30,s11_00,s11_30,s12_00,s12_30; 14:30-15:00 -> s14_30; 16:00-16:30 -> s16_00)
    (available elijah s09_00)
    (available elijah s09_30)
    (available elijah s13_00)
    (available elijah s13_30)
    (available elijah s14_00)
    (available elijah s15_00)
    (available elijah s15_30)
    (available elijah s16_30)

    ;; Theresa availability (blocked by explicit busy intervals: 09:30-10:30 -> s09_30,s10_00;
    ;; and hard preference: do not meet after 12:00 -> disallow any start >=12:00)
    (available theresa s09_00)
    (available theresa s10_30)
    (available theresa s11_00)
    (available theresa s11_30)

    ;; single-shot guard that prevents scheduling more than once
    (unscheduled)
  )

  ;; Goal: schedule the earliest feasible 30-minute slot. Given the availabilities above,
  ;; the earliest common feasible slot is 09:00. We set the planner goal to schedule s09_00.
  (:goal (meeting-scheduled s09_00))
)