(define (problem meet-sarah-earliest)
  (:domain meeting-scheduling)
  (:objects
    visitor - agent
    Richmond_District Bayview - location
  )
  ;; Plan start time = 09:00. All timed initial literals are given as minutes after 09:00.
  ;; 09:00 = 540 minutes after midnight -> we treat plan t=0 as 09:00.
  ;; Sarah availability: 14:15 (855) to 17:30 (1050).
  ;; Relative to plan start (09:00=540): 14:15 -> 855-540 = 315 ; 17:30 -> 1050-540 = 510.
  ;; Earliest feasible meeting start is 14:15 (relative time 315). To force earliest start,
  ;; we close the "meeting start window" at relative time 316 so any start after 315 is disallowed.
  (:init
    ;; initial location at plan start (09:00)
    (at visitor Richmond_District)
    ;; no meetings yet
    (= (num-meetings) 0)

    ;; Timed initial literals to represent Sarah availability and enforced earliest-start closure:
    ;; Sarah becomes available at relative time 315 (14:15).
    (at 315 (available_sarah))
    ;; Sarah stops being available at relative time 510 (17:30).
    (at 510 (not (available_sarah)))
    ;; Enforce earliest feasible meeting start: after relative time 315 the meeting start is closed.
    ;; Meeting start must occur before time 316 -> the only time that aligns with availability is 315.
    (at 316 (meeting_window_closed))
  )

  ;; Goal: ensure the visitor meets Sarah at least once (and metric maximizes meetings).
  (:goal (>= (num-meetings) 1))

  ;; Objective: maximize number of meetings (numeric fluent num-meetings).
  (:metric maximize (num-meetings))
)