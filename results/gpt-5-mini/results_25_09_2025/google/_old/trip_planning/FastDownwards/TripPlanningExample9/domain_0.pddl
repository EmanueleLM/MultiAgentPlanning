(define (domain integrated-trip)
  (:requirements :strips :typing :fluents :negative-preconditions :equality)
  (:types city day)

  (:predicates
    (direct ?from ?to - city)
    (at ?c - city ?d - day)
    (next ?d1 ?d2 - day)
    (assigned ?d - day)
  )

  (:functions
    (days-spent-frankfurt)
    (days-spent-bucharest)
    (days-spent-stuttgart)
  )

  ;; Traveler agent: choose a starting city for day d1
  (:action traveler-choose-start-frankfurt
    :parameters (?d1 - day)
    :precondition (and (not (assigned ?d1)))
    :effect (and (at frankfurt ?d1) (assigned ?d1) (increase (days-spent-frankfurt) 1))
  )

  (:action traveler-choose-start-bucharest
    :parameters (?d1 - day)
    :precondition (and (not (assigned ?d1)))
    :effect (and (at bucharest ?d1) (assigned ?d1) (increase (days-spent-bucharest) 1))
  )

  (:action traveler-choose-start-stuttgart
    :parameters (?d1 - day)
    :precondition (and (not (assigned ?d1)))
    :effect (and (at stuttgart ?d1) (assigned ?d1) (increase (days-spent-stuttgart) 1))
  )

  ;; Traveler agent: stay actions (remain in same city to next day)
  (:action traveler-stay-frankfurt
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (next ?d ?dnext) (not (assigned ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at frankfurt ?dnext) (assigned ?dnext) (increase (days-spent-frankfurt) 1))
  )

  (:action traveler-stay-bucharest
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (next ?d ?dnext) (not (assigned ?dnext)))
    :effect (and (not (at bucharest ?d)) (at bucharest ?dnext) (assigned ?dnext) (increase (days-spent-bucharest) 1))
  )

  (:action traveler-stay-stuttgart
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (next ?d ?dnext) (not (assigned ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at stuttgart ?dnext) (assigned ?dnext) (increase (days-spent-stuttgart) 1))
  )

  ;; Flight scheduler agent: flight actions (only for known direct flights)
  (:action scheduler-fly-bucharest-to-frankfurt
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (direct bucharest frankfurt) (next ?d ?dnext) (not (assigned ?dnext)))
    :effect (and (not (at bucharest ?d)) (at frankfurt ?dnext) (assigned ?dnext) (increase (days-spent-frankfurt) 1))
  )

  (:action scheduler-fly-frankfurt-to-bucharest
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt bucharest) (next ?d ?dnext) (not (assigned ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at bucharest ?dnext) (assigned ?dnext) (increase (days-spent-bucharest) 1))
  )

  (:action scheduler-fly-frankfurt-to-stuttgart
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt stuttgart) (next ?d ?dnext) (not (assigned ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at stuttgart ?dnext) (assigned ?dnext) (increase (days-spent-stuttgart) 1))
  )

  (:action scheduler-fly-stuttgart-to-frankfurt
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (direct stuttgart frankfurt) (next ?d ?dnext) (not (assigned ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at frankfurt ?dnext) (assigned ?dnext) (increase (days-spent-frankfurt) 1))
  )

)