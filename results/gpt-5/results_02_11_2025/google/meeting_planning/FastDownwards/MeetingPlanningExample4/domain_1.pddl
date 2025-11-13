(define (domain sf-5min-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time loc)

  (:predicates
    (now ?t - time)
    (next ?t1 - time ?t2 - time)

    (at ?l - loc)
    (intransit-pm)
    (intransit-mp)

    (avail-jessica ?t - time)
    (depart-pm-allowed ?t - time)

    (streak1) (streak2) (streak3) (streak4) (streak5) (streak6)
    (streak7) (streak8) (streak9) (streak10) (streak11) (streak12)
    (achieved12)
  )

  (:action wait-at-presidio
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at presidio))
    :effect (and
      (not (now ?t)) (now ?t2)
      (not (streak1)) (not (streak2)) (not (streak3)) (not (streak4)) (not (streak5)) (not (streak6))
      (not (streak7)) (not (streak8)) (not (streak9)) (not (streak10)) (not (streak11)) (not (streak12))
    )
  )

  (:action wait-at-marina
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina))
    :effect (and
      (not (now ?t)) (now ?t2)
      (not (streak1)) (not (streak2)) (not (streak3)) (not (streak4)) (not (streak5)) (not (streak6))
      (not (streak7)) (not (streak8)) (not (streak9)) (not (streak10)) (not (streak11)) (not (streak12))
    )
  )

  (:action travel-pm-step1
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at presidio) (depart-pm-allowed ?t))
    :effect (and
      (not (now ?t)) (now ?t2)
      (not (at presidio))
      (intransit-pm)
      (not (streak1)) (not (streak2)) (not (streak3)) (not (streak4)) (not (streak5)) (not (streak6))
      (not (streak7)) (not (streak8)) (not (streak9)) (not (streak10)) (not (streak11)) (not (streak12))
    )
  )

  (:action travel-pm-step2
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (intransit-pm))
    :effect (and
      (not (now ?t)) (now ?t2)
      (not (intransit-pm))
      (at marina)
      (not (streak1)) (not (streak2)) (not (streak3)) (not (streak4)) (not (streak5)) (not (streak6))
      (not (streak7)) (not (streak8)) (not (streak9)) (not (streak10)) (not (streak11)) (not (streak12))
    )
  )

  (:action travel-mp-step1
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina))
    :effect (and
      (not (now ?t)) (now ?t2)
      (not (at marina))
      (intransit-mp)
      (not (streak1)) (not (streak2)) (not (streak3)) (not (streak4)) (not (streak5)) (not (streak6))
      (not (streak7)) (not (streak8)) (not (streak9)) (not (streak10)) (not (streak11)) (not (streak12))
    )
  )

  (:action travel-mp-step2
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (intransit-mp))
    :effect (and
      (not (now ?t)) (now ?t2)
      (not (intransit-mp))
      (at presidio)
      (not (streak1)) (not (streak2)) (not (streak3)) (not (streak4)) (not (streak5)) (not (streak6))
      (not (streak7)) (not (streak8)) (not (streak9)) (not (streak10)) (not (streak11)) (not (streak12))
    )
  )

  (:action meet-from-0
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (now ?t) (next ?t ?t2) (at marina) (avail-jessica ?t)
      (not (streak1)) (not (streak2)) (not (streak3)) (not (streak4)) (not (streak5)) (not (streak6))
      (not (streak7)) (not (streak8)) (not (streak9)) (not (streak10)) (not (streak11)) (not (streak12))
    )
    :effect (and (not (now ?t)) (now ?t2) (streak1))
  )

  (:action meet-1-to-2
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina) (avail-jessica ?t) (streak1))
    :effect (and (not (now ?t)) (now ?t2) (not (streak1)) (streak2))
  )

  (:action meet-2-to-3
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina) (avail-jessica ?t) (streak2))
    :effect (and (not (now ?t)) (now ?t2) (not (streak2)) (streak3))
  )

  (:action meet-3-to-4
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina) (avail-jessica ?t) (streak3))
    :effect (and (not (now ?t)) (now ?t2) (not (streak3)) (streak4))
  )

  (:action meet-4-to-5
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina) (avail-jessica ?t) (streak4))
    :effect (and (not (now ?t)) (now ?t2) (not (streak4)) (streak5))
  )

  (:action meet-5-to-6
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina) (avail-jessica ?t) (streak5))
    :effect (and (not (now ?t)) (now ?t2) (not (streak5)) (streak6))
  )

  (:action meet-6-to-7
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina) (avail-jessica ?t) (streak6))
    :effect (and (not (now ?t)) (now ?t2) (not (streak6)) (streak7))
  )

  (:action meet-7-to-8
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina) (avail-jessica ?t) (streak7))
    :effect (and (not (now ?t)) (now ?t2) (not (streak7)) (streak8))
  )

  (:action meet-8-to-9
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina) (avail-jessica ?t) (streak8))
    :effect (and (not (now ?t)) (now ?t2) (not (streak8)) (streak9))
  )

  (:action meet-9-to-10
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina) (avail-jessica ?t) (streak9))
    :effect (and (not (now ?t)) (now ?t2) (not (streak9)) (streak10))
  )

  (:action meet-10-to-11
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina) (avail-jessica ?t) (streak10))
    :effect (and (not (now ?t)) (now ?t2) (not (streak10)) (streak11))
  )

  (:action meet-11-to-12
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (next ?t ?t2) (at marina) (avail-jessica ?t) (streak11))
    :effect (and (not (now ?t)) (now ?t2) (not (streak11)) (streak12) (achieved12))
  )
)