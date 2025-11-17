(define (problem meet-betty-0900-constraint)
  (:domain richmond-financial-scheduling)

  (:objects
    t540  t1013 t1035 t1095 t1155 t1215 t1275 t1290 t1305 - time
  )

  (:init
    ;; initial location and time (09:00 = 540)
    (at-richmond)
    (now t540)

    ;; meeting accumulation starts at 0
    (met-0)

    ;; Explicit contiguous wait relation: wait from 09:00 (t540) to 16:53 (t1013)
    ;; This encodes the decision to remain in Richmond until departure time as a single contiguous wait block.
    (after-wait t540 t1013)

    ;; Travel: Richmond -> Financial takes 22 minutes: depart at 16:53 (t1013) arrive 17:15 (t1035)
    (after22 t1013 t1035)

    ;; 60-minute contiguous blocks covering Betty's availability window starting times:
    ;; Betty present 17:15–21:45 => 60-minute blocks may start at 17:15 (1035), 18:15 (1095), 19:15 (1155), 20:15 (1215)
    (after60 t1035 t1095)
    (after60 t1095 t1155)
    (after60 t1155 t1215)
    (after60 t1215 t1275)

    ;; 15-minute blocks to cover remaining tail of availability if needed (20:45->21:00 etc)
    (after15 t1275 t1290)
    (after15 t1290 t1305)

    ;; Betty availability encoded as allowed starts for meetings
    (allow-meet60 t1035)
    (allow-meet60 t1095)
    (allow-meet60 t1155)
    (allow-meet60 t1215)

    (allow-meet15 t1275)
    (allow-meet15 t1290)
  )

  ;; Goal: achieve at least 60 minutes with Betty (modeled as reaching met-60).
  (:goal (and
           (met-60)
         )
  )
)