(define (problem TripPlanningExample28)
    (:domain trip_planning)
    (:objects
        venice florence zurich - city
        d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day_count
    )
    (:init
        ; Define direct flight connections as per problem statement
        (direct_flight venice zurich)
        (direct_flight zurich venice)
        (direct_flight zurich florence)

        ; Define the progression of day counts
        (next_day d0 d1)
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

        ; Initial state:
        ; Total days spent is 0
        (current_total_days d0)
        ; Days spent in each city is 0
        (days_in_venice d0)
        (days_in_florence d0)
        (days_in_zurich d0)
        ; The trip has not yet started
        (trip_not_started)
        ; No traveler_at or has_spent_day_in predicates are true initially
    )
    (:goal (and
        ; The total trip duration must be exactly 12 days
        (current_total_days d12)
        ; As per the orchestrator's directive to resolve the 14-day desired stay
        ; (6+6+2) vs. 12-day limit, the stays are adjusted to:
        ; Venice: 6 days (desired 6)
        ; Florence: 5 days (desired 6, reduced by 1)
        ; Zurich: 1 day (desired 2, reduced by 1, while ensuring at least 1 day for a visit)
        (days_in_venice d6)
        (days_in_florence d5)
        (days_in_zurich d1)
        ; All three cities must be visited (implicitly covered by days_in_city goals > d0)
        (has_spent_day_in venice)
        (has_spent_day_in florence)
        (has_spent_day_in zurich)
    ))
)