(define (domain meeting-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types location friend timeslot duration)

  (:predicates
    (at ?l - location)                       ; current location of the agent
    (time-at ?s - timeslot)                  ; current global timepoint
    (next ?s - timeslot ?d - duration ?e - timeslot) ; e is the successor of s after duration d (contiguous)
    (available-for ?f - friend ?s - timeslot ?e - timeslot) ; friend f can be met for the entire contiguous interval [s,e)
    (located ?f - friend ?l - location)      ; friend f is at location l
    (met ?f - friend)                        ; friend f has been met
    (is-betty ?f - friend)                   ; marks Betty
    (is-northbeach ?l - location)            ; marks the North Beach location
    (satisfied-betty)                        ; flag that Betty's required meeting was completed
  )

  ;; Generic meeting action for non-Betty friends:
  ;; Requires being at the friend's location and occupying the contiguous [s,e) interval.
  (:action meet-other
    :parameters (?f - friend ?loc - location ?s - timeslot ?d - duration ?e - timeslot)
    :precondition (and
      (time-at ?s)
      (at ?loc)
      (located ?f ?loc)
      (next ?s ?d ?e)
      (available-for ?f ?s ?e)
      (not (is-betty ?f))
    )
    :effect (and
      (met ?f)
      (not (time-at ?s)) (time-at ?e)
    )
  )

  ;; Dedicated meeting action for Betty that sets the satisfied-betty flag.
  ;; Enforces contiguous occupancy of the offered available-for interval and that the meeting occurs at North Beach.
  (:action meet-betty
    :parameters (?f - friend ?loc - location ?s - timeslot ?d - duration ?e - timeslot)
    :precondition (and
      (time-at ?s)
      (at ?loc)
      (located ?f ?loc)
      (is-betty ?f)
      (is-northbeach ?loc)
      (next ?s ?d ?e)
      (available-for ?f ?s ?e)
    )
    :effect (and
      (met ?f)
      (satisfied-betty)
      (not (time-at ?s)) (time-at ?e)
    )
  )

  ;; Travel between distinct locations advances global time and moves agent location.
  (:action travel
    :parameters (?from - location ?to - location ?s - timeslot ?d - duration ?e - timeslot)
    :precondition (and
      (time-at ?s)
      (at ?from)
      (next ?s ?d ?e)
    )
    :effect (and
      (not (at ?from)) (at ?to)
      (not (time-at ?s)) (time-at ?e)
    )
  )

  ;; Wait/idle while remaining at the same location for a contiguous interval.
  (:action wait
    :parameters (?loc - location ?s - timeslot ?d - duration ?e - timeslot)
    :precondition (and
      (time-at ?s)
      (at ?loc)
      (next ?s ?d ?e)
    )
    :effect (and
      (not (time-at ?s)) (time-at ?e)
    )
  )
)