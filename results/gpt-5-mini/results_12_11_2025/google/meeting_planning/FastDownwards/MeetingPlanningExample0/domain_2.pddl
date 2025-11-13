(define (domain meeting_planning)
  (:requirements :typing :negative-preconditions :strips)
  (:types location time friend)

  (:predicates
    (at ?l - location)
    (time-now ?t - time)
    (succ ?t1 - time ?t2 - time)            ; discrete contiguous time-step from t1 to t2
    (travel-arc ?from - location ?to - location ?t1 - time ?t2 - time) ; directional travel occupying succ t1->t2
    (available ?f - friend ?t1 - time ?t2 - time) ; friend available exactly on the contiguous block t1->t2
    (friend-loc ?f - friend ?l - location)
    (met ?f - friend)
  )

  ;; Wait at current location for one contiguous time-step succ ?t1 ?t2
  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
                    (at ?l)
                    (time-now ?t1)
                    (succ ?t1 ?t2)
                  )
    :effect (and
              (not (time-now ?t1))
              (time-now ?t2)
            )
  )

  ;; Travel along a travel-arc that occupies exactly the contiguous time-step succ ?t1 ?t2
  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
                    (at ?from)
                    (time-now ?t1)
                    (succ ?t1 ?t2)
                    (travel-arc ?from ?to ?t1 ?t2)
                  )
    :effect (and
              (not (at ?from))
              (at ?to)
              (not (time-now ?t1))
              (time-now ?t2)
            )
  )

  ;; Meet a friend: requires being at friend's location and occupying the contiguous time-step
  ;; that exactly matches the friend's available block. Meeting marks the friend as met and advances time.
  (:action meet
    :parameters (?f - friend ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
                    (at ?loc)
                    (time-now ?t1)
                    (succ ?t1 ?t2)
                    (friend-loc ?f ?loc)
                    (available ?f ?t1 ?t2)
                    (not (met ?f))
                  )
    :effect (and
              (met ?f)
              (not (time-now ?t1))
              (time-now ?t2)
            )
  )
)