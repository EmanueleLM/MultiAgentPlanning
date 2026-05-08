(define (problem meet-betty-0900-constraint)
  (:domain richmond-financial-scheduling)

  (:objects
    ;; explicit discrete time points (minutes from midnight):
    ;; 09:00 = 540; departure chosen 16:53 = 1013; arrival 17:15 = 1035;
    ;; subsequent 60-min block boundaries: 1095, 1155, 1215, 1275; 15-min tail: 1290; end 1305 (21:45)
    t540  t1013 t1035 t1095 t1155 t1215 t1275 t1290 t1305 - time
  )

  (:init
    ;; initial conditions
    (at-richmond)
    (now t540)

    ;; no met-60 yet
    ;; (met-60) absent by omission; goal requires this predicate to be achieved.

    ;; explicit wait: remain in Richmond from 09:00 until chosen departure 16:53
    (after-wait t540 t1013)

    ;; travel durations (graph edges)
    (after22 t1013 t1035)  ;; richmond -> financial (22 minutes)
    (after21 t1305 t1326)  ;; financial -> richmond (21 minutes) -- not used beyond horizon; included for completeness

    ;; 60-minute contiguous blocks covering Betty's availability window (17:15–21:45)
    ;; valid 60-minute starts: 17:15 (1035), 18:15 (1095), 19:15 (1155), 20:15 (1215)
    (after60 t1035 t1095)
    (after60 t1095 t1155)
    (after60 t1155 t1215)
    (after60 t1215 t1275)

    ;; 15-minute fine-grained blocks for the tail of availability (21:15->21:30, 21:30->21:45)
    (after15 t1275 t1290)
    (after15 t1290 t1305)

    ;; Allowable meeting start tokens encode Betty's availability window
    (allow-meet60 t1035)
    (allow-meet60 t1095)
    (allow-meet60 t1155)
    (allow-meet60 t1215)

    (allow-meet15 t1275)
    (allow-meet15 t1290)
  )

  ;; Goal: achieve at least a contiguous 60-minute meeting with Betty within her window.
  ;; Time objects and after relations ensure no action can move time beyond t1305 because no after relations produce times later than t1305 in init.
  (:goal (and
           (met-60)
         )
  )
)