(define (problem meet-sam-and-margaret)
  (:domain meetup)

  (:objects
    traveler - agent
    friend_sam friend_margaret - friend
    mission_district haight_ashbury - location
    t0900 t0912 t0930 t0942 t1012 t1545 t1800 - time
  )

  (:init
    ;; start state: traveler arrives at Mission District at 09:00
    (at traveler mission_district t0900)

    ;; numeric counter for number of friends met
    (= (total_met) 0)

    ;; travel availability (explicit allowed transitions)
    ;; travel Mission District -> Haight-Ashbury takes 12 minutes
    (can_travel_md_haight t0900 t0912)
    (can_travel_md_haight t0930 t0942)

    ;; travel Haight-Ashbury -> Mission District takes 11 minutes
    ;; (not needed for the canonical plans below but declared for completeness)
    (can_travel_haight_md t0942 t0953) ;; NOTE: t0953 not declared as time object, so not usable; omitted intentionally

    ;; Sam availability: at Mission District from 09:00 to 10:00.
    ;; Provide explicit meeting start/end pairs that lie within Sam's window.
    ;; One useful candidate: meet Sam 09:00 to 09:30
    (can_meet_sam t0900 t0930)

    ;; Margaret availability: Haight-Ashbury from 08:00 to 15:45.
    ;; Margaret requires at least 30 minutes. Provide explicit start/end pairs
    ;; that satisfy the 30-minute minimum and align with travel times.
    ;; If traveler departs Mission at 09:00, arrival 09:12 -> meet 09:12-09:42
    (can_meet_margaret t0912 t0942)
    ;; If traveler meets Sam until 09:30 then travels 09:30-09:42, arrive 09:42 -> meet 09:42-10:12
    (can_meet_margaret t0942 t1012)
    ;; allow a longer meeting spanning arrival at 09:12 to 10:12
    (can_meet_margaret t0912 t1012)
  )

  ;; objective: maximize the number of friends met (total_met)
  (:metric maximize (total_met))

  ;; require planner to finish the day (must use finish_day action)
  (:goal (and (finished)))
)