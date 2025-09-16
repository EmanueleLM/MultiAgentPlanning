(define (domain integrated-meeting-discretized)
  (:requirements :typing)
  (:types person location time-step)

  (:constants Presidio MarinaDistrict - location
              visitor jessica - person
              t0 t1 t2 t3 t4 t5 t6 - time-step)

  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person ?q - person)
    (time-at ?t - time-step)
    (meeting-progress-1)
    (meeting-progress-2)
    (meeting-progress-3)
    (meeting-progress-4)
    (meeting-progress-5)
    (meeting-progress-6)
  )

  ;; Visitor travels Presidio -> Marina (A)
  (:action travel-presidio-to-marina-A-t0
     :parameters (?p - person)
     :precondition (and (time-at t0) (at ?p Presidio))
     :effect (and
       (not (at ?p Presidio))
       (at ?p MarinaDistrict)
       (not (time-at t0))
       (time-at t1))
  )
  (:action travel-presidio-to-marina-A-t1
     :parameters (?p - person)
     :precondition (and (time-at t1) (at ?p Presidio))
     :effect (and
       (not (at ?p Presidio))
       (at ?p MarinaDistrict)
       (not (time-at t1))
       (time-at t2))
  )
  (:action travel-presidio-to-marina-A-t2
     :parameters (?p - person)
     :precondition (and (time-at t2) (at ?p Presidio))
     :effect (and
       (not (at ?p Presidio))
       (at ?p MarinaDistrict)
       (not (time-at t2))
       (time-at t3))
  )
  (:action travel-presidio-to-marina-A-t3
     :parameters (?p - person)
     :precondition (and (time-at t3) (at ?p Presidio))
     :effect (and
       (not (at ?p Presidio))
       (at ?p MarinaDistrict)
       (not (time-at t3))
       (time-at t4))
  )
  (:action travel-presidio-to-marina-A-t4
     :parameters (?p - person)
     :precondition (and (time-at t4) (at ?p Presidio))
     :effect (and
       (not (at ?p Presidio))
       (at ?p MarinaDistrict)
       (not (time-at t4))
       (time-at t5))
  )
  (:action travel-presidio-to-marina-A-t5
     :parameters (?p - person)
     :precondition (and (time-at t5) (at ?p Presidio))
     :effect (and
       (not (at ?p Presidio))
       (at ?p MarinaDistrict)
       (not (time-at t5))
       (time-at t6))
  )

  ;; Visitor moves Marina -> Presidio (A) — optional backtrack actions
  (:action travel-marina-to-presidio-A-t0
     :parameters (?p - person)
     :precondition (and (time-at t0) (at ?p MarinaDistrict))
     :effect (and
       (not (at ?p MarinaDistrict))
       (at ?p Presidio)
       (not (time-at t0))
       (time-at t1))
  )
  (:action travel-marina-to-presidio-A-t1
     :parameters (?p - person)
     :precondition (and (time-at t1) (at ?p MarinaDistrict))
     :effect (and
       (not (at ?p MarinaDistrict))
       (at ?p Presidio)
       (not (time-at t1))
       (time-at t2))
  )
  (:action travel-marina-to-presidio-A-t2
     :parameters (?p - person)
     :precondition (and (time-at t2) (at ?p MarinaDistrict))
     :effect (and
       (not (at ?p MarinaDistrict))
       (at ?p Presidio)
       (not (time-at t2))
       (time-at t3))
  )
  (:action travel-marina-to-presidio-A-t3
     :parameters (?p - person)
     :precondition (and (time-at t3) (at ?p MarinaDistrict))
     :effect (and
       (not (at ?p MarinaDistrict))
       (at ?p Presidio)
       (not (time-at t3))
       (time-at t4))
  )
  (:action travel-marina-to-presidio-A-t4
     :parameters (?p - person)
     :precondition (and (time-at t4) (at ?p MarinaDistrict))
     :effect (and
       (not (at ?p MarinaDistrict))
       (at ?p Presidio)
       (not (time-at t4))
       (time-at t5))
  )
  (:action travel-marina-to-presidio-A-t5
     :parameters (?p - person)
     :precondition (and (time-at t5) (at ?p MarinaDistrict))
     :effect (and
       (not (at ?p MarinaDistrict))
       (at ?p Presidio)
       (not (time-at t5))
       (time-at t6))
  )

  ;; Jessica travels Presidio -> Marina (B)
  (:action travel-presidio-to-marina-B-t0
     :parameters (?p - person)
     :precondition (and (time-at t0) (at ?p Presidio))
     :effect (and
       (not (at ?p Presidio))
       (at ?p MarinaDistrict)
       (not (time-at t0))
       (time-at t1))
  )
  (:action travel-presidio-to-marina-B-t1
     :parameters (?p - person)
     :precondition (and (time-at t1) (at ?p Presidio))
     :effect (and
       (not (at ?p Presidio))
       (at ?p MarinaDistrict)
       (not (time-at t1))
       (time-at t2))
  )
  (:action travel-presidio-to-marina-B-t2
     :parameters (?p - person)
     :precondition (and (time-at t2) (at ?p Presidio))
     :effect (and
       (not (at ?p Presidio))
       (at ?p MarinaDistrict)
       (not (time-at t2))
       (time-at t3))
  )
  (:action travel-presidio-to-marina-B-t3
     :parameters (?p - person)
     :precondition (and (time-at t3) (at ?p Presidio))
     :effect (and
       (not (at ?p Presidio))
       (at ?p MarinaDistrict)
       (not (time-at t3))
       (time-at t4))
  )
  (:action travel-presidio-to-marina-B-t4
     :parameters (?p - person)
     :precondition (and (time-at t4) (at ?p Presidio))
     :effect (and
       (not (at ?p Presidio))
       (at ?p MarinaDistrict)
       (not (time-at t4))
       (time-at t5))
  )
  (:action travel-presidio-to-marina-B-t5
     :parameters (?p - person)
     :precondition (and (time-at t5) (at ?p Presidio))
     :effect (and
       (not (at ?p Presidio))
       (at ?p MarinaDistrict)
       (not (time-at t5))
       (time-at t6))
  )

  ;; Jessica travels Marina -> Presidio (B)
  (:action travel-marina-to-presidio-B-t0
     :parameters (?p - person)
     :precondition (and (time-at t0) (at ?p MarinaDistrict))
     :effect (and
       (not (at ?p MarinaDistrict))
       (at ?p Presidio)
       (not (time-at t0))
       (time-at t1))
  )
  (:action travel-marina-to-presidio-B-t1
     :parameters (?p - person)
     :precondition (and (time-at t1) (at ?p MarinaDistrict))
     :effect (and
       (not (at ?p MarinaDistrict))
       (at ?p Presidio)
       (not (time-at t1))
       (time-at t2))
  )
  (:action travel-marina-to-presidio-B-t2
     :parameters (?p - person)
     :precondition (and (time-at t2) (at ?p MarinaDistrict))
     :effect (and
       (not (at ?p MarinaDistrict))
       (at ?p Presidio)
       (not (time-at t2))
       (time-at t3))
  )
  (:action travel-marina-to-presidio-B-t3
     :parameters (?p - person)
     :precondition (and (time-at t3) (at ?p MarinaDistrict))
     :effect (and
       (not (at ?p MarinaDistrict))
       (at ?p Presidio)
       (not (time-at t3))
       (time-at t4))
  )
  (:action travel-marina-to-presidio-B-t4
     :parameters (?p - person)
     :precondition (and (time-at t4) (at ?p MarinaDistrict))
     :effect (and
       (not (at ?p MarinaDistrict))
       (at ?p Presidio)
       (not (time-at t4))
       (time-at t5))
  )
  (:action travel-marina-to-presidio-B-t5
     :parameters (?p - person)
     :precondition (and (time-at t5) (at ?p MarinaDistrict))
     :effect (and
       (not (at ?p MarinaDistrict))
       (at ?p Presidio)
       (not (time-at t5))
       (time-at t6))
  )

  ;; Wait actions to advance time
  (:action wait-t1-to-t2
     :precondition (time-at t1)
     :effect (and
       (not (time-at t1))
       (time-at t2))
  )
  (:action wait-t2-to-t3
     :precondition (time-at t2)
     :effect (and
       (not (time-at t2))
       (time-at t3))
  )
  (:action wait-t3-to-t4
     :precondition (time-at t3)
     :effect (and
       (not (time-at t3))
       (time-at t4))
  )
  (:action wait-t4-to-t5
     :precondition (time-at t4)
     :effect (and
       (not (time-at t4))
       (time-at t5))
  )
  (:action wait-t5-to-t6
     :precondition (time-at t5)
     :effect (and
       (not (time-at t5))
       (time-at t6))
  )

  ;; Meeting progression chain (60 minutes represented by 6 steps)
  (:action meet-progress-1-at-t1
     :parameters (?p - person ?q - person)
     :precondition (and (time-at t1) (at visitor MarinaDistrict))
     :effect (meeting-progress-1)
  )
  (:action meet-progress-2-at-t2
     :parameters (?p - person ?q - person)
     :precondition (and (time-at t2) (meeting-progress-1) (at jessica MarinaDistrict))
     :effect (meeting-progress-2)
  )
  (:action meet-progress-3-at-t3
     :parameters (?p - person ?q - person)
     :precondition (and (time-at t3) (meeting-progress-2) (at visitor MarinaDistrict))
     :effect (meeting-progress-3)
  )
  (:action meet-progress-4-at-t4
     :parameters (?p - person ?q - person)
     :precondition (and (time-at t4) (meeting-progress-3) (at jessica MarinaDistrict))
     :effect (meeting-progress-4)
  )
  (:action meet-progress-5-at-t5
     :parameters (?p - person ?q - person)
     :precondition (and (time-at t5) (meeting-progress-4) (at visitor MarinaDistrict))
     :effect (meeting-progress-5)
  )
  (:action meet-progress-6-at-t6
     :parameters (?p - person ?q - person)
     :precondition (and (time-at t6) (meeting-progress-5) (at jessica MarinaDistrict))
     :effect (meeting-progress-6)
  )
  (:action complete-meeting-at-t6
     :parameters (?p - person ?q - person)
     :precondition (and (time-at t6) (meeting-progress-6))
     :effect (met visitor jessica)
  )
)