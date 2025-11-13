(define (domain sf-day-schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    friend location time
  )
  (:predicates
    (at ?l - location)
    (time-is ?t - time)
    (friend-at ?f - friend ?l - location)
    (window-slot ?f - friend ?s - time ?e - time)
    (betty-slot ?s - time ?e - time)
    (buffer-slot ?l - location ?s - time ?e - time)
    (wait-slot ?l - location ?s - time ?e - time)
    (travel-slot ?from - location ?to - location ?s - time ?e - time)
    (met ?f - friend)
    (betty-75-met)
    (needs-buffer ?l - location)
    (switched) ; true after the single permitted location switch
    (is-betty ?f - friend)
  )

  ; Meet any non-Betty friend in a valid window slot; enforces 5-min buffer between meetings at same location
  (:action meet-friend
    :parameters (?p - friend ?l - location ?s - time ?e - time)
    :precondition (and
      (friend-at ?p ?l)
      (window-slot ?p ?s ?e)
      (at ?l)
      (time-is ?s)
      (not (met ?p))
      (not (needs-buffer ?l))
    )
    :effect (and
      (met ?p)
      (not (time-is ?s))
      (time-is ?e)
      (needs-buffer ?l)
    )
  )

  ; Meet Betty in a qualifying slot (>=75min within her window); also enforces buffer-before-next-meeting-at-same-location
  (:action meet-betty
    :parameters (?p - friend ?l - location ?s - time ?e - time)
    :precondition (and
      (is-betty ?p)
      (friend-at ?p ?l)
      (betty-slot ?s ?e)
      (at ?l)
      (time-is ?s)
      (not (met ?p))
      (not (needs-buffer ?l))
    )
    :effect (and
      (met ?p)
      (betty-75-met)
      (not (time-is ?s))
      (time-is ?e)
      (needs-buffer ?l)
    )
  )

  ; Required 5-minute buffer between consecutive meetings at the same location
  (:action buffer-same-location
    :parameters (?l - location ?s - time ?e - time)
    :precondition (and
      (at ?l)
      (time-is ?s)
      (buffer-slot ?l ?s ?e)
      (needs-buffer ?l)
    )
    :effect (and
      (not (time-is ?s))
      (time-is ?e)
      (not (needs-buffer ?l))
    )
  )

  ; Idle/wait at a location (does not affect buffer requirement)
  (:action wait-at-location
    :parameters (?l - location ?s - time ?e - time)
    :precondition (and
      (at ?l)
      (time-is ?s)
      (wait-slot ?l ?s ?e)
    )
    :effect (and
      (not (time-is ?s))
      (time-is ?e)
    )
  )

  ; Single allowed location switch (Presidio -> NorthBeach in this instance). No buffer required before inter-location travel.
  (:action move-between-locations
    :parameters (?from - location ?to - location ?s - time ?e - time)
    :precondition (and
      (at ?from)
      (time-is ?s)
      (travel-slot ?from ?to ?s ?e)
      (not (switched))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (time-is ?s))
      (time-is ?e)
      (switched)
    )
  )
)