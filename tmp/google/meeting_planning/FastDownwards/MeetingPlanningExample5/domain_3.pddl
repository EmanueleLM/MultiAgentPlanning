(define (domain MeetingSF)
  (:requirements :typing :durative-actions :numeric-fluents)
  (:types location person)
  (:constants NobHill TheCastro - location
              visitor william - person)
  (:functions (time))
  (:predicates
     (at ?p - person ?l - location)
     (met ?p - person ?w - person)
  )

  (:durative-action travel-nobToCastro
     :parameters ()
     :duration (= ?duration 17)
     :condition (and (at start (at visitor NobHill)))
     :effect (and
        (at end (not (at visitor NobHill)))
        (at end (at visitor TheCastro))
        (increase (time) 17)
     )
  )

  (:durative-action travel-castroToNobHill
     :parameters ()
     :duration (= ?duration 16)
     :condition (and (at start (at visitor TheCastro)))
     :effect (and
        (at end (not (at visitor TheCastro)))
        (at end (at visitor NobHill))
        (increase (time) 16)
     )
  )

  (:durative-action wait
     :parameters ()
     :duration (= ?duration 195)
     :condition (and)
     :effect (increase (time) 195)
  )

  (:durative-action meet-william
     :parameters ()
     :duration (= ?duration 75)
     :condition (and (at start (at visitor TheCastro))
                     (at start (at william TheCastro))
                     (>= (time) 195)
                     (<= (+ (time) 75) 780))
     :effect (and (at end (met visitor william))
                  (increase (time) 75))
  )
)