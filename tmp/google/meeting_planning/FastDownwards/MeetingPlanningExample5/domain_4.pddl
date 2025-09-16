(define (domain MeetingSF)
  (:requirements :typing)
  (:types location person)
  (:constants NobHill TheCastro - location
              visitor william - person)
  (:predicates
     (at ?p - person ?l - location)
     (met ?p - person ?w - person)
  )
  (:action travel-nobToCastro
     :parameters (?p - person)
     :precondition (at ?p NobHill)
     :effect (and
        (not (at ?p NobHill))
        (at ?p TheCastro))
  )
  (:action travel-castroToNobHill
     :parameters (?p - person)
     :precondition (at ?p TheCastro)
     :effect (and
        (not (at ?p TheCastro))
        (at ?p NobHill))
  )
  (:action meet-william
     :parameters ()
     :precondition (and (at visitor TheCastro)
                       (at william TheCastro))
     :effect (met visitor william)
  )
)