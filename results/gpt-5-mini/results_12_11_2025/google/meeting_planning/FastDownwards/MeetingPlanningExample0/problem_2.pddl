(define (problem MeetingPlanningExample0)
  (:domain meeting_planning)
  (:objects
    marina mission - location
    t540 t610 t630 t750 - time
    stephanie - friend
  )

  (:init
    ;; Start location and time: 09:00 represented as t540 (540 minutes after midnight)
    (at marina)
    (time-now t540)

    ;; Explicit contiguous time-steps (ordered stages)
    ;; t540 -> t610 (09:00 -> 10:10) contiguous block (70 minutes)
    ;; t610 -> t630 (10:10 -> 10:30) contiguous block (20 minutes)
    ;; t630 -> t750 (10:30 -> 12:30) contiguous block (120 minutes)
    (succ t540 t610)
    (succ t610 t630)
    (succ t630 t750)

    ;; Directional travel arcs tie a location-to-location movement to an exact contiguous time-step.
    ;; Travel from Marina to Mission that takes the 10:10->10:30 slot (20 minutes)
    (travel-arc marina mission t610 t630)
    ;; (If other travel arcs are desired they must be added as travel-arc facts; none are required for the mandatory plan.)

    ;; Stephanie's availability is exactly the contiguous block 10:30->12:30 (t630 -> t750),
    ;; which enforces the required contiguous meeting occupancy of 120 minutes.
    (available stephanie t630 t750)

    ;; Stephanie's base location
    (friend-loc stephanie mission)
  )

  ;; Goal: meet Stephanie (the mandatory hard requirement: at least the contiguous block t630->t750)
  (:goal (met stephanie))
)