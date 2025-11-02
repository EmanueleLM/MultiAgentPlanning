(define (domain day_visit_sf)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location time person friend count tcount
  )

  (:predicates
    (at ?l - location)
    (current-time ?t - time)
    (next ?t1 - time ?t2 - time)

    ; movement links and state
    (link ?from - location ?to - location)
    (in-transit)
    (dest ?to - location)
    (travel-rem ?r - tcount)
    (next-tc ?r1 - tcount ?r2 - tcount)

    ; availability
    (avail-person ?p - person ?l - location ?t - time)
    (avail-friend ?f - friend ?l - location ?t - time)

    ; meeting results
    (met-person ?p - person)
    (met-friend ?f - friend)
    (decided ?f - friend)

    ; David meeting chain for exact contiguous minutes
    (meeting-david)
    (david-progress ?c - count)
    (next-count ?c1 - count ?c2 - count)
    (is-final-david ?c - count)
  )

  (:functions (total-cost))

  ; idle 1 minute
  (:action wait-minute
    :parameters (?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current-time ?t1)
      (next ?t1 ?t2)
      (at ?l)
      (not (in-transit))
      (not (meeting-david))
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (increase (total-cost) 1)
    )
  )

  ; start travel along a valid link (exactly 23 minutes modeled via ticks)
  (:action start-travel
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (link ?from ?to)
      (not (in-transit))
      (not (meeting-david))
    )
    :effect (and
      (not (at ?from))
      (in-transit)
      (dest ?to)
      (travel-rem tc23)
    )
  )

  ; one-minute travel tick advancing time and remaining travel counter
  (:action travel-tick
    :parameters (?t1 - time ?t2 - time ?r1 - tcount ?r2 - tcount)
    :precondition (and
      (in-transit)
      (travel-rem ?r1)
      (next-tc ?r1 ?r2)
      (current-time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (not (travel-rem ?r1))
      (travel-rem ?r2)
      (increase (total-cost) 1)
    )
  )

  ; finish travel when remaining time is zero
  (:action finish-travel
    :parameters (?to - location)
    :precondition (and
      (in-transit)
      (dest ?to)
      (travel-rem tc0)
    )
    :effect (and
      (not (in-transit))
      (not (dest ?to))
      (at ?to)
    )
  )

  ; meet an optional friend for 1 minute (counts instantly)
  (:action meet-optional
    :parameters (?f - friend ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (current-time ?t1)
      (next ?t1 ?t2)
      (at ?l)
      (avail-friend ?f ?l ?t1)
      (not (in-transit))
      (not (meeting-david))
      (not (met-friend ?f))
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (met-friend ?f)
      (decided ?f)
    )
  )

  ; optionally skip a friend (heavily penalized to force maximizing meetings)
  (:action skip-optional
    :parameters (?f - friend ?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current-time ?t1)
      (next ?t1 ?t2)
      (at ?l)
      (not (in-transit))
      (not (meeting-david))
      (not (met-friend ?f))
      (not (decided ?f))
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (decided ?f)
      (increase (total-cost) 1000)
    )
  )

  ; start meeting David (enters contiguous mode)
  (:action start-david
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (current-time ?t1)
      (next ?t1 ?t2)
      (at ?l)
      (avail-person ?p ?l ?t1)
      (not (met-person ?p))
      (not (meeting-david))
      (not (in-transit))
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (meeting-david)
      (david-progress c1)
    )
  )

  ; continue David meeting for non-final minutes
  (:action continue-david
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time ?c1 - count ?c2 - count)
    :precondition (and
      (meeting-david)
      (david-progress ?c1)
      (next-count ?c1 ?c2)
      (not (is-final-david ?c2))
      (current-time ?t1)
      (next ?t1 ?t2)
      (at ?l)
      (avail-person ?p ?l ?t1)
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (not (david-progress ?c1))
      (david-progress ?c2)
    )
  )

  ; final minute of David meeting reaches the required 105 minutes
  (:action continue-david-final
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time ?c1 - count ?c2 - count)
    :precondition (and
      (meeting-david)
      (david-progress ?c1)
      (next-count ?c1 ?c2)
      (is-final-david ?c2)
      (current-time ?t1)
      (next ?t1 ?t2)
      (at ?l)
      (avail-person ?p ?l ?t1)
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (not (david-progress ?c1))
      (not (meeting-david))
      (met-person ?p)
    )
  )

  (:metric minimize (total-cost))
)