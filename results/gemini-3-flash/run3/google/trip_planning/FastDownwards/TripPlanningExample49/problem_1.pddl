(define (problem trip_planning_problem)
  (:domain trip_planning_domain)
  (:objects
    milan reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    n0 n1 n2 n3 n4 n5 n6 n7 - count
  )
  (:init
    ;; Starting location and time
    (is_at split)
    (is_current_day d1)

    ;; Initial day counts for each city
    (has_day_count milan n0)
    (has_day_count reykjavik n0)
    (has_day_count split n0)

    ;; Successor relations for days (13 days total)
    (is_next_day d1 d2)
    (is_next_day d2 d3)
    (is_next_day d3 d4)
    (is_next_day d4 d5)
    (is_next_day d5 d6)
    (is_next_day d6 d7)
    (is_next_day d7 d8)
    (is_next_day d8 d9)
    (is_next_day d9 d10)
    (is_next_day d10 d11)
    (is_next_day d11 d12)
    (is_next_day d12 d13)
    (is_next_day d13 d14)

    ;; Successor relations for counters
    (is_next_count n0 n1)
    (is_next_count n1 n2)
    (is_next_count n2 n3)
    (is_next_count n3 n4)
    (is_next_count n4 n5)
    (is_next_count n5 n6)
    (is_next_count n6 n7)

    ;; Flight connectivity
    (can_fly milan reykjavik)
    (can_fly reykjavik milan)
    (can_fly split milan)
    (can_fly milan split)

    ;; Specific Split requirement for Days 1 to 3
    (must_be_in_split d1)
    (must_be_in_split d2)
    (must_be_in_split d3)

    ;; No mandatory Split requirement for the remaining days
    (not_must_be_in_split d4)
    (not_must_be_in_split d5)
    (not_must_be_in_split d6)
    (not_must_be_in_split d7)
    (not_must_be_in_split d8)
    (not_must_be_in_split d9)
    (not_must_be_in_split d10)
    (not_must_be_in_split d11)
    (not_must_be_in_split d12)
    (not_must_be_in_split d13)
  )
  (:goal
    (and
      ;; Ensure the trip lasted exactly 13 days (reached the end state d14)
      (is_current_day d14)
      ;; Visit Split for exactly 3 days
      (has_day_count split n3)
      ;; Visit Milan for exactly 7 days
      (has_day_count milan n7)
      ;; Visit Reykjavik for exactly 5 days
      (has_day_count reykjavik n5)
    )
  )
)