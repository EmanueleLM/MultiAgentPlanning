(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    stockholm athens mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 - count
  )
  (:init
    ;; Starting location and initial time
    (at_city stockholm)
    (current_day d1)

    ;; Stay counts for each city starting at 0
    (count_stockholm n0)
    (count_athens n0)
    (count_mykonos n0)

    ;; Temporal sequence of days (for a 13-day trip)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)
    (next_day d13 d14)

    ;; Counter sequence
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)
    (next_count n7 n8)
    (next_count n8 n9)
    (next_count n9 n10)
    (next_count n10 n11)
    (next_count n11 n12)
    (next_count n12 n13)
    (next_count n13 n14)
    (next_count n14 n15)

    ;; Available direct flight routes (bidirectional)
    (can_fly stockholm athens)
    (can_fly athens stockholm)
    (can_fly athens mykonos)
    (can_fly mykonos athens)

    ;; Explicit temporal constraints for Stockholm conference
    (is_day_1 d1)
    (is_day_6 d6)
  )
  (:goal
    (and
      ;; Total stay requirements: 6 days in Stockholm, 5 in Athens, 4 in Mykonos.
      ;; Note: Sum is 15, while trip duration is 13.
      (count_stockholm n6)
      (count_athens n5)
      (count_mykonos n4)
      ;; Ensure trip concludes after 13 days.
      (current_day d14)
    )
  )
)