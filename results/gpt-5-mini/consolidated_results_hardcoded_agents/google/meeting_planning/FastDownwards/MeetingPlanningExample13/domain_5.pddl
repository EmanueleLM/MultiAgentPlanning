(define (domain meeting-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types location friend timeslot duration)

  (:predicates
    (at ?l - location)
    (time-at ?t - timeslot)
    (next ?s - timeslot ?d - duration ?e - timeslot) ; e = s + dur
    (available-for ?f - friend ?s - timeslot ?e - timeslot) ; friend available for the contiguous interval [s,e)
    (located ?f - friend ?l - location)
    (met ?f - friend)
    (is-betty ?f - friend)
    (satisfied-betty)
  )

  ;; Generic meeting action for friends other than Betty (sets met and advances the global time pointer)
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

  ;; Dedicated Betty meeting action that also sets the required satisfied-betty flag
  (:action meet-betty
    :parameters (?s - timeslot ?d - duration ?e - timeslot)
    :precondition (and
      (time-at ?s)
      (at northbeach)
      (next ?s ?d ?e)
      (available-for betty ?s ?e)
      (is-betty betty)
    )
    :effect (and
      (met betty)
      (satisfied-betty)
      (not (time-at ?s)) (time-at ?e)
    )
  )

  ;; Travel between locations; advances time and moves the agent
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

  ;; Wait/idle to advance the global time pointer along precomputed intervals
  (:action wait
    :parameters (?s - timeslot ?d - duration ?e - timeslot)
    :precondition (and
      (time-at ?s)
      (next ?s ?d ?e)
    )
    :effect (and
      (not (time-at ?s)) (time-at ?e)
    )
  )
)