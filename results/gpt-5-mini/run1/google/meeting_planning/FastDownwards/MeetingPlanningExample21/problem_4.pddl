(define (problem meet-sam-and-margaret)
  (:domain meetup)

  (:objects
    traveler - agent
    mission_district haight_ashbury - location
    t0900 t0912 t0930 t0942 t1012 t1545 t1800 - time
  )

  (:init
    ;; start: traveler is at Mission District at 09:00
    (at traveler mission_district t0900)

    ;; travel connections (explicit allowed transitions)
    ;; Mission District -> Haight-Ashbury takes 12 minutes
    (can_travel_md_haight t0900 t0912)
    (can_travel_md_haight t0930 t0942)

    ;; (No reverse travel needed for the feasible plan, but predicate kept available if extended)
    ;; Example reverse leg could be added like (can_travel_haight_md t0942 t0953) if desired.

    ;; Sam availability at Mission District: 09:00 - 10:00
    ;; provide a 30-minute meeting slot 09:00 -> 09:30
    (can_meet_sam t0900 t0930)

    ;; Margaret availability at Haight-Ashbury: 08:00 - 15:45
    ;; she requires at least 30 minutes; provide candidate meeting slots consistent with travel:
    ;; arriving directly from Mission at 09:12 if leaving at 09:00
    (can_meet_margaret t0912 t0942)
    ;; arriving after meeting Sam (09:30) and traveling (09:30->09:42)
    (can_meet_margaret t0942 t1012)
    ;; allow a longer continuous option spanning 09:12-10:12 (still within her availability)
    (can_meet_margaret t0912 t1012)
  )

  ;; Hard goal: meet both friends (feasible given the times and travel legs provided)
  (:goal (and (met_sam) (met_margaret)))
)