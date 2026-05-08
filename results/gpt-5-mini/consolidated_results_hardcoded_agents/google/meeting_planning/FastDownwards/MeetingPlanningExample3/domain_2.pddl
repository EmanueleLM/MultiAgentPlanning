(define (domain meeting-planning-example3)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time metcount person)

  (:constants bayview golden-gate-park - location
              barbara - person)

  (:predicates
    (now ?t - time)
    (at ?loc - location)
    (at-person ?p - person ?loc - location)
    (plus1 ?t1 ?t2 - time)
    (plus22 ?t1 ?t2 - time)
    (plus23 ?t1 ?t2 - time)
    (allowed-meet ?t - time)
    (have-met ?m - metcount)
    (nextmet ?m1 ?m2 - metcount)
    (meeting-started)
  )

  (:action move-bayview-to-ggp
    :parameters (?t1 ?t2 - time)
    :precondition (and (at bayview) (now ?t1) (plus22 ?t1 ?t2) (not (meeting-started)))
    :effect (and (not (at bayview)) (at golden-gate-park) (not (now ?t1)) (now ?t2))
  )

  (:action move-ggp-to-bayview
    :parameters (?t1 ?t2 - time)
    :precondition (and (at golden-gate-park) (now ?t1) (plus23 ?t1 ?t2) (not (meeting-started)))
    :effect (and (not (at golden-gate-park)) (at bayview) (not (now ?t1)) (now ?t2))
  )

  (:action wait-1min
    :parameters (?t1 ?t2 - time)
    :precondition (and (now ?t1) (plus1 ?t1 ?t2) (not (meeting-started)))
    :effect (and (not (now ?t1)) (now ?t2))
  )

  (:action meet-start-1min
    :parameters (?t1 ?t2 - time ?m1 ?m2 - metcount)
    :precondition (and (at golden-gate-park) (now ?t1) (plus1 ?t1 ?t2) (allowed-meet ?t1)
                       (have-met ?m1) (nextmet ?m1 ?m2) (not (meeting-started)))
    :effect (and (not (now ?t1)) (now ?t2) (not (have-met ?m1)) (have-met ?m2) (meeting-started))
  )

  (:action meet-continue-1min
    :parameters (?t1 ?t2 - time ?m1 ?m2 - metcount)
    :precondition (and (at golden-gate-park) (now ?t1) (plus1 ?t1 ?t2) (allowed-meet ?t1)
                       (have-met ?m1) (nextmet ?m1 ?m2) (meeting-started))
    :effect (and (not (now ?t1)) (now ?t2) (not (have-met ?m1)) (have-met ?m2))
  )
)