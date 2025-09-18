(define (domain orchestrated-travelers)
  (:requirements :typing :durative-actions :fluents :numeric-fluents :negative-preconditions)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (met ?a - agent ?b - agent)
  )

  (:functions
    (time)                          ; current time in minutes since midnight
    (avail-start ?a - agent)        ; availability window start for an agent
    (avail-end ?a - agent)          ; availability window end for an agent
    (num-meetings)                  ; counter of meetings performed
  )

  ;; -------------------------
  ;; Traveler's travel actions
  ;; -------------------------
  (:durative-action traveler-travel-alamo-to-sunset
    :parameters ()
    :duration (= ?dur 16)
    :condition (and
      (at start (at traveler AlamoSquare))
    )
    :effect (and
      (at start (not (at traveler AlamoSquare)))
      (at end   (at traveler SunsetDistrict))
      (at end   (increase (time) ?dur))
    )
  )

  (:durative-action traveler-travel-sunset-to-alamo
    :parameters ()
    :duration (= ?dur 17)
    :condition (and
      (at start (at traveler SunsetDistrict))
    )
    :effect (and
      (at start (not (at traveler SunsetDistrict)))
      (at end   (at traveler AlamoSquare))
      (at end   (increase (time) ?dur))
    )
  )

  (:durative-action wait-traveler
    :parameters ()
    :duration (>= ?dur 0)
    :condition (at start (at traveler ?l))
    :effect (and
      (at end (at traveler ?l))
      (at end (increase (time) ?dur))
    )
  )

  ;; -------------------------
  ;; Matthew's travel actions
  ;; -------------------------
  (:durative-action matthew-travel-alamo-to-sunset
    :parameters ()
    :duration (= ?dur 16)
    :condition (and
      (at start (at matthew AlamoSquare))
    )
    :effect (and
      (at start (not (at matthew AlamoSquare)))
      (at end   (at matthew SunsetDistrict))
      (at end   (increase (time) ?dur))
    )
  )

  (:durative-action matthew-travel-sunset-to-alamo
    :parameters ()
    :duration (= ?dur 17)
    :condition (and
      (at start (at matthew SunsetDistrict))
    )
    :effect (and
      (at start (not (at matthew SunsetDistrict)))
      (at end   (at matthew AlamoSquare))
      (at end   (increase (time) ?dur))
    )
  )

  (:durative-action wait-matthew
    :parameters ()
    :duration (>= ?dur 0)
    :condition (at start (at matthew ?l))
    :effect (and
      (at end (at matthew ?l))
      (at end (increase (time) ?dur))
    )
  )

  ;; -------------------------
  ;; Joint meeting action (explicitly at SunsetDistrict)
  ;; Requires both agents to be present and enforces Matthew's availability window.
  ;; Meeting must last at least 15 minutes and finish no later than Matthew's avail-end.
  ;; -------------------------
  (:durative-action meet-at-sunset
    :parameters ()
    :duration (>= ?dur 15)
    :condition (and
      (at start (at traveler SunsetDistrict))
      (at start (at matthew SunsetDistrict))
      ;; Meeting must start at or after Matthew's availability start
      (at start (>= (time) (avail-start matthew)))
      ;; Meeting must finish no later than Matthew's availability end:
      ;; check (time + ?dur) <= avail-end at start of meeting
      (at start (<= (+ (time) ?dur) (avail-end matthew)))
      ;; Ensure they haven't already met (no duplicate counting)
      (at start (not (met matthew traveler)))
      ;; Keep both at SunsetDistrict during the whole meeting
      (over all (at traveler SunsetDistrict))
      (over all (at matthew SunsetDistrict))
    )
    :effect (and
      (at end (met matthew traveler))
      (at end (increase (num-meetings) 1))
      (at end (increase (time) ?dur))
    )
  )

)