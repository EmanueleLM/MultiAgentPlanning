(define (domain meeting-planning-example8)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location minute count)
  (:predicates
    (at ?l - location)
    (now ?t - minute)
    (next ?t1 - minute ?t2 - minute)
    (steph-available ?t - minute)
    (traveling-c2m)
    (traveling-m2c)
    (elapsed-c2m ?c - count)
    (elapsed-m2c ?c - count)
    (next-count ?c1 - count ?c2 - count)
    (met-count ?c - count)
    (in-meeting)
  )
  (:functions (total-cost))

  ; Start travel from Chinatown to Marina (12 minutes total)
  (:action start-travel-c2m
    :precondition (and (at chinatown) (not (traveling-c2m)) (not (traveling-m2c)))
    :effect (and (not (at chinatown)) (traveling-c2m) (elapsed-c2m c0))
  )

  (:action travel-advance-c2m
    :parameters (?t - minute ?t2 - minute ?c - count ?c2 - count)
    :precondition (and (traveling-c2m) (elapsed-c2m ?c) (next-count ?c ?c2) (now ?t) (next ?t ?t2))
    :effect (and (not (elapsed-c2m ?c)) (elapsed-c2m ?c2) (not (now ?t)) (now ?t2) (increase (total-cost) 1))
  )

  (:action complete-travel-c2m
    :precondition (and (traveling-c2m) (elapsed-c2m c12))
    :effect (and (not (traveling-c2m)) (not (elapsed-c2m c12)) (at marina_district))
  )

  ; Start travel from Marina to Chinatown (16 minutes total)
  (:action start-travel-m2c
    :precondition (and (at marina_district) (not (traveling-c2m)) (not (traveling-m2c)))
    :effect (and (not (at marina_district)) (traveling-m2c) (elapsed-m2c c0))
  )

  (:action travel-advance-m2c
    :parameters (?t - minute ?t2 - minute ?c - count ?c2 - count)
    :precondition (and (traveling-m2c) (elapsed-m2c ?c) (next-count ?c ?c2) (now ?t) (next ?t ?t2))
    :effect (and (not (elapsed-m2c ?c)) (elapsed-m2c ?c2) (not (now ?t)) (now ?t2) (increase (total-cost) 1))
  )

  (:action complete-travel-m2c
    :precondition (and (traveling-m2c) (elapsed-m2c c16))
    :effect (and (not (traveling-m2c)) (not (elapsed-m2c c16)) (at chinatown))
  )

  ; Idle wait advancing time by one minute (only when not in transit or in a meeting)
  (:action wait
    :parameters (?t - minute ?t2 - minute)
    :precondition (and (now ?t) (next ?t ?t2) (not (traveling-c2m)) (not (traveling-m2c)) (not (in-meeting)))
    :effect (and (not (now ?t)) (now ?t2) (increase (total-cost) 1))
  )

  ; Begin meeting with Stephanie (only once, before accumulating minutes)
  (:action begin-meeting
    :parameters (?t - minute)
    :precondition (and (at marina_district) (now ?t) (steph-available ?t) (met-count c0) (not (in-meeting)) (not (traveling-c2m)) (not (traveling-m2c)))
    :effect (in-meeting)
  )

  ; Accumulate one minute of meeting with Stephanie (must be within availability)
  (:action meet-step
    :parameters (?t - minute ?t2 - minute ?c - count ?c2 - count)
    :precondition (and (in-meeting) (at marina_district) (now ?t) (next ?t ?t2) (steph-available ?t) (met-count ?c) (next-count ?c ?c2))
    :effect (and (not (now ?t)) (now ?t2) (not (met-count ?c)) (met-count ?c2) (increase (total-cost) 1))
  )

  ; Optionally end the meeting after reaching the required minutes
  (:action end-meeting
    :precondition (and (in-meeting) (met-count c105))
    :effect (not (in-meeting))
  )
)