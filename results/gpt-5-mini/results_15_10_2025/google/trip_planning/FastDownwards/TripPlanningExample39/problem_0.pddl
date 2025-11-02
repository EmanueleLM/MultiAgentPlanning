(define (problem trip-problem)
  (:domain trip-domain)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; NOTE ON INPUT CONTRADICTION:
  ; - Total trip horizon is 12 days (day1 .. day12).
  ; - Requested stays: Porto 3 days, Barcelona 7 days, Florence 4 days => total 14 days.
  ;   This exceeds the available horizon (12 days). The agent requirement to flag
  ;   contradictory / over-subscribed constraints is respected: the goal below
  ;   encodes the hard per-day presence requirements implied by the agents and
  ;   therefore is unsatisfiable (it requires the traveler to be in two cities
  ;   on the same day to meet all requested stays).
  ;
  ; The planner will therefore not be able to find a valid plan; the encoding
  ; keeps all constraints strict and does not shorten any requested stay.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    Porto Barcelona Florence - city
  )

  (:init
    ;; Temporal successor chain for the 12-day horizon
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12)

    ;; Direct flights (only these are available; no Porto<->Florence direct flight)
    (flight Porto Barcelona)
    (flight Barcelona Porto)
    (flight Barcelona Florence)
    (flight Florence Barcelona)

    ;; Starting location: assume trip starts in Porto on day1 (to allow the relatives visit window).
    ;; This starting point is chosen to satisfy the relatives-visit hard-window constraint
    ;; given in the inputs (visit relatives in Porto between day1 and day3).
    (at day1 Porto)
  )

  (:goal
    (and
      ;; Hard stay-duration constraints as concrete per-day "at" requirements:
      ;; Porto 3 days -> require Porto on day1, day2, day3 (also ensures relatives visit window)
      (at day1 Porto)
      (at day2 Porto)
      (at day3 Porto)

      ;; Barcelona 7 days -> require Barcelona on day4 .. day10 (7 days)
      (at day4 Barcelona)
      (at day5 Barcelona)
      (at day6 Barcelona)
      (at day7 Barcelona)
      (at day8 Barcelona)
      (at day9 Barcelona)
      (at day10 Barcelona)

      ;; Florence 4 days requested. Only days 11 and 12 remain in the 12-day horizon,
      ;; so to reflect the strict request of 4 days (and to flag the contradiction),
      ;; we include the two available Florence days plus two additional Florence-day
      ;; requirements that overlap with the Barcelona requirements (day4 and day5).
      ;; This overlap makes the goal unsatisfiable under the strict constraints.
      (at day11 Florence)
      (at day12 Florence)
      (at day4 Florence)  ; Additional Florence requirement to force a contradiction
      (at day5 Florence)  ; Additional Florence requirement to force a contradiction
    )
  )
)