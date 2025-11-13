(define (problem meet-betty-0900-constraint)
  (:domain richmond-financial-scheduling)

  (:objects
    ;; explicit ordered stages used by the domain (minutes-from-midnight labels)
    ;; 09:00 = 540; chosen departure marker 16:53 = 1013; arrival 17:15 = 1035;
    ;; subsequent 60-min block boundaries: 1095, 1155, 1215, 1275; 15-min tail: 1290; end 1305 (21:45)
    t540  t1013 t1035 t1095 t1155 t1215 t1275 t1290 t1305 - time
  )

  (:init
    ;; initial conditions
    (at-richmond)
    (now t540)

    ;; general successor chain encoding contiguous occupancy windows for the day
    (succ t540 t1013)   ;; wait from 09:00 until planned departure marker 16:53
    (succ t1013 t1035)  ;; contiguous block representing 22-minute travel interval (will be marked as travel)
    (succ t1035 t1095)  ;; 17:15 -> 18:15 (60)
    (succ t1095 t1155)  ;; 18:15 -> 19:15 (60)
    (succ t1155 t1215)  ;; 19:15 -> 20:15 (60)
    (succ t1215 t1275)  ;; 20:15 -> 21:15 (60)
    (succ t1275 t1290)  ;; 21:15 -> 21:30 (15)
    (succ t1290 t1305)  ;; 21:30 -> 21:45 (15)

    ;; mark the explicit successor pair that corresponds exactly to the Richmond->Financial travel time (22 minutes)
    (succ-travel-richmond-financial t1013 t1035)

    ;; (No return-travel successor pairs are required by the scenario, but predicate is available.)

    ;; mark contiguous 60-minute meeting blocks that lie fully inside Betty's availability window 17:15–21:45
    (succ-meet60 t1035 t1095)
    (succ-meet60 t1095 t1155)
    (succ-meet60 t1155 t1215)
    (succ-meet60 t1215 t1275)

    ;; mark 15-minute meeting blocks for the remaining tail segments inside the availability window
    (succ-meet15 t1275 t1290)
    (succ-meet15 t1290 t1305)
  )

  ;; Goal: achieve at least one contiguous 60-minute meeting with Betty within her window.
  (:goal (and
           (met-60)
         )
  )
)