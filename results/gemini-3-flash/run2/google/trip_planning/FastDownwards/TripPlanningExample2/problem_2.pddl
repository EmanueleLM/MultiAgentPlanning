(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    reykjavik vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 - num
  )
  (:init
    (not_started)
    (is_day1 d1)
    (is_num0 n0)
    (is_num1 n1)

    ;; Initialize visit counts for all cities to 0
    (visit_count reykjavik n0)
    (visit_count vienna n0)
    (visit_count venice n0)

    ;; Day sequence
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

    ;; Number sequence for counting visits
    (next_num n0 n1)
    (next_num n1 n2)
    (next_num n2 n3)
    (next_num n3 n4)
    (next_num n4 n5)
    (next_num n5 n6)
    (next_num n6 n7)
    (next_num n7 n8)
    (next_num n8 n9)
    (next_num n9 n10)
    (next_num n10 n11)

    ;; Flight routes
    (has_flight reykjavik vienna)
    (has_flight vienna reykjavik)
    (has_flight vienna venice)
    (has_flight venice vienna)
  )
  (:goal
    (and
      ;; Visit Reykjavik for exactly 2 days
      (visit_count reykjavik n2)
      ;; Visit Vienna for exactly 7 days
      (visit_count vienna n7)
      ;; Visit Venice for exactly 4 days
      (visit_count venice n4)
      ;; Be in Venice during the wedding period (days 8 to 11)
      (visited venice d8)
      (visited venice d9)
      (visited venice d10)
      (visited venice d11)
      ;; Ensure the trip reaches the final day
      (at_city venice d11)
    )
  )
)