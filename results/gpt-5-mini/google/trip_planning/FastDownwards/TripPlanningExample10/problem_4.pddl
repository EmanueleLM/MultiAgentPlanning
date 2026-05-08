(define (problem trip-9days)
  (:domain trip-planning)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ;; day ordering
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ;; available direct flights (public information)
    (flight_allowed oslo dublin)
    (flight_allowed dublin oslo)
    (flight_allowed dublin valencia)
    (flight_allowed valencia dublin)

    ;; starting location: present in Oslo on day1
    (present oslo day1)
  )

  ;; The human-specified hard requirements are encoded below.
  ;; Note: these constraints are mutually inconsistent with the 9-day horizon
  ;; because they demand 3 + 5 + 3 = 11 total days of presence across three cities.
  ;; The planner will report "no plan" for this problem, which correctly reflects
  ;; the inconsistency of the specification.

  (:goal (and
    ;; Oslo: exactly 3 days requested by planner_oslo --> here encoded as presence on day1..day3
    (present oslo day1)
    (present oslo day2)
    (present oslo day3)

    ;; Dublin: exactly 3 days requested by planner_dublin
    ;; (planner_dublin did not fix exact day indices; to make the requirement explicit
    ;; within the 9-day discrete-time encoding we require presence on day4..day6)
    (present dublin day4)
    (present dublin day5)
    (present dublin day6)

    ;; Valencia: exactly 5 days requested by planner_valencia, with relatives visit between day5..day9.
    ;; To satisfy the relatives' window and the 5-day duration we require presence on day5..day9.
    (present valencia day5)
    (present valencia day6)
    (present valencia day7)
    (present valencia day8)
    (present valencia day9)
  ))
)