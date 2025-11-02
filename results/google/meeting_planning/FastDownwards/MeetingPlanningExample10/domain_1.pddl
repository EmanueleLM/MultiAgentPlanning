(define (domain meetingplanningexample10-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?l - location)
    (current ?t - time)
    (advance16 ?t1 - time ?t2 - time)
    (advance18 ?t1 - time ?t2 - time)
    (advance15 ?t1 - time ?t2 - time)
    (can-wait ?t1 - time ?t2 - time)
    (valid-meet-start ?t - time)
    (met-james)
  )

  (:action move-ggp-to-mar
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at golden_gate_park)
      (current ?t1)
      (advance16 ?t1 ?t2))
    :effect (and
      (not (at golden_gate_park))
      (at marina_district)
      (not (current ?t1))
      (current ?t2))
  )

  (:action move-mar-to-ggp
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at marina_district)
      (current ?t1)
      (advance18 ?t1 ?t2))
    :effect (and
      (not (at marina_district))
      (at golden_gate_park)
      (not (current ?t1))
      (current ?t2))
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current ?t1)
      (can-wait ?t1 ?t2))
    :effect (and
      (not (current ?t1))
      (current ?t2))
  )

  (:action meet-james-15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at marina_district)
      (current ?t1)
      (valid-meet-start ?t1)
      (advance15 ?t1 ?t2)
      (not (met-james)))
    :effect (and
      (met-james)
      (not (current ?t1))
      (current ?t2))
  )
)