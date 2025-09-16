```lisp
(define (domain coordinated-meeting)
  (:requirements :strips :typing)
  (:types person location time)
  
  (:predicates
    ;; Location predicates
    (at ?p - person ?l - location)
    
    ;; Availability and meeting predicates
    (available ?p - person ?t - time)
    (met ?p1 - person ?p2 - person)

    ;; Time predicates
    (time ?t - time)
  )
  
  ;; Actions for person "you"
  (:action travel-you
    :parameters (?p - person ?from - location ?to - location ?start - time ?end - time)
    :precondition (and
      (at ?p ?from)
      (time ?start)
      (time ?end)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  (:action meet-you
    :parameters (?p1 - person ?p2 - person ?loc - location ?start - time ?end - time)
    :precondition (and
      (at ?p1 ?loc)
      (at ?p2 ?loc)
      (available ?p1 ?start)
      (available ?p2 ?end)
      (time ?start)
      (time ?end)
      (>= (- ?end ?start) 120) ; Ensure meeting duration is at least 120 minutes
    )
    :effect (met ?p1 ?p2)
  )

  ;; Actions for person "stephanie"
  (:action travel-stephanie
    :parameters (?p - person ?from - location ?to - location ?travel_time - time)
    :precondition (and
      (at ?p ?from)
      (time ?travel_time)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  (:action meet-stephanie
    :parameters (?p1 - person ?p2 - person ?loc - location ?start ?end - time)
    :precondition (and
      (at ?p1 ?loc)
      (at ?p2 ?loc)
      (available ?p1 ?start)
      (available ?p2 ?end)
      (time ?start)
      (time ?end)
      (>= (- ?end ?start) 120) ; Ensure meeting duration is at least 120 minutes
    )
    :effect (met ?p1 ?p2)
  )
)
```