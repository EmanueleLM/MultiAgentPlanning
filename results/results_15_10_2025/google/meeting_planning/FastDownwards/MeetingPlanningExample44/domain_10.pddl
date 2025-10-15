(define (domain meeting-domain)
  (:requirements :typing :fluents :negative-preconditions :equality)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (is-traveler ?a - agent)
    (is-betty ?a - agent)
    (met-minimum)
  )

  (:functions
    (time)
    (total-travel)
  )

  (:action travel-ph-to-fw
    :parameters (?p - agent)
    :precondition (and
      (is-traveler ?p)
      (at ?p pacific)
    )
    :effect (and
      (not (at ?p pacific))
      (at ?p fishermans)
      (increase (time) 13)
      (increase (total-travel) 13)
    )
  )

  (:action travel-fw-to-ph
    :parameters (?p - agent)
    :precondition (and
      (is-traveler ?p)
      (at ?p fishermans)
    )
    :effect (and
      (not (at ?p fishermans))
      (at ?p pacific)
      (increase (time) 12)
      (increase (total-travel) 12)
    )
  )

  (:action meet-with-betty
    :parameters (?p - agent ?b - agent)
    :precondition (and
      (is-traveler ?p)
      (is-betty ?b)
      (at ?p fishermans)
      (at ?b fishermans)
      (not (met-minimum))
      (>= (time) 525)        ; Betty earliest available 08:45 = 525
      (<= (time) 975)        ; latest start to allow 105 min before 18:00 (1080 - 105 = 975)
    )
    :effect (and
      (met-minimum)
      (increase (time) 105)
    )
  )
)