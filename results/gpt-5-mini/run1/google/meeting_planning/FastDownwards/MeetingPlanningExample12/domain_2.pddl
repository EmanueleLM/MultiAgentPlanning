(define (domain meeting_planning_instance)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types person timepoint location)

  (:predicates
    (current_time ?t - timepoint)
    (at ?p - person ?l - location ?t - timepoint)
    (met ?p - person)
    (allowed_travel ?from - location ?to - location ?tstart - timepoint ?tend - timepoint)
    (allowed_wait ?tstart - timepoint ?tend - timepoint)
    (allowed_meeting_interval ?tstart - timepoint ?tend - timepoint)
    (is_agent ?p - person)
    (is_friend ?p - person)
  )

  ;; Agent waits at a location advancing the global time from a defined timepoint to a later one.
  (:action wait
    :parameters (?actor - person ?loc - location ?tstart - timepoint ?tend - timepoint)
    :precondition (and
      (current_time ?tstart)
      (at ?actor ?loc ?tstart)
      (allowed_wait ?tstart ?tend)
      (is_agent ?actor)
    )
    :effect (and
      (not (current_time ?tstart))
      (current_time ?tend)
      (not (at ?actor ?loc ?tstart))
      (at ?actor ?loc ?tend)
    )
  )

  ;; Agent travels between locations when an explicit travel leg (start->end timepoints) is available.
  (:action travel
    :parameters (?actor - person ?from - location ?to - location ?tstart - timepoint ?tend - timepoint)
    :precondition (and
      (current_time ?tstart)
      (at ?actor ?from ?tstart)
      (allowed_travel ?from ?to ?tstart ?tend)
      (not (= ?from ?to))
      (is_agent ?actor)
    )
    :effect (and
      (not (current_time ?tstart))
      (current_time ?tend)
      (not (at ?actor ?from ?tstart))
      (at ?actor ?to ?tend)
    )
  )

  ;; Meet a friend: agent must be at the meeting location at the meeting start;
  ;; friend must be present at start and at end timepoints (availability encoded in init),
  ;; the meeting interval must be an allowed_meeting_interval, and the friend must not
  ;; already be recorded as met. Meeting advances the global time, moves the agent's
  ;; location to the meeting end timepoint, and records that the friend was met.
  (:action meet
    :parameters (?actor - person ?friend - person ?loc - location ?tstart - timepoint ?tend - timepoint)
    :precondition (and
      (current_time ?tstart)
      (at ?actor ?loc ?tstart)
      (at ?friend ?loc ?tstart)
      (at ?friend ?loc ?tend)
      (allowed_meeting_interval ?tstart ?tend)
      (is_agent ?actor)
      (is_friend ?friend)
      (not (met ?friend))
    )
    :effect (and
      (not (current_time ?tstart))
      (current_time ?tend)
      (not (at ?actor ?loc ?tstart))
      (at ?actor ?loc ?tend)
      (met ?friend)
    )
  )
)