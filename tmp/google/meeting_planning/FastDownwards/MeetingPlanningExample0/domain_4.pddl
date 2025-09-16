(define (domain meet-steph-twoagents)

  (:requirements :typing)

  (:types person location)

  (:predicates
     (at ?p - person ?l - location)
     (met ?pl - person ?sp - person)
  )

  (:action travel
     :parameters (?p - person ?from - location ?to - location)
     :precondition (at ?p ?from)
     :effect (and (not (at ?p ?from)) (at ?p ?to))
  )

  (:action meet-steph
     :parameters (?pl - person ?sp - person ?l - location)
     :precondition (and (at ?pl ?l) (at ?sp ?l))
     :effect (met ?pl ?sp)
  )
)