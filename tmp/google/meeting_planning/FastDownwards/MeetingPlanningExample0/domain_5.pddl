(define (domain meet-steph-twoagents-time)

  (:requirements :typing :durative-actions :numeric-fluents)

  (:types person location)

  (:predicates
     (at ?p - person ?l - location)
     (met ?pl - person ?sp - person)
  )

  (:functions clock)

  (:durative-action travel
     :parameters (?p - person ?from - location ?to - location)
     :duration (= ?duration 20)
     :condition (over all (at ?p ?from))
     :effect (and (not (at ?p ?from)) (at ?p ?to) (increase (clock) 20))
  )

  (:durative-action wait
     :parameters (?p - person ?l - location)
     :duration (= ?duration 70)
     :condition (over all (at ?p ?l))
     :effect (increase (clock) 70)
  )

  (:durative-action meet
     :parameters (?pl - person ?sp - person ?l - location)
     :duration (= ?duration 120)
     :condition (and (over all (at ?pl ?l)) (over all (at ?sp ?l)) (at start (>= (clock) 90)) (at start (<= (clock) 150)))
     :effect (and (met ?pl ?sp) (increase (clock) 120))
  )
)