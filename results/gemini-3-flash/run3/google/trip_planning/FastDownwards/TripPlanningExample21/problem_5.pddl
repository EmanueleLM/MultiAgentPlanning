(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    vienna venice mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    n0 n1 n2 n3 n4 n5 n6 - count
  )
  (:init
    (at mykonos)
    (current_day d1)
    (total_visits vienna n0)
    (total_visits venice n0)
    (total_visits mykonos n0)
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11)
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
    (next_count n4 n5) (next_count n5 n6)
    (flight mykonos vienna) (flight vienna mykonos)
    (flight vienna venice) (flight venice vienna)
  )
  (:goal
    (and
      (current_day d11)
      (total_visits mykonos n2)
      (total_visits vienna n4)
      (total_visits venice n6)
      (visited venice d5)
      (visited venice d6)
      (visited venice d7)
      (visited venice d8)
      (visited venice d9)
      (visited venice d10)
    )
  )
)