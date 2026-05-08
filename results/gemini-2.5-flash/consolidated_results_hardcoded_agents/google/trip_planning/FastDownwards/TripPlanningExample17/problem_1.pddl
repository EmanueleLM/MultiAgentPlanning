(define (problem trip-17-itinerary)
  (:domain trip-planning-17)
  (:objects
    cph vie lys - city
    d01 d02 d03 d04 d05 d06 d07 d08 d09 d10 d11 d12 - day
  )

  (:init
    ; Initial Day and Location
    (day_is d01)
    (at cph)

    ; Day sequence (11 days of activity ending state D12)
    (next_day d01 d02) (next_day d02 d03) (next_day d03 d04) (next_day d04 d05)
    (next_day d05 d06) (next_day d06 d07) (next_day d07 d08) (next_day d08 d09)
    (next_day d09 d10) (next_day d10 d11) (next_day d11 d12)

    ; Connectivity (CPH-VIE, VIE-LYS)
    (connected cph vie)
    (connected vie lys)

    ; Constraints: CPH Conference Fixed Days (Trip Days 1 and 5)
    (cph_conference_day d01)
    (cph_conference_day d05)

    ; Stay tracking initialization
    (= (stay_days cph) 0)
    (= (stay_days vie) 0)
    (= (stay_days lys) 0)

    ; Required stay duration (CPH=5, VIE=2, LYS=2, based on 11 total days and 2 travel days)
    (= (required_stay_days cph) 5)
    (= (required_stay_days vie) 2)
    (= (required_stay_days lys) 2)
    
    ; Total cost initialization
    (= (total-cost) 0)

    ; City finished tracking
    (not (city_finished cph))
    (not (city_finished vie))
    (not (city_finished lys))
  )

  (:goal (and
    (day_is d12) ; Ensure 11 full days of activity have been planned
    (= (total-cost) 11) ; Total trip duration must be exactly 11 days
    
    ; Stay duration met for all cities
    (= (stay_days cph) 5)
    (= (stay_days vie) 2)
    (= (stay_days lys) 2)

    ; Conferences attended
    (conference_done d01)
    (conference_done d05)
    
    ; Trip sequence completed (Must have reached LYS via sequential travel)
    (city_finished cph)
    (city_finished vie)
    (city_finished lys)
    (at lys)
  ))
)