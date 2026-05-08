(define (problem meet-sam-and-margaret)
  (:domain meetup-schedule)

  (:objects
    ;; agent and friends
    traveler - agent
    sam marg - friend

    ;; locations
    mission haight - location

    ;; discrete timepoints used to represent start/end times in the candidate schedules and auditor corrections
    ;; Each name encodes the clock time for clarity (tHHMM). Times are local (Pacific).
    t0900 t0912 t0915 t0927 t0930 t0942 t0947 t0953 t1000 t1012 t1017
    t1127 t1132 t1212 t1217 t1545 t1800 - time
  )

  ;; Initial state:
  (:init
    ;; traveler arrives Mission District at 09:00
    (at traveler mission t0900)

    ;; No friend has been met yet
    ;; (no (met sam)), (no (met marg)) are implicit by omission; explicit negative preconditions are not required in init.

    ;; Initial total-cost = 0 (the planner will minimize total-cost; meeting actions decrease it)
    (= (total-cost) 0)

    ;; ---------
    ;; Static allowed travel links (exact travel durations from the input)
    ;; Mission -> Haight travel takes 12 minutes: allowed precise start->end pairs extracted from candidate schedules
    (can-travel-mh t0930 t0942)  ;; Option A: depart 09:30 arrive 09:42
    (can-travel-mh t0915 t0927)  ;; Option B: depart 09:15 arrive 09:27
    (can-travel-mh t0900 t0912)  ;; Option C: depart 09:00 arrive 09:12
    (can-travel-mh t1000 t1012)  ;; Option D: depart 10:00 arrive 10:12

    ;; Haight -> Mission travel takes 11 minutes:
    (can-travel-hm t0942 t0953)  ;; Option C: depart 09:42 arrive 09:53

    ;; ---------
    ;; Allowed meeting start->end pairs derived from availability windows and minimums.
    ;; Sam: available 09:00–10:00. All start/end pairs (from the enumerated timepoints) with start < end and end <= 10:00 are permitted.
    ;; (These cover the candidate Sam meetings: 09:00-09:15, 09:00-09:30, 09:00-10:00, 09:53-10:00, etc.)
    (can-meet-sam t0900 t0912)
    (can-meet-sam t0900 t0915)
    (can-meet-sam t0900 t0927)
    (can-meet-sam t0900 t0930)
    (can-meet-sam t0900 t0942)
    (can-meet-sam t0900 t0947)
    (can-meet-sam t0900 t0953)
    (can-meet-sam t0900 t1000)

    (can-meet-sam t0912 t0915)
    (can-meet-sam t0912 t0927)
    (can-meet-sam t0912 t0930)
    (can-meet-sam t0912 t0942)
    (can-meet-sam t0912 t0947)
    (can-meet-sam t0912 t0953)
    (can-meet-sam t0912 t1000)

    (can-meet-sam t0915 t0927)
    (can-meet-sam t0915 t0930)
    (can-meet-sam t0915 t0942)
    (can-meet-sam t0915 t0947)
    (can-meet-sam t0915 t0953)
    (can-meet-sam t0915 t1000)

    (can-meet-sam t0927 t0930)
    (can-meet-sam t0927 t0942)
    (can-meet-sam t0927 t0947)
    (can-meet-sam t0927 t0953)
    (can-meet-sam t0927 t1000)

    (can-meet-sam t0930 t0942)
    (can-meet-sam t0930 t0947)
    (can-meet-sam t0930 t0953)
    (can-meet-sam t0930 t1000)

    (can-meet-sam t0942 t0947)
    (can-meet-sam t0942 t0953)
    (can-meet-sam t0942 t1000)

    (can-meet-sam t0947 t0953)
    (can-meet-sam t0947 t1000)

    (can-meet-sam t0953 t1000)

    ;; ---------
    ;; Margaret: available 08:00–15:45; minimum meeting duration is 30 minutes.
    ;; We permit start/end pairs (from enumerated timepoints) where end - start >= 30 minutes and end <= 15:45 (t1545).
    ;; Candidate schedules and corrected windows included (Examples: 09:12-09:42, 09:42-10:12, 09:27-11:27, 10:12-12:12, 09:47-10:17).
    (can-meet-marg t0912 t0942) ;; 09:12 - 09:42 (30m)  Option C/A
    (can-meet-marg t0912 t1012) ;; 09:12 - 10:12 (60m)
    (can-meet-marg t0912 t1127) ;; 09:12 - 11:27 (>=30m)
    (can-meet-marg t0912 t1212) ;; 09:12 - 12:12 (>=30m)

    (can-meet-marg t0927 t1127) ;; 09:27 - 11:27 (120m) Option B
    (can-meet-marg t0927 t1212)
    (can-meet-marg t0927 t1012)

    (can-meet-marg t0930 t1012)
    (can-meet-marg t0942 t1012) ;; 09:42 - 10:12 (30m) Option A
    (can-meet-marg t0942 t1127)
    (can-meet-marg t0942 t1212)

    (can-meet-marg t0947 t1017) ;; corrected buffer variant e.g., 09:47-10:17 (30m)
    (can-meet-marg t0947 t1127)
    (can-meet-marg t0947 t1212)

    (can-meet-marg t1012 t1212) ;; 10:12 - 12:12 (120m) Option D
    (can-meet-marg t1012 t1132)
    (can-meet-marg t1012 t1217)

    (can-meet-marg t1017 t1217)
    (can-meet-marg t1127 t1217)
    (can-meet-marg t1132 t1217)

    ;; Ensure all meeting end times do not exceed Margaret's hard limit at 15:45.
    ;; We do not include any pair that would end after t1545.

    ;; ---------
    ;; For completeness, the candidate schedules imply the ability to be 'finished' at a reasonable timepoint.
    ;; We allow the plan to finish from any enumerated timepoint by executing finish-day (goal requires finished).
    ;; (No explicit can-finish predicate is necessary because finish-day accepts any at ?t in the enumerated set.)
    ;; (The finish action's precondition is simply (at traveler ?loc ?t).)

    ;; ---------
    ;; Explicitly encode constraints that ensure orders invoked in the candidate itineraries are enforced
    ;; via the available can-travel and can-meet predicates only (no other transitions are defined).
    ;; Thus the solver cannot reorder actions in a way that violates the time progression built into the timepoints.
  )

  ;; Objective: minimize total-cost (meeting actions reduce cost by 1 each).
  (:metric minimize (total-cost))

  ;; Goal: reach a finished state (the planner may apply meeting actions before finishing to reduce total-cost)
  (:goal (and (finished)))
)