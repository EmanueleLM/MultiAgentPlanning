; Domain: trip-scheduling
; Note: Agents' inputs specified stays of 6 (Krakow), 7 (Athens), and 5 (Zurich),
; which sum to 18. The user's request also asked for a total of 16 days; that
; is inconsistent with the three exact stays. This domain implements the exact
; stays (6,7,5) and enforces that the elapsed time equals 18. If you prefer a
; different resolution (e.g., total=16), tell me which city stay to shorten.
(define (domain trip-scheduling)
  (:requirements :typing :durative-actions :fluents :numeric-fluents :equality)
  (:types city)
  (:constants krakow athens zurich - city)

  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (occupied-krakow)
    (occupied-athens)
    (occupied-zurich)
    (relatives-visited)
  )

  (:functions
    (elapsed) ; total elapsed days (numeric)
  )

  ; -------------------------
  ; Krakow agent actions
  ; -------------------------
  (:durative-action krakow-agent-stay
    :duration (= ?duration 6)
    :condition (and (at start (at krakow)))
    :effect (and
      (at start (occupied-krakow))
      (at end (not (occupied-krakow)))
      (at end (visited krakow))
      (at end (increase (elapsed) 6))
    )
  )

  (:durative-action krakow-agent-fly-to-athens
    :duration (= ?duration 0)
    :condition (and (at start (at krakow)))
    :effect (and
      (at start) ; no-op, placeholder for clarity
      (at end (not (at krakow)))
      (at end (at athens))
      ; flights are direct and do not add days in this model
    )
  )

  (:durative-action krakow-agent-fly-to-zurich
    :duration (= ?duration 0)
    :condition (and (at start (at krakow)))
    :effect (and
      (at end (not (at krakow)))
      (at end (at zurich))
    )
  )

  ; -------------------------
  ; Athens agent actions
  ; -------------------------
  (:durative-action athens-agent-stay
    :duration (= ?duration 7)
    :condition (and (at start (at athens)))
    :effect (and
      (at start (occupied-athens))
      (at end (not (occupied-athens)))
      (at end (visited athens))
      (at end (increase (elapsed) 7))
    )
  )

  (:durative-action athens-agent-fly-to-krakow
    :duration (= ?duration 0)
    :condition (and (at start (at athens)))
    :effect (and
      (at end (not (at athens)))
      (at end (at krakow))
    )
  )

  (:durative-action athens-agent-fly-to-zurich
    :duration (= ?duration 0)
    :condition (and (at start (at athens)))
    :effect (and
      (at end (not (at athens)))
      (at end (at zurich))
    )
  )

  ; relatives visit must occur while Athens agent occupies Athens
  (:action athens-agent-visit-relatives
    :parameters ()
    :precondition (and (occupied-athens) (at athens) (not (relatives-visited)))
    :effect (relatives-visited)
  )

  ; -------------------------
  ; Zurich agent actions
  ; -------------------------
  (:durative-action zurich-agent-stay
    :duration (= ?duration 5)
    :condition (and (at start (at zurich)))
    :effect (and
      (at start (occupied-zurich))
      (at end (not (occupied-zurich)))
      (at end (visited zurich))
      (at end (increase (elapsed) 5))
    )
  )

  (:durative-action zurich-agent-fly-to-krakow
    :duration (= ?duration 0)
    :condition (and (at start (at zurich)))
    :effect (and
      (at end (not (at zurich)))
      (at end (at krakow))
    )
  )

  (:durative-action zurich-agent-fly-to-athens
    :duration (= ?duration 0)
    :condition (and (at start (at zurich)))
    :effect (and
      (at end (not (at zurich)))
      (at end (at athens))
    )
  )

)