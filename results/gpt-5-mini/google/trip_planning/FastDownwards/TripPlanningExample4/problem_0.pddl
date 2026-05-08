; Problem: 12-day itinerary (Option A chosen and assumptions stated below)
; Assumptions (explicit):
;  - We adopt "Option A" from the itinerary suggestions:
;      * Seville: days 1–7 (7 days preserved)
;      * Munich: days 8–10 (3 days)
;      * Tallinn: days 11–12 (2 days; meeting must occur on day 11)
;    This resolves the 14-day preference sum down to the required 12 days by reducing
;    Munich from 5 to 3 days and preserving Seville 7 days.
;  - Starting location: the traveler is in Seville at the start of day1.
;  - Flight model: direct flights are instantaneous for the day-transition model used here.
;    A flight action consumes the transition from a day to its successor (for example,
;    a flight between day7 and day8 makes the traveler be in the destination at day8).
;    Same-day chaining of two flights is not required in this plan; each flight occupies
;    a single day-to-successor transition.
;  - Only direct edges provided in the flight graph are permitted. No direct Seville<->Tallinn.
;  - Every day must be assigned by explicit at-facts in the plan; the goal enforces the exact
;    city for each day (contiguity of visits is enforced by the day-successor chain and actions).
;  - All preferences have been encoded as hard constraints (no penalty or shortfall constructs).
;
; Notes on causality and ordering:
;  - The successor relation (suc) enforces the ordered sequence of days.
;  - The goal fixes the city for each day, so the planner cannot reorder or split these blocks.

(define (problem trip-option-A)
  (:domain direct-flight-itinerary)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    seville munich tallinn - city
  )

  (:init
    ; day ordering
    (suc day1 day2) (suc day2 day3) (suc day3 day4) (suc day4 day5)
    (suc day5 day6) (suc day6 day7) (suc day7 day8) (suc day8 day9)
    (suc day9 day10) (suc day10 day11) (suc day11 day12)

    ; direct-flight graph (bidirectional edges per scheduler assumptions)
    (edge seville munich)
    (edge munich seville)
    (edge munich tallinn)
    (edge tallinn munich)

    ; starting location (assumption: start in Seville on day1)
    (at day1 seville)
  )

  ; Goal: enforce the exact, contiguous day allocations (Option A)
  (:goal (and
    ; Seville days 1–7
    (at day1 seville)
    (at day2 seville)
    (at day3 seville)
    (at day4 seville)
    (at day5 seville)
    (at day6 seville)
    (at day7 seville)

    ; Munich days 8–10
    (at day8 munich)
    (at day9 munich)
    (at day10 munich)

    ; Tallinn days 11–12 (meeting on day11 satisfied)
    (at day11 tallinn)
    (at day12 tallinn)
  ))
)