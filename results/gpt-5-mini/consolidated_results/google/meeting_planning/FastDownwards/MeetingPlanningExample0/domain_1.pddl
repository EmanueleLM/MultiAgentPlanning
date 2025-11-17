(define (domain meeting_planning)
  (:requirements :typing :negative-preconditions)
  (:types location time duration friend)

  (:predicates
    (at ?l - location)
    (time-now ?t - time)
    (advance ?t1 - time ?t2 - time ?d - duration) ;; means t2 = t1 + d
    (travel-duration ?from - location ?to - location ?d - duration)
    (meeting-duration ?f - friend ?d - duration)
    (available ?f - friend ?t1 - time ?t2 - time) ;; friend available for a block from t1 to t2
    (friend-location ?f - friend ?l - location)
    (met ?f - friend)
  )

  ;; Wait: advance time without changing location
  (:action wait
    :parameters (?t1 - time ?t2 - time ?d - duration)
    :precondition (and (time-now ?t1) (advance ?t1 ?t2 ?d))
    :effect (and (not (time-now ?t1)) (time-now ?t2))
  )

  ;; Travel between locations; allowed only when an advance exists matching the travel duration
  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time ?d - duration)
    :precondition (and
                    (at ?from)
                    (time-now ?t1)
                    (travel-duration ?from ?to ?d)
                    (advance ?t1 ?t2 ?d)
                  )
    :effect (and
              (not (at ?from))
              (at ?to)
              (not (time-now ?t1))
              (time-now ?t2)
            )
  )

  ;; Meet a friend: requires being at friend's location, an advance matching required meeting duration,
  ;; and an availability fact exactly matching the start and end times.
  (:action meet
    :parameters (?f - friend ?loc - location ?t1 - time ?t2 - time ?d - duration)
    :precondition (and
                    (at ?loc)
                    (time-now ?t1)
                    (friend-location ?f ?loc)
                    (meeting-duration ?f ?d)
                    (advance ?t1 ?t2 ?d)
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