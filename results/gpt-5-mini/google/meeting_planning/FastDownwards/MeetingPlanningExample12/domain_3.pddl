(define (domain meeting_planning_instance)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types person timepoint location)

  (:predicates
    ;; global clock represented by a single current timepoint fluent
    (current_time ?t - timepoint)

    ;; agent or friend location at a specific timepoint
    (at ?p - person ?l - location ?t - timepoint)

    ;; record that a friend has been met
    (met ?p - person)

    ;; permitted transitions: travel or meeting or waiting from one timepoint to a later one
    (allowed_travel ?from - location ?to - location ?tstart - timepoint ?tend - timepoint)
    (allowed_wait ?tstart - timepoint ?tend - timepoint)
    (allowed_meeting_interval ?tstart - timepoint ?tend - timepoint)

    ;; role/type markers to restrict bindings
    (is_agent ?p - person)
    (is_friend ?p - person)
  )

  ;; wait: advance the global time while staying at the same location
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

  ;; travel: move between two different locations when an explicit travel leg exists
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

  ;; meet: meet a friend by occupying the same location for an allowed meeting interval
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