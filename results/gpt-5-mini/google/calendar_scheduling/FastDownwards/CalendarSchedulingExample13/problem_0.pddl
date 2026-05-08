(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    ;; All half-hour start slots between 09:00 and 16:30 (inclusive).
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot

    Gerald Participant_free_09_17 Participant_anonymous_3 - participant
  )

  (:init
    ;; Declare slot objects
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Participants declared (kept distinct though most constraints are per-slot).
    (participant Gerald)
    (participant Participant_free_09_17)
    (participant Participant_anonymous_3)

    ;; Availability facts derived from the canonical hard busy intervals and
    ;; the auditor's report. Every natural-language preference has been
    ;; enforced as a hard constraint per the instructions: Gerald's
    ;; "avoid meetings before 13:00" is treated as a hard constraint here.

    ;; Gerald: work_window 09:00-17:00, canonical hard busy:
    ;; 09:00-09:30, 13:00-14:00, 15:00-15:30, 16:00-17:00
    ;; PLUS the stated preference "avoid meetings before 13:00" treated as hard:
    ;; therefore Gerald is only available at starts on or after 13:00, but his
    ;; 13:00-14:00 busy interval removes 13:00 and 13:30. The remaining starts
    ;; within 09:00-17:00 consistent with all constraints are:
    ;; 14:00 (s1400), 14:30 (s1430), 15:30 (s1530).
    (available-gerald s1400)
    (available-gerald s1430)
    (available-gerald s1530)

    ;; Participant_free_09_17: explicitly free 09:00-17:00 -> available at all slots.
    (available-free_09_17 s0900) (available-free_09_17 s0930)
    (available-free_09_17 s1000) (available-free_09_17 s1030)
    (available-free_09_17 s1100) (available-free_09_17 s1130)
    (available-free_09_17 s1200) (available-free_09_17 s1230)
    (available-free_09_17 s1300) (available-free_09_17 s1330)
    (available-free_09_17 s1400) (available-free_09_17 s1430)
    (available-free_09_17 s1500) (available-free_09_17 s1530)
    (available-free_09_17 s1600) (available-free_09_17 s1630)

    ;; Participant_anonymous_3: canonical hard busy intervals:
    ;; 09:30-10:00, 11:30-14:00, 14:30-15:00, 15:30-17:00
    ;; These block starts at 09:30; 11:30,12:00,12:30,13:00,13:30;
    ;; 14:30; 15:30,16:00,16:30. The remaining available starts within the
    ;; 09:00-17:00 range are:
    ;; 09:00 (s0900), 10:00 (s1000), 10:30 (s1030), 11:00 (s1100),
    ;; 14:00 (s1400), 15:00 (s1500).
    (available-anon3 s0900)
    (available-anon3 s1000)
    (available-anon3 s1030)
    (available-anon3 s1100)
    (available-anon3 s1400)
    (available-anon3 s1500)
  )

  ;; Goal: produce a single meeting-scheduled fact (any valid slot chosen by the planner).
  ;; Because the schedule-meeting action requires a concrete slot where every
  ;; participant is available, the planner will instantiate the action at a
  ;; slot that satisfies all hard constraints. (Given the inputs, only s1400
  ;; satisfies all participants' hard constraints and the enforced preference.)
  (:goal (meeting-scheduled))
)