(define (domain meet-john-domain)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types location person agent)
  (:predicates
    (at ?l - location)
    (met-john)
    (known-location ?l - location)
    (john-location ?l - location)
  )
  (:functions
    (current_time)
    (travel-time ?from - location ?to - location)
    (john-window-start)
    (john-window-end)
    (meet-min-john)
  )

  ;; Travel action: moves the traveler from one known location to another and advances time
  (:action travel
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (known-location ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (current_time) (travel-time ?from ?to))
    )
  )

  ;; Sync action: optionally advance time instantly to John's window start if early,
  ;; only valid at John's meeting location
  (:action sync-to-john-start
    :parameters (?loc - location)
    :precondition (and
      (at ?loc)
      (john-location ?loc)
      (< (current_time) (john-window-start))
    )
    :effect (and
      (assign (current_time) (john-window-start))
    )
  )

  ;; Meet action: requires being at John's location, meeting fits entirely within John's window,
  ;; and John has not yet been met. Advances time by the minimum meeting duration and records meeting.
  (:action meet-john
    :parameters (?loc - location)
    :precondition (and
      (at ?loc)
      (john-location ?loc)
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