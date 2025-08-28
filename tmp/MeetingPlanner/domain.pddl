(define (domain meeting-scheduler)
  (:requirement :strips :typing)
  (:types location friend)
  (:predicates 
    (at ?l - location)
    (free ?l - location)
    (visited ?f - friend)
    (scheduled-meeting ?f - friend ?l - location)
    (travelling ?f - friend ?l - location)
  )

  (:action travel
    :parameters (?from - location ?to - location ?f - friend)
    :precondition (and (at ?from) (not (at ?to)) (free ?to))
    :effect (and (not (at ?from)) (at ?to) (travelling ?f ?to))
  )

  (:action meet
    :parameters (?f - friend ?l - location)
    :precondition (and (at ?l) (free ?l) (not (visited ?f)))
    :effect (and (visited ?f) (scheduled-meeting ?f ?l) (not (free ?l)))
  )

  (:action conclude-meeting
    :parameters (?f - friend ?l - location)
    :precondition (scheduled-meeting ?f ?l)
    :effect (and (not (scheduled-meeting ?f ?l)) (free ?l))
  )
)