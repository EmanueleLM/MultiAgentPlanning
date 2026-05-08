(define (problem trip_10_days_3_cities)
  (:domain jack_of_all_trades_trip)

  (:objects
    venice porto dublin - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day

    venice_slot1 venice_slot2 venice_slot3 venice_slot4
    porto_slot1 porto_slot2 porto_slot3 porto_slot4
    dublin_slot1 dublin_slot2 dublin_slot3 dublin_slot4
    - slot
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
    (next day9 day10)

    ;; flights (only the given direct flights)
    (flight dublin porto)
    (flight porto dublin)
    (flight venice dublin)
    (flight dublin venice)

    ;; meet window days
    (in_meet_window day1)
    (in_meet_window day2)
    (in_meet_window day3)
    (in_meet_window day4)

    ;; slots belong to cities
    (slot_for venice_slot1 venice)
    (slot_for venice_slot2 venice)
    (slot_for venice_slot3 venice)
    (slot_for venice_slot4 venice)

    (slot_for porto_slot1 porto)
    (slot_for porto_slot2 porto)
    (slot_for porto_slot3 porto)
    (slot_for porto_slot4 porto)

    (slot_for dublin_slot1 dublin)
    (slot_for dublin_slot2 dublin)
    (slot_for dublin_slot3 dublin)
    (slot_for dublin_slot4 dublin)

    ;; all slots start unfilled
    (slot_unfilled venice_slot1)
    (slot_unfilled venice_slot2)
    (slot_unfilled venice_slot3)
    (slot_unfilled venice_slot4)

    (slot_unfilled porto_slot1)
    (slot_unfilled porto_slot2)
    (slot_unfilled porto_slot3)
    (slot_unfilled porto_slot4)

    (slot_unfilled dublin_slot1)
    (slot_unfilled dublin_slot2)
    (slot_unfilled dublin_slot3)
    (slot_unfilled dublin_slot4)
  )

  (:goal
    (and
      ;; full schedule coverage: every day must be assigned
      (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
      (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10)

      ;; exact city-day counts enforced by requiring all city slots to become filled
      ;; (i.e., exactly four venice slots, four porto slots, and four dublin slots must be bound)
      (not (slot_unfilled venice_slot1))
      (not (slot_unfilled venice_slot2))
      (not (slot_unfilled venice_slot3))
      (not (slot_unfilled venice_slot4))

      (not (slot_unfilled porto_slot1))
      (not (slot_unfilled porto_slot2))
      (not (slot_unfilled porto_slot3))
      (not (slot_unfilled porto_slot4))

      (not (slot_unfilled dublin_slot1))
      (not (slot_unfilled dublin_slot2))
      (not (slot_unfilled dublin_slot3))
      (not (slot_unfilled dublin_slot4))

      ;; meeting constraint: at least one venice day in the meet window must be assigned.
      ;; This is encoded by requiring the planner to make meet_satisfied true via actions
      ;; that assign a venice day within the meet window.
      (meet_satisfied)
    )
  )
)