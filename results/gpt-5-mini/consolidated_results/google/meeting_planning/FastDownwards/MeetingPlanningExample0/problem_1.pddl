(define (problem MeetingPlanningExample0)
  (:domain meeting_planning)
  (:objects
    marina mission - location
    t540 t610 t630 t750 - time
    d70 d20 d120 d19 - duration
    stephanie - friend
  )

  (:init
    ;; Start location and time: 09:00 represented as t540 (540 minutes after midnight)
    (at marina)
    (time-now t540)

    ;; Advance facts encode allowed discrete time transitions and their durations:
    ;; 09:00 -> 10:10 is 70 minutes
    ;; 10:10 -> 10:30 is 20 minutes
    ;; 10:30 -> 12:30 is 120 minutes
    (advance t540 t610 d70)
    (advance t610 t630 d20)
    (advance t630 t750 d120)

    ;; Directional travel durations (must match advance durations for travel)
    (travel-duration marina mission d20)
    (travel-duration mission marina d19)

    ;; Stephanie meeting requirement: needs 120 minutes
    (meeting-duration stephanie d120)

    ;; Stephanie's availability: available from 10:30 (t630) to 13:30 (not needed explicitly,
    ;; but we provide the exact block used by the valid meeting below)
    (available stephanie t630 t750)

    ;; Stephanie's base location
    (friend-location stephanie mission)
  )

  ;; Goal: meet as many friends as possible. Here the only friend is Stephanie,
  ;; so the planner must produce a plan that results in (met stephanie).
  (:goal (met stephanie))
)