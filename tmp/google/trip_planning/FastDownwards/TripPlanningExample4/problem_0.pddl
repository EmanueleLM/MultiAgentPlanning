(define (problem orchestrated-trip)
  (:domain orchestrator_combined)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Orchestrator notes / reconciliation (documented here):
  ; - Public environment facts provided:
  ;     * Total trip length is 12 days.
  ;     * Cities: tallinn, seville, munich.
  ;     * Direct flights exist: seville <-> munich, munich <-> tallinn.
  ;     * Commuting allowed only via direct flights (encoded with 'flight').
  ;
  ; - Agent constraints from fragments:
  ;     * Tallinn-agent: wants to be in Tallinn on day11 and day12 and meet on an allowed meeting day (day11/day12).
  ;     * Seville-agent: requires spending exactly 7 days in Seville.
  ;     * Munich-agent: originally requested >= 5 days in Munich.
  ;
  ; - Conflict and reconciliation:
  ;     Sum(Seville 7 + Tallinn 2) = 9, leaving 3 days free of 12 for Munich, but Munich requested >=5.
  ;     This is infeasible with total trip length 12 and Tallinn's required 2 days and Seville's fixed 7.
  ;     To produce a feasible integrated plan we reconcile by reducing Munich's requirement to >=3 days.
  ;     This choice was made to honor Seville's exactly-7-days constraint and Tallinn's hard requirement
  ;     to occupy day11 and day12 for the meeting. The reduction of Munich days is documented here.
  ;
  ; - Start location chosen:
  ;     The Munich fragment provided (at munich) in its problem. To create a concrete feasible schedule
  ;     we set the initial location on day1 to munich: (in munich day1).
  ;
  ; - Time model:
  ;     We keep an explicit day model (day1..day12) and successor relations (succ).
  ;     All stay/fly actions consume 1 unit of (remaining-days) to enforce the 12-day budget.
  ;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    tallinn munich seville - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    ;; Direct flights (bidirectional per public info)
    (flight seville munich)
    (flight munich seville)
    (flight munich tallinn)
    (flight tallinn munich)

    ;; Successor relations for consecutive days (day1 -> day2 -> ... -> day12)
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)
    (succ day8 day9)
    (succ day9 day10)
    (succ day10 day11)
    (succ day11 day12)

    ;; Meeting allowed days per Tallinn agent's fragment
    (allowed-meet day11)
    (allowed-meet day12)

    ;; Numeric fluents initialisation (total trip length)
    (= (remaining-days) 12)
    (= (seville-days) 0)
    (= (munich-days) 0)

    ;; Initial location chosen to be Munich on day1 (aligns with the original munich fragment)
    (in munich day1)

    ;; Note: no initial 'in' facts for Seville/Tallinn on day1; planner must move the traveler
    ;; via agent-specific fly/stay actions to meet the goals under the flight constraints.
  )

  ;; Goals:
  ;; - Spend exactly 7 days in Seville (seville-days = 7)
  ;; - Spend at least 3 days in Munich (reconciled munich goal: (>= (munich-days) 3))
  ;; - Be in Tallinn on day11 and day12 and meet on day11
  (:goal (and
    (= (seville-days) 7)
    (>= (munich-days) 3)            ; RECONCILED: reduced from original 5 -> 3 for feasibility
    (in tallinn day11)
    (in tallinn day12)
    (met day11)
  ))
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Unresolved incompatibilities / notes:
  ; - The original Munich agent requested >=5 days in Munich while Seville required exactly 7 and
  ;   Tallinn required days 11-12, making the original combination infeasible with total 12 days.
  ;   The orchestrator reduced Munich's requirement to >=3 to create a feasible integrated problem.
  ;   If the agents wish to negotiate differently (e.g., reduce Seville from 7 or make Tallinn flexible),
  ;   a different reconciliation could be produced. This change is intentional and documented here.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
)