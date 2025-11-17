(define (problem meet-betty-0900-constraint)
  (:domain richmond-financial-scheduling)

  ;; Objects: selected explicit minute time points sufficient to represent the feasible schedule
  (:objects
    t540  t1013 t1035 t1095 t1155 t1215 t1275 t1290 t1305 - time
  )

  (:init
    ;; initial location and time (09:00 = 540)
    (at-richmond)
    (now t540)

    ;; meeting accumulation starts at 0
    (met-0)

    ;; Discrete-time relations needed by actions (static facts).
    ;; Travel: Richmond -> Financial takes 22 minutes: depart at 1013 arrive 1035
    (after22 t1013 t1035)

    ;; 60-minute contiguous blocks for meeting action
    (after60 t1035 t1095)
    (after60 t1095 t1155)
    (after60 t1155 t1215)
    (after60 t1215 t1275)

    ;; 15-minute blocks used to cover remainder of availability in the example plan
    (after15 t1275 t1290)
    (after15 t1290 t1305)

    ;; Betty availability windows encoded as allowed meeting start times:
    ;; Betty is present 17:15–21:45 => start times allowed for 60-minute blocks are 17:15 .. 20:45 (1035 .. 1245)
    ;; In the compact time set used here the 60-minute starts available are t1035, t1095, t1155, t1215.
    (allow-meet60 t1035)
    (allow-meet60 t1095)
    (allow-meet60 t1155)
    (allow-meet60 t1215)

    ;; 15-minute meeting starts are allowed up to 21:30 (1290). We include the two 15-minute starts used in the example.
    (allow-meet15 t1275)
    (allow-meet15 t1290)
  )

  ;; Goal: achieve at least 60 minutes with Betty (modeled as reaching met-60).
  ;; The problem's time objects are all <= 1305 (21:45), so finishing with now at some object implies finishing no later than 21:45.
  (:goal (and
           (met-60)
         )
  )
)