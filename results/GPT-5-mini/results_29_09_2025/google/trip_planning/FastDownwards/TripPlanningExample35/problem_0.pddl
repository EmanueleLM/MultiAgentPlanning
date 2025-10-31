(define (problem itinerary-problem)
  (:domain itinerary)

  ;; ----- Objects -----
  ;; Add your person (traveler), all cities, and day objects day1 .. day10
  ;; Example: traveler - person; zagreb split dubrovnik - city; day1 day2 ... day10 - day
  (:objects
    TRAV - person
    ;--- PUT YOUR CITY NAMES HERE, e.g. zagreb split dubrovnik ---;
    ; Example:
    ; zagreb split dubrovnik rome - city
    ;--- DAYS: fixed 10-day horizon ---;
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; ----- day ordering (fixed 10-day horizon) -----
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    ;; ----- direct flights: list all allowed directed edges -----
    ;; Example format:
    ;; (direct zagreb split)
    ;; (direct split zagreb)
    ;; (direct split dubrovnik)
    ;; Add your scheduler's edges here (only direct flights allowed)

    ;; ----- initial location: traveler at start city on day1 -----
    ;; Example: (at TRAV zagreb day1)

    ;; IMPORTANT: Do NOT invent flights or city availability beyond what the scheduler gave.
  )

  ;; ----- Goals encoding notes -----
  ;; - Encode desired stays as day-level goals. If traveler wants to stay k days in CITY,
  ;;   add k distinct day-level goals that require TRAV to be in CITY on those days.
  ;;   Example: to require 2 days in ZAGREB: (at TRAV zagreb day1) (at TRAV zagreb day2)
  ;;
  ;; - Enforce the relatives' visit window in DUBROVNIK by a disjunctive goal listing
  ;;   the allowed day(s) in the window. For example, if the window is days 6..8:
  ;;   (or (at TRAV dubrovnik day6) (at TRAV dubrovnik day7) (at TRAV dubrovnik day8))
  ;;   This is a hard constraint (must be satisfied).
  ;;
  ;; - If the traveler's desired stays exceed 10 days in total, this is a conflict.
  ;;   We will not invent relaxations automatically. Options:
  ;;     * You mark some stays as flexible so I can trim them.
  ;;     * Or I will produce a report showing the infeasibility so you can adjust.
  ;;
  ;; - Only direct flights are allowed because the fly action requires (direct ?from ?to).

  (:goal
    (and
      ;; --- Replace the following example goals with your required day-level facts ---
      ;; EXAMPLES (remove or replace):
      ;; (at TRAV zagreb day1)
      ;; (at TRAV zagreb day2)
      ;; (at TRAV split day3)
      ;; (or (at TRAV dubrovnik day6) (at TRAV dubrovnik day7) (at TRAV dubrovnik day8))

      ;; ----- TODO: Put your concrete per-day goals here -----
    )
  )
)