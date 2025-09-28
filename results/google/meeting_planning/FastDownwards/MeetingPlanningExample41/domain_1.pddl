(define (domain meetup-day)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs)
  (:types location agent timepoint duration)

  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?t - timepoint)
    (met-george)
    (paid-no-meet)
    (done)
    (nb-ha ?t1 - timepoint ?t2 - timepoint)
    (ha-nb ?t1 - timepoint ?t2 - timepoint)
    (span ?d - duration ?t1 - timepoint ?t2 - timepoint)
  )

  (:action you-travel-nb->ha
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at you northbeach) (at-time ?t1) (nb-ha ?t1 ?t2))
    :effect (and
      (not (at you northbeach))
      (at you haight)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 18
  )

  (:action you-travel-ha->nb
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at you haight) (at-time ?t1) (ha-nb ?t1 ?t2))
    :effect (and
      (not (at you haight))
      (at you northbeach)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 19
  )

  (:action pay-no-meet
    :parameters (?t - timepoint)
    :precondition (and (at-time ?t) (not (met-george)) (not (paid-no-meet)))
    :effect (and (paid-no-meet))
    :cost 10000
  )

  (:action end-day
    :parameters ()
    :precondition (or (met-george) (paid-no-meet))
    :effect (and (done))
    :cost 0
  )

  (:action you-meet-george-45
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at you haight) (at-time ?t1) (not (met-george)) (span dur45 ?t1 ?t2))
    :effect (and (met-george) (not (at-time ?t1)) (at-time ?t2))
    :cost 9955
  )

  (:action you-meet-george-60
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at you haight) (at-time ?t1) (not (met-george)) (span dur60 ?t1 ?t2))
    :effect (and (met-george) (not (at-time ?t1)) (at-time ?t2))
    :cost 9940
  )

  (:action you-meet-george-90
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at you haight) (at-time ?t1) (not (met-george)) (span dur90 ?t1 ?t2))
    :effect (and (met-george) (not (at-time ?t1)) (at-time ?t2))
    :cost 9910
  )

  (:action you-meet-george-120
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at you haight) (at-time ?t1) (not (met-george)) (span dur120 ?t1 ?t2))
    :effect (and (met-george) (not (at-time ?t1)) (at-time ?t2))
    :cost 9880
  )

  (:action you-meet-george-180
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at you haight) (at-time ?t1) (not (met-george)) (span dur180 ?t1 ?t2))
    :effect (and (met-george) (not (at-time ?t1)) (at-time ?t2))
    :cost 9820
  )

  (:action you-meet-george-237
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at you haight) (at-time ?t1) (not (met-george)) (span dur237 ?t1 ?t2))
    :effect (and (met-george) (not (at-time ?t1)) (at-time ?t2))
    :cost 9763
  )
)