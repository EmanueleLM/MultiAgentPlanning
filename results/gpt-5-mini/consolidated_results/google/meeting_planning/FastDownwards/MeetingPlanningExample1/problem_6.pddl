(define (problem meet-betty-0900-constraint)
  (:domain richmond-financial-scheduling)

  (:objects
    ;; explicit ordered stages used by the domain (minutes-from-midnight labels)
    ;; 09:00 = 540; chosen departure 16:53 = 1013; arrival 17:15 = 1035;
    ;; subsequent 60-min block boundaries: 1095, 1155, 1215, 1275; 15-min tail: 1290; end 1305 (21:45)
    t540  t1013 t1035 t1095 t1155 t1215 t1275 t1290 t1305 - time
  )

  (:init
    ;; initial conditions
    (at-richmond)
    (now t540)

    ;; explicit ordered successor stages (each succ fact encodes a contiguous block length)
    ;; succ t540 -> t1013 represents waiting from 09:00 until departure at 16:53
    (succ t540 t1013)

    ;; succ representing the 22-minute travel from Richmond to Financial (1013 -> 1035)
    (succ t1013 t1035)

    ;; succ facts representing contiguous 60-minute blocks inside Betty's availability window
    (succ t1035 t1095)  ;; 17:15 -> 18:15 (60)
    (succ t1095 t1155)  ;; 18:15 -> 19:15 (60)
    (succ t1155 t1215)  ;; 19:15 -> 20:15 (60)
    (succ t1215 t1275)  ;; 20:15 -> 21:15 (60)

    ;; succ facts for the remaining 15-minute tail segments to reach 21:45
    (succ t1275 t1290)  ;; 21:15 -> 21:30 (15)
    (succ t1290 t1305)  ;; 21:30 -> 21:45 (15)

    ;; Allowable meeting start tokens encode Betty's availability window start times
    ;; 60-minute meeting starts that fit fully within 17:15–21:45
    (allow-meet60 t1035)
    (allow-meet60 t1095)
    (allow-meet60 t1155)
    (allow-meet60 t1215)

    ;; 15-minute meeting starts for remaining tail segments (if used)
    (allow-meet15 t1275)
    (allow-meet15 t1290)
  )

  ;; Goal: achieve at least one contiguous 60-minute meeting with Betty within her window.
  (:goal (and
           (met-60)
         )
  )
)