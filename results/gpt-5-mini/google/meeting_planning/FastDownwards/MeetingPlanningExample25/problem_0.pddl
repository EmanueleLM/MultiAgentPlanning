(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    traveler david - agent
    Chinatown GGP - location

    ;; Discrete times referenced by the candidate schedules (labels reflect hhmm)
    t0900 t1000 t1015 t1100 t1145 t1300 t1530 t1537 t1600 t1607 t1630
    t1737 t1745 t1800 t1808 t1900 t1923 t1937 t1945 t2000 t2008 t2145 t2208 - time
  )

  (:init
    ;; Traveler start: at Golden Gate Park at 09:00
    (at traveler GGP t0900)

    ;; David's presence window: David is at Chinatown for all relevant timepoints within 16:00–21:45
    ;; (these timepoints are the ones used by candidate schedules)
    (at david Chinatown t1600)
    (at david Chinatown t1630)
    (at david Chinatown t1745)
    (at david Chinatown t1800)
    (at david Chinatown t1945)
    (at david Chinatown t2000)
    (at david Chinatown t2145)
    ;; Also include intermediates used by schedules (to allow end-of-meeting checks and waits)
    (at david Chinatown t1607)
    (at david Chinatown t1737)
    (at david Chinatown t1808)
    (at david Chinatown t1900)
    (at david Chinatown t1923)
    (at david Chinatown t1937)
    (at david Chinatown t2008)

    ;; travel-edge facts: explicit 23-minute travel durations (symmetric in schedules where used)
    ;; These edges correspond to the listed schedule departure->arrival pairs (23 minutes)
    (travel-edge t1537 t1600)
    (travel-edge t1607 t1630)
    (travel-edge t1737 t1800)
    (travel-edge t1745 t1808)
    (travel-edge t1900 t1923)
    (travel-edge t1937 t2000)
    (travel-edge t1945 t2008)
    (travel-edge t2145 t2208)
    ;; Note: travel edges are declared in the direction used by schedules; travel is available when the edge exists.

    ;; after relations: declare chronological ordering among the discrete times that appear in the candidate schedules.
    ;; These permit "wait" actions that move an agent from an earlier relevant time to a later relevant time.
    ;; (We declare pairs t_i < t_j for all t_i strictly earlier than t_j among the listed timepoints.)
    (after t0900 t1000) (after t0900 t1015) (after t0900 t1100) (after t0900 t1145) (after t0900 t1300)
    (after t0900 t1530) (after t0900 t1537) (after t0900 t1600) (after t0900 t1607) (after t0900 t1630)
    (after t0900 t1737) (after t0900 t1745) (after t0900 t1800) (after t0900 t1808) (after t0900 t1900)
    (after t0900 t1923) (after t0900 t1937) (after t0900 t1945) (after t0900 t2000) (after t0900 t2008)
    (after t0900 t2145) (after t0900 t2208)

    (after t1000 t1015) (after t1000 t1100) (after t1000 t1145) (after t1000 t1300) (after t1000 t1530)
    (after t1000 t1537) (after t1000 t1600) (after t1000 t1607) (after t1000 t1630) (after t1000 t1737)
    (after t1000 t1745) (after t1000 t1800) (after t1000 t1808) (after t1000 t1900) (after t1000 t1923)
    (after t1000 t1937) (after t1000 t1945) (after t1000 t2000) (after t1000 t2008) (after t1000 t2145)
    (after t1000 t2208)

    (after t1015 t1100) (after t1015 t1145) (after t1015 t1300) (after t1015 t1530) (after t1015 t1537)
    (after t1015 t1600) (after t1015 t1607) (after t1015 t1630) (after t1015 t1737) (after t1015 t1745)
    (after t1015 t1800) (after t1015 t1808) (after t1015 t1900) (after t1015 t1923) (after t1015 t1937)
    (after t1015 t1945) (after t1015 t2000) (after t1015 t2008) (after t1015 t2145) (after t1015 t2208)

    (after t1100 t1145) (after t1100 t1300) (after t1100 t1530) (after t1100 t1537) (after t1100 t1600)
    (after t1100 t1607) (after t1100 t1630) (after t1100 t1737) (after t1100 t1745) (after t1100 t1800)
    (after t1100 t1808) (after t1100 t1900) (after t1100 t1923) (after t1100 t1937) (after t1100 t1945)
    (after t1100 t2000) (after t1100 t2008) (after t1100 t2145) (after t1100 t2208)

    (after t1145 t1300) (after t1145 t1530) (after t1145 t1537) (after t1145 t1600) (after t1145 t1607)
    (after t1145 t1630) (after t1145 t1737) (after t1145 t1745) (after t1145 t1800) (after t1145 t1808)
    (after t1145 t1900) (after t1145 t1923) (after t1145 t1937) (after t1145 t1945) (after t1145 t2000)
    (after t1145 t2008) (after t1145 t2145) (after t1145 t2208)

    (after t1300 t1530) (after t1300 t1537) (after t1300 t1600) (after t1300 t1607) (after t1300 t1630)
    (after t1300 t1737) (after t1300 t1745) (after t1300 t1800) (after t1300 t1808) (after t1300 t1900)
    (after t1300 t1923) (after t1300 t1937) (after t1300 t1945) (after t1300 t2000) (after t1300 t2008)
    (after t1300 t2145) (after t1300 t2208)

    (after t1530 t1537) (after t1530 t1600) (after t1530 t1607) (after t1530 t1630) (after t1530 t1737)
    (after t1530 t1745) (after t1530 t1800) (after t1530 t1808) (after t1530 t1900) (after t1530 t1923)
    (after t1530 t1937) (after t1530 t1945) (after t1530 t2000) (after t1530 t2008) (after t1530 t2145)
    (after t1530 t2208)

    (after t1537 t1600) (after t1537 t1607) (after t1537 t1630) (after t1537 t1737) (after t1537 t1745)
    (after t1537 t1800) (after t1537 t1808) (after t1537 t1900) (after t1537 t1923) (after t1537 t1937)
    (after t1537 t1945) (after t1537 t2000) (after t1537 t2008) (after t1537 t2145) (after t1537 t2208)

    (after t1600 t1607) (after t1600 t1630) (after t1600 t1737) (after t1600 t1745) (after t1600 t1800)
    (after t1600 t1808) (after t1600 t1900) (after t1600 t1923) (after t1600 t1937) (after t1600 t1945)
    (after t1600 t2000) (after t1600 t2008) (after t1600 t2145) (after t1600 t2208)

    (after t1607 t1630) (after t1607 t1737) (after t1607 t1745) (after t1607 t1800) (after t1607 t1808)
    (after t1607 t1900) (after t1607 t1923) (after t1607 t1937) (after t1607 t1945) (after t1607 t2000)
    (after t1607 t2008) (after t1607 t2145) (after t1607 t2208)

    (after t1630 t1737) (after t1630 t1745) (after t1630 t1800) (after t1630 t1808) (after t1630 t1900)
    (after t1630 t1923) (after t1630 t1937) (after t1630 t1945) (after t1630 t2000) (after t1630 t2008)
    (after t1630 t2145) (after t1630 t2208)

    (after t1737 t1745) (after t1737 t1800) (after t1737 t1808) (after t1737 t1900) (after t1737 t1923)
    (after t1737 t1937) (after t1737 t1945) (after t1737 t2000) (after t1737 t2008) (after t1737 t2145)
    (after t1737 t2208)

    (after t1745 t1800) (after t1745 t1808) (after t1745 t1900) (after t1745 t1923) (after t1745 t1937)
    (after t1745 t1945) (after t1745 t2000) (after t1745 t2008) (after t1745 t2145) (after t1745 t2208)

    (after t1800 t1808) (after t1800 t1900) (after t1800 t1923) (after t1800 t1937) (after t1800 t1945)
    (after t1800 t2000) (after t1800 t2008) (after t1800 t2145) (after t1800 t2208)

    (after t1808 t1900) (after t1808 t1923) (after t1808 t1937) (after t1808 t1945) (after t1808 t2000)
    (after t1808 t2008) (after t1808 t2145) (after t1808 t2208)

    (after t1900 t1923) (after t1900 t1937) (after t1900 t1945) (after t1900 t2000) (after t1900 t2008)
    (after t1900 t2145) (after t1900 t2208)

    (after t1923 t1937) (after t1923 t1945) (after t1923 t2000) (after t1923 t2008) (after t1923 t2145)
    (after t1923 t2208)

    (after t1937 t1945) (after t1937 t2000) (after t1937 t2008) (after t1937 t2145) (after t1937 t2208)

    (after t1945 t2000) (after t1945 t2008) (after t1945 t2145) (after t1945 t2208)

    (after t2000 t2008) (after t2000 t2145) (after t2000 t2208)

    (after t2008 t2145) (after t2008 t2208)

    (after t2145 t2208)

    ;; meeting-allowed pairs (must be at least 105 minutes and wholly within David's 16:00–21:45 window)
    ;; These correspond to candidate-schedule meeting intervals:
    ;; A / E earliest meeting: 16:00–17:45 (105 minutes)
    (meeting-allowed t1600 t1745)
    ;; B: 18:00–19:45 (105 minutes)
    (meeting-allowed t1800 t1945)
    ;; C: 20:00–21:45 (105 minutes)
    (meeting-allowed t2000 t2145)
    ;; D: 16:30–19:00 (150 minutes > 105)
    (meeting-allowed t1630 t1900)

    ;; Note: all meeting-allowed pairs are within David's declared presence window (16:00–21:45)
    ;; and respect the minimum meeting duration (>=105 minutes).

    ;; The domain's initial state intentionally includes only the timepoints and travel edges
    ;; required by the candidate schedules A–E. The planner can choose any valid sequence of:
    ;; wait -> travel -> wait -> meet-with-david -> travel -> wait consistent with these facts.

  )

  (:goal (meeting-done))
)