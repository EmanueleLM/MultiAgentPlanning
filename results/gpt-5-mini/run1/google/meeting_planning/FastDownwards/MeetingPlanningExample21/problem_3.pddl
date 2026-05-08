(define (problem meet-sam-and-margaret)
  (:domain meetup)

  (:objects
    traveler - agent
    friend_sam friend_margaret - friend
    mission_district haight_ashbury - location
    t0900 t0912 t0930 t0942 t1012 t1545 t1800 - time
  )

  (:init
    ;; start: traveler is at Mission District at 09:00
    (at traveler mission_district t0900)

    ;; travel availability (explicit allowed transitions)
    ;; Mission District -> Haight-Ashbury takes 12 minutes
    (can_travel_md_haight t0900 t0912)
    (can_travel_md_haight t0930 t0942)

    ;; Haight-Ashbury -> Mission District (none required for the canonical plan, but kept empty)
    ;; (can_travel_haight_md ... ) omitted except if needed

    ;; Sam availability at Mission District: 09:00 - 10:00
    ;; provide an explicit meeting slot 09:00 -> 09:30
    (can_meet_sam t0900 t0930)

    ;; Margaret availability at Haight-Ashbury: 08:00 - 15:45
    ;; she requires at least 30 minutes; provide candidate meeting slots aligned with travel times:
    ;; arrive at Haight at 09:12 if leaving Mission at 09:00
    (can_meet_margaret t0912 t0942)
    ;; or arrive at Haight at 09:42 if meeting Sam until 09:30 then traveling 09:30-09:42
    (can_meet_margaret t0942 t1012)
    ;; allow a continuous 09:12-10:12 meeting option
    (can_meet_margaret t0912 t1012)
  )

  ;; Goal: meet both friends and finish (this yields the maximal feasible count for this instance)
  (:goal (and (met_sam) (met_margaret) (finished)))
)