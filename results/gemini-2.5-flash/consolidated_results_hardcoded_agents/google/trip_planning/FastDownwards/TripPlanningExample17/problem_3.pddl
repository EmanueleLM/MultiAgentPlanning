(define (problem trip-17-itinerary)
  (:domain trip-planning-17)
  (:objects
    d01 d02 d03 d04 d05 d06 d07 d08 d09 d10 d11 d12 - day
  )

  (:init
    ; Initial Day and Location
    (current_day d01)
    (at cph)

    ; Day sequence (11 days of activity ending state D12)
    (next_day d01 d02) (next_day d02 d03) (next_day d03 d04) (next_day d04 d05)
    (next_day d05 d06) (next_day d06 d07) (next_day d07 d08) (next_day d08 d09)
    (next_day d09 d10) (next_day d10 d11) (next_day d11 d12)

    ; Connectivity (CPH-VIE, VIE-LYS, bi-directional)
    (connected cph vie) (connected vie cph)
    (connected vie lys) (connected lys vie)

    ; Constraints: CPH Conference Fixed Days (Trip Days 1 and 5)
    (conference_required d01 cph)
    (conference_required d05 cph)
    (not (conference_attended d01))
    (not (conference_attended d05))

    ; Stay duration initialization
    (= (stay_count cph) 0)
    (= (stay_count vie) 0)
    (= (stay_count lys) 0)
    
    ; Required stay duration (CPH=5, VIE=2, LYS=2, based on 11 total days and 2 travel days)
    (= (required_stay cph) 5)
    (= (required_stay vie) 2)
    (= (required_stay lys) 2)
    
    ; Flags initialization
    (not (all_conferences_done))
    (not (required_stay_met cph))
    (not (required_stay_met vie))
    (not (required_stay_met lys))

    ; Total duration initialization
    (= (total-duration) 0)

    ; City finished tracking
    (not (city_finished cph))
    (not (city_finished vie))
    (not (city_finished lys))
  )

  (:goal (and
    (current_day d12) ; Ensure 11 full days of activity have been planned
    (= (total-duration) 11) ; Total trip duration must be exactly 11 days
    
    ; Stay duration requirements met
    (required_stay_met cph)
    (required_stay_met vie)
    (required_stay_met lys)

    ; Trip sequence completed (CPH->VIE->LYS assumed)
    (city_finished cph)
    (city_finished vie)
    (at lys)
  ))
)