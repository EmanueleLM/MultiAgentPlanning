(define (domain multiagent-travel-adapted)
  (:requirements :typing :negative-preconditions :equality :disjunctive-preconditions :conditional-effects :adl :fluents)
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
    (in-range ?t - time ?start - time ?end - time)
  )
  (:functions
    (total-cost)
  )

  (:action move-fw-to-nobhill
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (plus11 ?t1 ?t2)
      (at traveler fishermans-wharf ?t1)
      (not (busy traveler ?t1))
      (not (busy traveler ?t2))
    )
    :effect (and
      (not (at traveler fishermans-wharf ?t1))
      (at traveler nob-hill ?t2)
    )
  )

  (:action meet-friend
    :parameters (?f - person ?start - time ?end - time)
    :precondition (and
      (plus30 ?start ?end)
      (at traveler nob-hill ?start)
      (at ?f nob-hill ?start)
      (unmet ?f)
      (available ?f ?start)
      (not (exists (?t - time)
             (and (in-range ?t ?start ?end)
                  (or (busy traveler ?t)
                      (busy ?f ?t)
                      (not (available ?f ?t))
                  )
             )
           )
      )
    )
    :effect (and
      (met ?f)
      (not (unmet ?f))
      (forall (?t - time)
        (when (in-range ?t ?start ?end)
          (and
            (busy traveler ?t)
            (busy ?f ?t)
          )
        )
      )
    )
  )

  (:action meet-stephanie
    :parameters (?start - time ?end - time)
    :precondition (and
      (plus120 ?start ?end)
      (at traveler nob-hill ?start)
      (at stephanie nob-hill ?start)
      (not (exists (?t - time)
             (and (in-range ?t ?start ?end)
                  (or (busy traveler ?t)
                      (busy stephanie ?t)
                      (not (available stephanie ?t))
                  )
             )
           )
      )
    )
    :effect (and
      (met stephanie)
      (forall (?t - time)
        (when (in-range ?t ?start ?end)
          (and
            (busy traveler ?t)
            (busy stephanie ?t)
          )
        )
      )
    )
  )

  (:action penalize-unmet
    :parameters (?f - person)
    :precondition (unmet ?f)
    :effect (and
      (not (unmet ?f))
      (increase (total-cost) 1)
    )
  )
)