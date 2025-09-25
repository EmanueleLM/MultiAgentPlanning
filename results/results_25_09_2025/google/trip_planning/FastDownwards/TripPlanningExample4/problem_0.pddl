(define (problem trip-12days)
  (:domain trip-orchestration)
  (:objects
    tallinn_agent seville_agent munich_agent - agent
    tallinn seville munich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  ; ---------------------------
  ; Initial state
  ; ---------------------------
  (:init
    ; successor (discrete days)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12)

    ; direct flights (as given by environment)
    ; Seville <-> Munich
    (direct-flight seville munich)
    (direct-flight munich seville)
    ; Munich <-> Tallinn
    (direct-flight munich tallinn)
    (direct-flight tallinn munich)

    ; Initial assumption: all agents start in Seville on day1.
    ; This is an explicit assumption because initial start cities were not provided.
    (at seville_agent seville day1)
    (at munich_agent seville day1)
    (at tallinn_agent seville day1)
  )

  ; ---------------------------
  ; Goal specification
  ; ---------------------------
  ; The orchestrator global goal (as interpreted and reconciled):
  ; - seville_agent visits Seville for 7 days (day1..day7)
  ; - munich_agent stays in Munich for 3 days (day8..day10)  <-- reduced from requested 5 days
  ; - tallinn_agent visits Tallinn for 2 days (day11..day12) and meets friend during that visit
  ; The total scheduled days sum to 12 (7 + 3 + 2 = 12).
  (:goal
    (and
      ; Seville agent: days 1..7 in Seville (agent's private goal)
      (at seville_agent seville day1)
      (at seville_agent seville day2)
      (at seville_agent seville day3)
      (at seville_agent seville day4)
      (at seville_agent seville day5)
      (at seville_agent seville day6)
      (at seville_agent seville day7)

      ; Munich agent: days 8..10 in Munich (note: reconciled to 3 days to fit total trip length)
      (at munich_agent munich day8)
      (at munich_agent munich day9)
      (at munich_agent munich day10)

      ; Tallinn agent: days 11..12 in Tallinn (private goal: 2 days)
      (at tallinn_agent tallinn day11)
      (at tallinn_agent tallinn day12)

      ; Meeting friend constraint (must meet during Tallinn visit between day11 and day12)
      (met-friend)
    )
  )

; ---------------------------
; Comments and reconciliation notes
; ---------------------------
; The inputs from agents produce a semantic conflict:
; - tallinn_agent requested 2 days in Tallinn (satisfied: day11..day12) and meeting between day11 and day12 (satisfied via meet-friend action on day11 or day12).
; - seville_agent requested 7 days in Seville (satisfied: day1..day7).
; - munich_agent requested 5 days in Munich, but 7 + 2 + 5 = 14 > total trip length 12.
;
; Reconciliation decisions (explicit):
; 1) We prioritized fully satisfying tallinn_agent (both days and the meeting window) because the meeting window is tight (end of trip).
; 2) We also prioritized satisfying seville_agent's requested 7-day stay (day1..day7).
; 3) To respect the hard environment constraint "The total trip length is 12 days", we reduced munich_agent's stay to 3 days (day8..day10). This is an explicit compromise and therefore munich_agent's private goal (5 days) is not fully met.
;
; Assumptions (explicit, because inputs did not provide them):
; - Start locations for each agent were not provided. To allow a feasible, connected schedule using only the allowed direct flights, we assumed all agents start in Seville on day1.
;   This is required so that seville_agent can remain in Seville for days 1..7 and the other agents can use Seville->Munich->Tallinn flight links later.
;
; Notes on meeting friend:
; - The domain provides two meeting actions (meet-friend-tallinn-day11 and meet-friend-tallinn-day12).
; - The plan must invoke one of these actions while the tallinn_agent is at Tallinn on the corresponding day. In this problem we require (met-friend) in the goal; with the schedule above the planner should apply meet-friend-tallinn-day11 or meet-friend-tallinn-day12.
;
; Unresolved incompatibilities:
; - munich_agent's private request for 5 days in Munich cannot be satisfied simultaneously with seville_agent's 7 days and tallinn_agent's 2 days under the hard total-trip-length=12 constraint. The reduction to 3 days for munich_agent is an explicit reconciliation; this mismatch remains and is documented here.
;
)