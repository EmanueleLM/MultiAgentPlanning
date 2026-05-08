(define (domain meet-john-domain)
  (:requirements :typing :negative-preconditions :fluents)
  (:types location)
  (:predicates
    (at ?l - location)
    (met-john)
  )
  (:functions
    (current_time)
    (john-window-start)
    (john-window-end)
    (meet-min-john)
    (travel-time ?from - location ?to - location)
  )

  ;; Travel: move between known locations and advance current_time by the travel-time entry.
  (:action travel
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (current_time) (travel-time ?from ?to))
    )
  )

  ;; If early at Russian Hill, optionally advance time to John's window start.
  (:action sync-to-john-start
    :parameters ()
    :precondition (and
      (at russian_hill)
      (< (current_time) (john-window-start))
    )
    :effect (and
      (assign (current_time) (john-window-start))
    )
  )

  ;; Meet John for the required minimum contiguous minutes.
  (:action meet-john
    :parameters ()
    :precondition (and
      (at russian_hill)
      (not (met-john))
      (>= (current_time) (john-window-start))
      (<= (+ (current_time) (meet-min-john)) (john-window-end))
    )
    :effect (and
      (met-john)
      (increase (current_time) (meet-min-john))
    )
  )
)