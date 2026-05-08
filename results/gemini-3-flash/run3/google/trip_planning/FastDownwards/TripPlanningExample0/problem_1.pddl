(define (problem trip_planning_14_days)
  (:domain travel_planning)
  (:objects
    helsinki barcelona florence - city
    d01 d02 d03 d04 d05 d06 d07 d08 d09 d10 d11 d12 d13 d14 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )

  (:init
    ;; Days sequence
    (next_day d01 d02)
    (next_day d02 d03)
    (next_day d03 d04)
    (next_day d04 d05)
    (next_day d05 d06)
    (next_day d06 d07)
    (next_day d07 d08)
    (next_day d08 d09)
    (next_day d09 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)
    (next_day d13 d14)

    (is_first_day d01)
    (is_last_day d14)

    ;; Stay counts sequence
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)

    ;; All city counts start at zero
    (city_count helsinki c0)
    (city_count barcelona c0)
    (city_count florence c0)

    ;; Direct flight network
    (direct_flight barcelona florence)
    (direct_flight florence barcelona)
    (direct_flight helsinki barcelona)
    (direct_flight barcelona helsinki)

    ;; Friend meeting window in Florence
    (is_meeting_window d09)
    (is_meeting_window d10)
    (is_meeting_window d11)
    (is_meeting_window d12)
    (is_meeting_window d13)
    (is_meeting_window d14)
  )

  (:goal
    (and
      (trip_concluded)
      (met_friend)
      (city_count helsinki c5)
      (city_count barcelona c5)
      (city_count florence c6)
    )
  )
)