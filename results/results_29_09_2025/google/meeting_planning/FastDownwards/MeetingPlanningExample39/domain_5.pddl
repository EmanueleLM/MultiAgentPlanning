(define (domain multiagent-travel-adapted)
  (:requirements :typing :negative-preconditions :adl :action-costs :equality)
  (:types person place time)
  (:constants
    traveler stephanie - person
    fishermans-wharf nob-hill - place
  )
  (:predicates
    (at ?p - person ?pl - place ?t - time)
    (available ?p - person ?t - time)
    (busy ?p - person ?t - time)
    (met ?p - person)
    (unmet ?p - person)
    (plus11 ?t1 - time ?t2 - time)
    (plus30 ?t1 - time ?t2 - time)
    (plus120 ?t1 - time ?t2 - time)
  )

  (:action move-fw-to-nobhill
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (plus11 ?t1 ?t2) (at traveler fishermans-wharf ?t1))
    :effect (and
      (at traveler nob-hill ?t2)
    )
  )

  (:action meet-friend
    :parameters (?f - person ?start - time ?end - time)
    :precondition (and
      (plus30 ?start ?end)
      (at traveler nob-hill ?start)
      (at ?f nob-hill ?start)
      (available ?f ?start)
      (unmet ?f)
      (not (busy traveler ?start))
      (not (busy ?f ?start))
    )
    :effect (and
      (met ?f)
      (not (unmet ?f))
      (busy traveler ?start)
      (busy ?f ?start)
    )
  )

  (:action meet-stephanie
    :parameters (?start - time ?end - time)
    :precondition (and
      (plus120 ?start ?end)
      (at traveler nob-hill ?start)
      (at stephanie nob-hill ?start)
      (available stephanie ?start)
      (not (busy traveler ?start))
      (not (busy stephanie ?start))
    )
    :effect (and
      (met stephanie)
      (busy traveler ?start)
      (busy stephanie ?start)
    )
  )

  (:action penalize-unmet
    :parameters (?f - person)
    :precondition (unmet ?f)
    :effect (and
      (not (unmet ?f))
    )
    :cost 1
  )
)