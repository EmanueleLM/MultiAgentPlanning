(define (problem meet-betty-0900-constraint)
  (:domain richmond-financial-scheduling)

  (:objects
    ;; explicit ordered time stages (minutes-from-midnight labels)
    ;; 09:00 = 540; planned departure marker 16:53 = 1013; arrival 17:15 = 1035;
    ;; subsequent 60-min block boundaries: 18:15=1095, 19:15=1155, 20:15=1215, 21:15=1275;
    ;; 15-min tail: 21:30=1290; end 21:45=1305
    t540  t1013 t1035 t1095 t1155 t1215 t1275 t1290 t1305 - time
  )

  (:init
    ;; initial conditions: arrive and start at Richmond at 09:00
    (at-richmond)
    (now t540)

    ;; explicit contiguous successor chain for the planned day
    ;; This encodes allowed contiguous stage transitions; actions can only advance time along these links.
    (succ t540 t1013)   ;; wait from 09:00 until 16:53
    (succ t1013 t1035)  ;; travel interval (22 minutes)
    (succ t1035 t1095)  ;; 17:15 -> 18:15 (60)
    (succ t1095 t1155)  ;; 18:15 -> 19:15 (60)
    (succ t1155 t1215)  ;; 19:15 -> 20:15 (60)
    (succ t1215 t1275)  ;; 20:15 -> 21:15 (60)
    (succ t1275 t1290)  ;; 21:15 -> 21:30 (15)
    (succ t1290 t1305)  ;; 21:30 -> 21:45 (15)

    ;; mark the exact travel successor pair matching Richmond->Financial = 22 minutes
    (succ-travel-richmond-financial t1013 t1035)

    ;; mark contiguous 60-minute meeting blocks fully inside Betty's availability window (17:15–21:45)
    (succ-meet60 t1035 t1095)
    (succ-meet60 t1095 t1155)
    (succ-meet60 t1155 t1215)
    (succ-meet60 t1215 t1275)

    ;; mark 15-minute meeting blocks inside the availability window for the remaining tail segments
    (succ-meet15 t1275 t1290)
    (succ-meet15 t1290 t1305)
  )

  ;; Goal: achieve at least one contiguous 60-minute meeting with Betty within her availability.
  (:goal (and
           (met-betty)
         )
  )
)