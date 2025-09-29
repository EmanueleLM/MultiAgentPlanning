(define (domain multiagent-travel-adapted)
  (:requirements :typing :negative-preconditions :adl :action-costs :equality)
  (:types person place time)
  (:predicates
    (at ?p - person ?pl - place ?t - time)
    (available ?p - person ?t - time)
    (busy ?p - person ?t - time)
    (met ?p - person)
    (plus11 ?t1 - time ?t2 - time)
    (plus30 ?t1 - time ?t2 - time)
    (plus120 ?t1 - time ?t2 - time)
    (in-range ?tt - time ?start - time ?end - time)
    (reach-after ?tarr - time ?tt - time)
  )

  (:action move-fw-to-nobhill
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (plus11 ?t1 ?t2) (at traveler fishermans-wharf ?t1))
    :effect (and
      (at traveler nob-hill ?t2)
      (forall (?tt - time)
        (when (reach-after ?t2 ?tt)
          (at traveler nob-hill ?tt)
        )
      )
    )
    :cost 0
  )

  (:action meet-friend
    :parameters (?f - person ?start - time ?end - time)
    :precondition (and
      (plus30 ?start ?end)
      (at traveler nob-hill ?start)
      (at ?f nob-hill ?start)
      (forall (?tt - time)
        (imply (in-range ?tt ?start ?end)
               (and (not (busy traveler ?tt)) (not (busy ?f ?tt)) (available ?f ?tt))
        )
      )
    )
    :effect (and
      (met ?f)
      (forall (?tt - time)
        (when (in-range ?tt ?start ?end)
          (and (busy traveler ?tt) (busy ?f ?tt))
        )
      )
    )
    :cost -1
  )

  (:action meet-stephanie
    :parameters (?start - time ?end - time)
    :precondition (and
      (plus120 ?start ?end)
      (at traveler nob-hill ?start)
      (at stephanie nob-hill ?start)
      (forall (?tt - time)
        (imply (in-range ?tt ?start ?end)
               (and (not (busy traveler ?tt)) (not (busy stephanie ?tt)) (available stephanie ?tt))
        )
      )
    )
    :effect (and
      (met stephanie)
      (forall (?tt - time)
        (when (in-range ?tt ?start ?end)
          (and (busy traveler ?tt) (busy stephanie ?tt))
        )
      )
    )
    :cost 0
  )
)