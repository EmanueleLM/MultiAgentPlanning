(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Objects: one participant (William) and the half-hour slots from Monday 09:00 to 13:30.
  ;; Each slot represents a contiguous 30-minute meeting window.
  (:objects
    william - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 - slot
  )

  (:init
    ;; role / existence facts
    (participant william)

    ;; slots available for scheduling (modelled within the Monday business window;
    ;; these objects are explicitly the candidate 30-minute slots)
    (slot s0900) (slot s0930) (slot s1000) (slot s1030) (slot s1100)
    (slot s1130) (slot s1200) (slot s1230) (slot s1300)

    ;; Participant availability derived directly from the provided report:
    ;; William prefers to avoid meetings after 13:30 -> treated as a hard constraint.
    ;; Therefore William is available for every 30-minute slot that ends no later than 13:30.
    ;; (No other participants or availabilities were provided and none are invented.)
    (available william s0900)
    (available william s0930)
    (available william s1000)
    (available william s1030)
    (available william s1100)
    (available william s1130)
    (available william s1200)
    (available william s1230)
    (available william s1300)

    ;; Meeting not yet scheduled
    (unscheduled)
  )

  ;; Goal: produce a feasible meeting time that respects all constraints.
  ;; Prioritise the earliest allowed slot that satisfies everyone (William's hard constraint).
  ;; Given the provided data, the earliest feasible slot is 09:00 (s0900).
  (:goal (meeting-scheduled s0900))
)