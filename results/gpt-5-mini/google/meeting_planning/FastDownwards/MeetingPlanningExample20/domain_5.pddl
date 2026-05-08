(define (domain meeting-planning)
  (:requirements :strips :typing)
  (:types agent location timepoint)

  (:constants
    traveler joseph - agent
    chinatown nob_hill - location
    t0900 t1122 t1130 t1245 t1352 t1400 t1515 - timepoint
  )

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (joseph_available ?t - timepoint)
    (met ?a - agent)
  )

  ;; Generic time-advance (waiting) along the explicit timeline edges.
  (:action advance-time
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and (current_time ?from) (next_time ?from ?to))
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  ;; Travel from Chinatown to Nob Hill: consumes a timeline edge (departure -> arrival).
  (:action travel-chinatown-to-nob_hill
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and (current_time ?from) (next_time ?from ?to) (at traveler chinatown))
    :effect (and
      (not (at traveler chinatown))
      (at traveler nob_hill)
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  ;; Travel from Nob Hill to Chinatown (included for completeness).
  (:action travel-nob_hill-to-chinatown
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and (current_time ?from) (next_time ?from ?to) (at traveler nob_hill))
    :effect (and
      (not (at traveler nob_hill))
      (at traveler chinatown)
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  ;; Meet Joseph: requires being at Nob Hill at meeting start, Joseph available at start and end,
  ;; and a timeline edge that represents the contiguous meeting duration (75 minutes).
  (:action meet-joseph
    :parameters (?start - timepoint ?end - timepoint)
    :precondition (and
      (current_time ?start)
      (at traveler nob_hill)
      (joseph_available ?start)
      (joseph_available ?end)
      (next_time ?start ?end)
    )
    :effect (and
      (met traveler)
      (not (current_time ?start))
      (current_time ?end)
    )
  )
)