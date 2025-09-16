(define (domain MeetingSF)
  (:requirements :durative-actions :typing)
  (:types person location)
  (:constants NobHill TheCastro - location
              visitor william - person)
  (:predicates
     (at ?p - person ?l - location)
     (met ?p - person ?w - person)
     (waited)
  )
  (:durative-action travel-nobToCastro
     :parameters ()
     :duration 17
     :condition (at start (at visitor NobHill))
     :effect (and
        (not (at visitor NobHill))
        (at end (at visitor TheCastro))
     )
  )
  (:durative-action travel-castroToNobHill
     :parameters ()
     :duration 16
     :condition (at start (at visitor TheCastro))
     :effect (and
        (not (at visitor TheCastro))
        (at end (at visitor NobHill))
     )
  )
  (:durative-action wait-195
     :parameters ()
     :duration 195
     :condition (at start (at visitor TheCastro))
     :effect (waited)
  )
  (:durative-action meet-william
     :parameters ()
     :duration 75
     :condition (and (at start (at visitor TheCastro)) (at start (at william TheCastro)) (waited))
     :effect (met visitor william)
  )
)