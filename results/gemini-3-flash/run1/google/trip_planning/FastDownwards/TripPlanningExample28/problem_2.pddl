(define (problem trip_planning_example_28)
  (:domain trip_planning)
  (:objects
    venice florence zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )

  (:init
    (not_started)
    (current_day d1)
    (stay_count venice c0)
    (stay_count florence c0)
    (stay_count zurich c0)

    ;; Flight connections
    ;; "Venice and Zurich" implies bidirectional flights
    (flight venice zurich)
    (flight zurich venice)
    ;; "from Zurich to Florence" implies a one-way flight
    (flight zurich florence)

    ;; Successor relations for days
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
    (next_day d14 d15)

    ;; Successor relations for stay counts
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
  )

  (:goal
    (and
      ;; The problem specifies 12 days in total.
      ;; Starting at d1, after 12 days of stays, the current_day becomes d13.
      (current_day d13)
      ;; Visit Venice for 6 days.
      (stay_count venice c6)
      ;; Visit Florence for 6 days.
      (stay_count florence c6)
      ;; Stay in Zurich for 2 days.
      (stay_count zurich c2)
    )
  )
)