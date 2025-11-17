(define (domain sf-meet-stephanie)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:constants chinatown marinadistrict - location)
  (:predicates
    (time-step ?t - time)
    (next ?t - time ?t2 - time)
    (within-window ?t - time)
    (at ?t - time)
    (agent-at ?l - location)
    (in-transit-c2m)
    (rem-c2m-11) (rem-c2m-10) (rem-c2m-9) (rem-c2m-8) (rem-c2m-7) (rem-c2m-6)
    (rem-c2m-5) (rem-c2m-4) (rem-c2m-3) (rem-c2m-2) (rem-c2m-1)
    (in-transit-m2c)
    (rem-m2c-15) (rem-m2c-14) (rem-m2c-13) (rem-m2c-12) (rem-m2c-11) (rem-m2c-10)
    (rem-m2c-9) (rem-m2c-8) (rem-m2c-7) (rem-m2c-6) (rem-m2c-5) (rem-m2c-4)
    (rem-m2c-3) (rem-m2c-2) (rem-m2c-1)
    (met-stephanie-at-tk ?t - time)
    (need-meet ?t - time)
    (chain-member ?t - time)
  )

  (:action wait
    :parameters (?t - time ?t2 - time ?l - location)
    :precondition (and
      (at ?t) (next ?t ?t2)
      (agent-at ?l)
      (not (need-meet ?t))
      (not (in-transit-c2m))
      (not (in-transit-m2c))
    )
    :effect (and
      (not (at ?t))
      (at ?t2)
    )
  )

  (:action start-move-c2m
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at ?t) (next ?t ?t2)
      (agent-at chinatown)
      (not (need-meet ?t))
      (not (in-transit-c2m))
      (not (in-transit-m2c))
    )
    :effect (and
      (not (at ?t)) (at ?t2)
      (not (agent-at chinatown))
      (in-transit-c2m)
      (rem-c2m-11)
    )
  )

  (:action step-move-c2m-11
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-c2m) (rem-c2m-11))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-c2m-11)) (rem-c2m-10))
  )
  (:action step-move-c2m-10
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-c2m) (rem-c2m-10))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-c2m-10)) (rem-c2m-9))
  )
  (:action step-move-c2m-9
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-c2m) (rem-c2m-9))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-c2m-9)) (rem-c2m-8))
  )
  (:action step-move-c2m-8
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-c2m) (rem-c2m-8))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-c2m-8)) (rem-c2m-7))
  )
  (:action step-move-c2m-7
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-c2m) (rem-c2m-7))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-c2m-7)) (rem-c2m-6))
  )
  (:action step-move-c2m-6
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-c2m) (rem-c2m-6))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-c2m-6)) (rem-c2m-5))
  )
  (:action step-move-c2m-5
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-c2m) (rem-c2m-5))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-c2m-5)) (rem-c2m-4))
  )
  (:action step-move-c2m-4
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-c2m) (rem-c2m-4))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-c2m-4)) (rem-c2m-3))
  )
  (:action step-move-c2m-3
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-c2m) (rem-c2m-3))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-c2m-3)) (rem-c2m-2))
  )
  (:action step-move-c2m-2
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-c2m) (rem-c2m-2))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-c2m-2)) (rem-c2m-1))
  )

  (:action finish-move-c2m
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at ?t) (next ?t ?t2)
      (in-transit-c2m) (rem-c2m-1)
    )
    :effect (and
      (not (at ?t)) (at ?t2)
      (not (in-transit-c2m))
      (not (rem-c2m-1))
      (agent-at marinadistrict)
    )
  )

  (:action start-move-m2c
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at ?t) (next ?t ?t2)
      (agent-at marinadistrict)
      (not (need-meet ?t))
      (not (in-transit-c2m))
      (not (in-transit-m2c))
    )
    :effect (and
      (not (at ?t)) (at ?t2)
      (not (agent-at marinadistrict))
      (in-transit-m2c)
      (rem-m2c-15)
    )
  )

  (:action step-move-m2c-15
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-15))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-15)) (rem-m2c-14))
  )
  (:action step-move-m2c-14
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-14))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-14)) (rem-m2c-13))
  )
  (:action step-move-m2c-13
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-13))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-13)) (rem-m2c-12))
  )
  (:action step-move-m2c-12
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-12))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-12)) (rem-m2c-11))
  )
  (:action step-move-m2c-11
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-11))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-11)) (rem-m2c-10))
  )
  (:action step-move-m2c-10
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-10))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-10)) (rem-m2c-9))
  )
  (:action step-move-m2c-9
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-9))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-9)) (rem-m2c-8))
  )
  (:action step-move-m2c-8
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-8))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-8)) (rem-m2c-7))
  )
  (:action step-move-m2c-7
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-7))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-7)) (rem-m2c-6))
  )
  (:action step-move-m2c-6
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-6))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-6)) (rem-m2c-5))
  )
  (:action step-move-m2c-5
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-5))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-5)) (rem-m2c-4))
  )
  (:action step-move-m2c-4
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-4))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-4)) (rem-m2c-3))
  )
  (:action step-move-m2c-3
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-3))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-3)) (rem-m2c-2))
  )
  (:action step-move-m2c-2
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-2))
    :effect (and (not (at ?t)) (at ?t2) (not (rem-m2c-2)) (rem-m2c-1))
  )

  (:action finish-move-m2c
    :parameters (?t - time ?t2 - time)
    :precondition (and (at ?t) (next ?t ?t2) (in-transit-m2c) (rem-m2c-1))
    :effect (and
      (not (at ?t)) (at ?t2)
      (not (in-transit-m2c))
      (not (rem-m2c-1))
      (agent-at chinatown)
    )
  )

  (:action meet-stephanie-next
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at ?t) (next ?t ?t2)
      (within-window ?t)
      (agent-at marinadistrict)
      (need-meet ?t)
      (chain-member ?t2)
      (not (met-stephanie-at-tk ?t))
    )
    :effect (and
      (not (at ?t)) (at ?t2)
      (met-stephanie-at-tk ?t)
      (not (need-meet ?t))
      (need-meet ?t2)
    )
  )

  (:action meet-stephanie-final
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at ?t) (next ?t ?t2)
      (within-window ?t)
      (agent-at marinadistrict)
      (need-meet ?t)
      (not (chain-member ?t2))
      (not (met-stephanie-at-tk ?t))
    )
    :effect (and
      (not (at ?t)) (at ?t2)
      (met-stephanie-at-tk ?t)
      (not (need-meet ?t))
    )
  )
)