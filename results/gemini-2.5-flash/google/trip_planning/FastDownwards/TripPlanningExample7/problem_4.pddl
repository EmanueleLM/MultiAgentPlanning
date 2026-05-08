(define (problem trip_planning_example7)
    (:domain trip_planning)
    (:objects
        traveler - person
        venice dubrovnik istanbul - city

        ;; Day level objects for global trip duration (0 to 11 days)
        d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day_level

        ;; Day counter objects for Venice stays (0 to 6 days)
        v0 v1 v2 v3 v4 v5 v6 - venice_day_counter

        ;; Day counter objects for Dubrovnik stays (0 to 4 days)
        db0 db1 db2 db3 db4 - dubrovnik_day_counter

        ;; Day counter objects for Istanbul stays (0 to 3 days)
        i0 i1 i2 i3 - istanbul_day_counter
    )
    (:init
        ;; Initial location of the traveler.
        (at traveler dubrovnik)

        ;; Initialize global trip day counter
        (current_day_level d0)
        (is_next_day d0 d1) (is_next_day d1 d2) (is_next_day d2 d3)
        (is_next_day d3 d4) (is_next_day d4 d5) (is_next_day d5 d6)
        (is_next_day d6 d7) (is_next_day d7 d8) (is_next_day d8 d9)
        (is_next_day d9 d10) (is_next_day d10 d11)

        ;; Initialize Venice stay day counter
        (current_venice_stay_count v0)
        (is_next_venice_day v0 v1) (is_next_venice_day v1 v2)
        (is_next_venice_day v2 v3) (is_next_venice_day v3 v4)
        (is_next_venice_day v4 v5) (is_next_venice_day v5 v6)

        ;; Initialize Dubrovnik stay day counter
        (current_dubrovnik_stay_count db0)
        (is_next_dubrovnik_day db0 db1) (is_next_dubrovnik_day db1 db2)
        (is_next_dubrovnik_day db2 db3) (is_next_dubrovnik_day db3 db4)

        ;; Initialize Istanbul stay day counter
        (current_istanbul_stay_count i0)
        (is_next_istanbul_day i0 i1) (is_next_istanbul_day i1 i2)
        (is_next_istanbul_day i2 i3)

        ;; Define known direct flight paths
        (flight_path dubrovnik istanbul)
        (flight_path dubrovnik venice)

        ;; The starting city is considered visited initially.
        (has_visited dubrovnik)
    )
    (:goal (and
        ;; Goal: All specified cities must be visited at least once.
        (has_visited venice)
        (has_visited istanbul)
        ;; The total trip duration must not exceed 11 days.
        ;; This is implicitly handled by the absence of is_next_day for d11,
        ;; preventing further actions after 11 days are spent.
        ;; The goal does not explicitly force d11, allowing plans shorter than 11 days if all other goals are met.
    ))
)