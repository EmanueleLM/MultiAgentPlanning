(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    traveler - agent
    Chinatown GGP - location

    ;; reduced set of timepoints sufficient to reach all candidate meeting intervals and travel legs
    t0900 t1537 t1600 t1607 t1630 t1737 t1745 t1800 t1900 t1937 t1945 t2000 t2145 - time
  )

  (:init
    ;; traveler start
    (at traveler GGP t0900)

    ;; linear immediate-ordering between the retained timepoints (sparser than enumerating all pairwise after facts)
    (next t0900 t1537) (next t1537 t1600) (next t1600 t1607) (next t1607 t1630)
    (next t1630 t1737) (next t1737 t1745) (next t1745 t1800) (next t1800 t1900)
    (next t1900 t1937) (next t1937 t1945) (next t1945 t2000) (next t2000 t2145)

    ;; explicit 23-minute travel edges used by candidate schedules (departure -> arrival)
    (travel-edge t1537 t1600)
    (travel-edge t1607 t1630)
    (travel-edge t1737 t1800)
    (travel-edge t1937 t2000)

    ;; allowed meeting intervals: all are inside David's 16:00–21:45 window and meet the >=105-minute requirement
    (meeting-allowed t1600 t1745)  ;; 16:00–17:45 (105)
    (meeting-allowed t1630 t1900)  ;; 16:30–19:00 (150)
    (meeting-allowed t1800 t1945)  ;; 18:00–19:45 (105)
    (meeting-allowed t2000 t2145)  ;; 20:00–21:45 (105)
  )

  (:goal (meeting-done))
)