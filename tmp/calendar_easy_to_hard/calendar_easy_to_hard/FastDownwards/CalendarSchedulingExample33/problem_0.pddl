(define (problem schedule-monday-all)
  (:domain integrated-meeting-scheduling)

  ;; Objects: 30-minute start slots from 09:00 to 16:30 (last start 16:30)
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot

    theresa alexander virginia lisa natalie victoria - person
  )

  (:init
    ;; declare slots and persons
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    (person theresa) (person alexander) (person virginia) (person lisa) (person natalie) (person victoria)

    ;; Theresa's availability (from her PDDL): busy 09:30-10:30 -> s09_30, s10_00 busy;
    ;; busy 15:00-16:00 -> s15_00, s15_30 busy.
    ;; The provided free slots for Theresa:
    (free theresa s09_00)
    (free theresa s10_30) (free theresa s11_00) (free theresa s11_30)
    (free theresa s12_00) (free theresa s12_30) (free theresa s13_00) (free theresa s13_30)
    (free theresa s14_00) (free theresa s14_30)
    (free theresa s16_00) (free theresa s16_30)

    ;; Alexander's availability (from his PDDL): busy 12:00 (s12_00) and 13:30 (s13_30).
    ;; All other work-hour slots are considered free per his info:
    (free alexander s09_00) (free alexander s09_30)
    (free alexander s10_00) (free alexander s10_30)
    (free alexander s11_00) (free alexander s11_30)
    ;; s12_00 busy -> omitted
    (free alexander s12_30) (free alexander s13_00)
    ;; s13_30 busy -> omitted
    (free alexander s14_00) (free alexander s14_30)
    (free alexander s15_00) (free alexander s15_30)
    (free alexander s16_00) (free alexander s16_30)

    ;; Virginia's availability: free all work hours (09:00-17:00)
    (free virginia s09_00) (free virginia s09_30) (free virginia s10_00) (free virginia s10_30)
    (free virginia s11_00) (free virginia s11_30) (free virginia s12_00) (free virginia s12_30)
    (free virginia s13_00) (free virginia s13_30) (free virginia s14_00) (free virginia s14_30)
    (free virginia s15_00) (free virginia s15_30) (free virginia s16_00) (free virginia s16_30)

    ;; Lisa's availability (from her PDDL):
    ;; Busy 10:30-12:30 -> s10_30, s11_00, s11_30, s12_00 busy.
    ;; Busy 13:30-14:30 -> s13_30, s14_00 busy.
    ;; Busy 16:00-17:00 -> s16_00, s16_30 busy.
    ;; Free slots provided:
    (free lisa s09_00) (free lisa s09_30) (free lisa s10_00)
    (free lisa s12_30) (free lisa s13_00) (free lisa s14_30)
    (free lisa s15_00) (free lisa s15_30)

    ;; Natalie's availability (from her PDDL):
    ;; Free: 09:30, 10:00, 10:30, 12:30, 13:00, 15:30
    (free natalie s09_30) (free natalie s10_00) (free natalie s10_30)
    (free natalie s12_30) (free natalie s13_00) (free natalie s15_30)

    ;; Victoria's availability (given): 09:00, 10:30, 12:30, 13:00, 14:30, 16:30
    (free victoria s09_00) (free victoria s10_30)
    (free victoria s12_30) (free victoria s13_00) (free victoria s14_30) (free victoria s16_30)
  )

  ;; Goal: a meeting is scheduled that satisfies every participant's constraints.
  ;; The planner must have every participant attend the same slot, then confirm.
  (:goal (meeting-scheduled))
)