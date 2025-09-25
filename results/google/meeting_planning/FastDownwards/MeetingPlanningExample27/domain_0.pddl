(define (domain meeting-scheduling)
  (:requirements :strips :typing :fluents)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (met-you-margaret)
  )

  (:functions
    (time-you)           ; current logical time for agent "you" in minutes since midnight
    (time-margaret)      ; current logical time for agent "margaret" in minutes since midnight
    (total-meetings)     ; integer count of meetings performed (to maximize)
    (marg-window-start)  ; numeric constant for Margaret availability start
    (marg-window-end)    ; numeric constant for Margaret availability end
  )

  ;; Travel actions for the two agents (distinct actions per agent)
  (:action travel-you-marina->pacific
    :parameters ()
    :precondition (and (at you marina-district))
    :effect (and
              (not (at you marina-district))
              (at you pacific-heights)
              ; travel time from Marina District to Pacific Heights = 7 minutes
              (increase (time-you) 7)
            )
  )

  (:action travel-margaret-pacific->marina
    :parameters ()
    :precondition (and (at margaret pacific-heights))
    :effect (and
              (not (at margaret pacific-heights))
              (at margaret marina-district)
              ; travel time from Pacific Heights to Marina District = 6 minutes
              (increase (time-margaret) 6)
            )
  )

  ;; If "you" arrive at Pacific Heights earlier than Margaret's availability,
  ;; allow you to wait (synchronize) until Margaret's window start.
  (:action you-wait-until-marg-start
    :parameters ()
    :precondition (and
                    (at you pacific-heights)
                    (< (time-you) (marg-window-start))
                  )
    :effect (and
              ; set your clock to the start of Margaret's availability
              (assign (time-you) (marg-window-start))
            )
  )

  ;; Meeting action: requires both at Pacific Heights and that starting at
  ;; current your-time the meeting (of 15 minutes) fits entirely within Margaret's window.
  ;; Meeting increases both agents' local times by the meeting duration and increments count.
  (:action meet-margaret
    :parameters ()
    :precondition (and
                    (at you pacific-heights)
                    (at margaret pacific-heights)
                    ; meeting must start no earlier than Margaret's available start
                    (>= (time-you) (marg-window-start))
                    (>= (time-margaret) (marg-window-start))
                    ; ensure the 15-minute meeting fits within Margaret's window:
                    (<= (+ (time-you) 15) (marg-window-end))
                    (<= (+ (time-margaret) 15) (marg-window-end))
                    ; ensure meeting duration is at least 15 minutes by construction
                  )
    :effect (and
              (increase (time-you) 15)
              (increase (time-margaret) 15)
              (increase (total-meetings) 1)
              (met-you-margaret)
            )
  )
)