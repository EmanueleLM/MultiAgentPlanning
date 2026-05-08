(define (problem trip_plan)
  (:domain trip_planning)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 - count
  )
  (:init
    ;; Initial day
    (is_day_1 d1)

    ;; Day transitions
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14)

    ;; Counter transitions
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
    (next_count n4 n5) (next_count n5 n6) (next_count n6 n7) (next_count n7 n8)
    (next_count n8 n9) (next_count n9 n10) (next_count n10 n11) (next_count n11 n12)
    (next_count n12 n13) (next_count n13 n14)

    ;; City counts start at 0
    (visit_count florence n0)
    (visit_count barcelona n0)
    (visit_count helsinki n0)

    ;; Flight routes
    (can_fly barcelona florence) (can_fly florence barcelona)
    (can_fly helsinki barcelona) (can_fly barcelona helsinki)

    ;; Meeting window in Florence
    (is_friend_window d9)
    (is_friend_window d10)
    (is_friend_window d11)
    (is_friend_window d12)
    (is_friend_window d13)
    (is_friend_window d14)
  )
  (:goal
    (and
      (current_day d14)
      (friend_met)
      (visit_count florence n6)
      (visit_count barcelona n5)
      (visit_count helsinki n5)
    )
  )
)