(define (domain meeting_planning_instance)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types timepoint location person)

  (:predicates
    (current_time ?t - timepoint)
    (at ?p - person ?l - location ?t - timepoint)
    (met ?p - person)
    (allowed_travel ?from - location ?to - location ?tstart - timepoint ?tend - timepoint)
    (allowed_wait ?tstart - timepoint ?tend - timepoint)
    (allowed_meeting_interval ?tstart - timepoint ?tend - timepoint)
  )

  ;; Wait at a location to advance the global time (precomputed coarse wait intervals).
  (:action wait
    :parameters (?actor - person ?loc - location ?tstart - timepoint ?tend - timepoint)
    :precondition (and
      (current_time ?tstart)
      (at ?actor ?loc ?tstart)
      (allowed_wait ?tstart ?tend)
    )
    :effect (and
      (not (current_time ?tstart))
      (current_time ?tend)
      (not (at ?actor ?loc ?tstart))
      (at ?actor ?loc ?tend)
    )
  )

  ;; Travel between distinct locations; allowed_travel facts (problem-specific) encode
  ;; which start/end timepoint pairs represent feasible travel legs (respecting travel durations).
  (:action travel
    :parameters (?actor - person ?from - location ?to - location ?tstart - timepoint ?tend - timepoint)
    :precondition (and
      (current_time ?tstart)
      (at ?actor ?from ?tstart)
      (allowed_travel ?from ?to ?tstart ?tend)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current_time ?tstart))
      (current_time ?tend)
      (not (at ?actor ?from ?tstart))
      (at ?actor ?to ?tend)
    )
  )

  ;; Meet a friend: both must be at the same location at the meeting start and at the meeting end,
  ;; and the interval must be one of the allowed_meeting_interval facts (problem-specific).
  ;; Meeting advances the global time and records that the friend was met. The actor's location
  ;; is advanced to the meeting end time (friend presence is treated as immutable in this instance).
  (:action meet
    :parameters (?actor - person ?friend - person ?loc - location ?tstart - timepoint ?tend - timepoint)
    :precondition (and
      (current_time ?tstart)
      (at ?actor ?loc ?tstart)
      (at ?friend ?loc ?tstart)
      (at ?actor ?loc ?tend)
      (at ?friend ?loc ?tend)
      (allowed_meeting_interval ?tstart ?tend)
      (not (met ?friend))
    )
    :effect (and
      (not (current_time ?tstart))
      (current_time ?tend)
      (met ?friend)
    )
  )
)