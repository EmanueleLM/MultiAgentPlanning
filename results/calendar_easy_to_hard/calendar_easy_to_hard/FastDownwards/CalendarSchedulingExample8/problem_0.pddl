(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; objects: agents and half-hour slots from 09:00 to 16:30 (start times)
  (:objects
    adam jerry matthew - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  ;; Informational facts about the meeting/day/duration (public shared info)
  (:init
    (day monday)
    (meeting-duration 30)

    ;; declare slots
    (slot s0900) (slot s0930) (slot s1000) (slot s1030) (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430) (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; declare agents (optional but explicit)
    (agent adam) (agent jerry) (agent matthew)

    ;; Availability facts derived from each agent's private busy intervals (unavailable slots are omitted).
    ;; Adam's busy: 10:00-10:30 (s1000), 12:30-13:00 (s1230), 13:30-14:30 (s1330 and s1400)
    ;; Therefore Adam is available at all work slots except those above.
    (available adam s0900) (available adam s0930) (available adam s1030) (available adam s1100)
    (available adam s1130) (available adam s1200) (available adam s1300) (available adam s1430)
    (available adam s1500) (available adam s1530) (available adam s1600) (available adam s1630)

    ;; Jerry's busy: 09:00-09:30 (s0900), 12:00-12:30 (s1200), 15:00-16:00 (s1500 and s1530)
    ;; Therefore Jerry is available at all other slots.
    (available jerry s0930) (available jerry s1000) (available jerry s1030) (available jerry s1100)
    (available jerry s1130) (available jerry s1230) (available jerry s1300) (available jerry s1330)
    (available jerry s1400) (available jerry s1430) (available jerry s1600) (available jerry s1630)

    ;; Matthew's busy: 09:30-11:00 (s0930,s1000,s1030), 11:30-12:30 (s1130,s1200),
    ;; 13:00-14:00 (s1300,s1330), 14:30-17:00 (s1430,s1500,s1530,s1600,s1630)
    ;; Therefore Matthew is available only at the remaining slots.
    (available matthew s0900) (available matthew s1100) (available matthew s1230) (available matthew s1400)
  )

  ;; Goal: a meeting has been scheduled at some slot. (Planner should find earliest feasible slot.)
  (:goal (meeting-scheduled s1100))
)