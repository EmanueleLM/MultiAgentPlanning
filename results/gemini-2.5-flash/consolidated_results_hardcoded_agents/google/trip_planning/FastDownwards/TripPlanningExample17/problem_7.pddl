(define (problem trip-17-itinerary)
  (:domain trip-planning-17)
  (:objects
    d01 d02 d03 d04 d05 d06 d07 d08 d09 d10 d11 d12 - day
    c0 c1 c2 c3 c4 c5 - count ; Renamed from k to c
  )

  (:init
    ; Initial Day and Location
    (current_day d01)
    (at cph)

    ; Day sequence (11 days of activity ending state D12)
    (next_day d01 d02) (next_day d02 d03) (next_day d03 d04) (next_day d04 d05)
    (next_day d05 d06) (next_day d06 d07) (next_day d07 d08) (next_day d08 d09)
    (next_day d09 d10) (next_day d10 d11) (next_day d11 d12)
    
    ; Count Successors (c0 up to c5)
    (successor c0 c1) (successor c1 c2) (successor c2 c3) (successor c3 c4) (successor c4 c5)

    ; Connectivity (CPH-VIE, VIE-LYS, bi-directional)
    (connected cph vie) (connected vie cph)
    (connected vie lys) (connected lys vie)

    ; Constraints: CPH Conference Fixed Days (Trip Days 1 and 5)
    (conference_required d01 cph)
    (conference_required d05 cph)
    (not (conference_attended d01))
    (not (conference_attended d05))

    ; Stay duration initialization (CPH=5, VIE=2, LYS=2 required)
    (cph_stay_count c0)
    (vie_stay_count c0)
    (lys_stay_count c0)
    
    ; Flags initialization
    (not (required_stay_met cph))
    (not (required_stay_met vie))
    (not (required_stay_met lys))

    ; City finished tracking
    (not (city_finished cph))
    (not (city_finished vie))
    (not (city_finished lys))
  )

  (:goal (and
    (current_day d12) 
    
    ; Stay duration requirements met (CPH=5, VIE=2, LYS=2)
    (required_stay_met cph)
    (required_stay_met vie)
    (required_stay_met lys)
    
    ; Conferences must be attended
    (conference_attended d01)
    (conference_attended d05)

    ; Sequence completed (Based on starting at CPH and sequential travel)
    (city_finished cph)
    (city_finished vie)
    (at lys)
  ))
)