(define (problem trip_planning_example_28)
  (:domain trip_planning)
  (:objects
    venice florence zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )

  (:init
    (not_started)
    (current_day d1)
    (visit_count venice c0)
    (visit_count florence c0)
    (visit_count zurich c0)

    ;; Flight connections
    ;; "Venice and Zurich" implies bidirectional connectivity.
    (flight venice zurich)
    (flight zurich venice)
    ;; "from Zurich to Florence" implies one-way connectivity.
    (flight zurich florence)

    ;; Successor relations for days (12 days total, so clock ends at d13)
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

    ;; Successor relations for stay counts (maximum required is 6)
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
  )

  (:goal
    (and
      ;; Total trip duration of 12 days.
      (current_day d13)
      ;; Specific stay requirements.
      (visit_count venice c6)
      (visit_count florence c6)
      (visit_count zurich c2)
    )
  )
)