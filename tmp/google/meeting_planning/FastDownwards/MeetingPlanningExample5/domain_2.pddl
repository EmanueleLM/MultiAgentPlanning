(define (domain MeetingSF)
  (:requirements :typing)
  (:types person location)
  (:constants NobHill TheCastro - location
              visitor william - person)
  (:predicates
     (at ?p - person ?l - location)
     (met ?p - person ?w - person)
  )
  (:action travel-nobToCastro
     :parameters ()
     :precondition (at visitor NobHill)
     :effect (and
        (not (at visitor NobHill))
        (at visitor TheCastro))
  )
  (:action travel-castroToNobHill
     :parameters ()
     :precondition (at visitor TheCastro)
     :effect (and
        (not (at visitor TheCastro))
        (at visitor NobHill))
  )
  (:action meet-william
     :parameters ()
     :precondition (and (at visitor TheCastro) (at william TheCastro))
     :effect (met visitor william)
  )
)